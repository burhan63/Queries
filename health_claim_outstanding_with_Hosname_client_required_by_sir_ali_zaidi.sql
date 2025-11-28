-- Health Claim Outstanding with Hospital Name --
SELECT *
           FROM (SELECT DISTINCT C.CLAIM_CODE, C.LOSS_DATE, A.PERIOD_FROM, A.PERIOD_TO_DATE, ILT.LOSS_DESCRIPTIONS, ICS.SURVEYOR_CODE,(SELECT PARTTAKER_NAME FROM INS_PARTTAKER WHERE PARTTAKER_CODE=ICS.SURVEYOR_CODE) SURVEYOR,
                                 A.ASSORTED_CODE, A.TAKAFUL_TYPE,
--                                 SUBSTR(A.ASSORTED_STRING, 14, 10) ASSORTED_STRING,
                                   func_assorted_string(a.assorted_code) ASSORTED_STRING,
                                 SUBSTR(CLAIM_STRING, 18, 10) CLAIM_STRING,
                                 B.BRANCH_NAME,
                                 IC.CLASS_NAME,
                                 P.PARTTAKER_NAME INSURED_NAME,
                                 NVL(RES_DATA.RES_AMT,0) RESERVED,
                                 NVL(PAID_DATA.PAID_AMT,0) PAID,
                                 NVL(RES_DATA.RES_AMT, 0) -
                                 NVL(PAID_DATA.PAID_AMT, 0) OS,
                                 NVL(DUE_AMT,0) DUE_AMT,CLAIM_INTIMATION_DATE,

(select nvl(admission_date,opd_treatment_date) START_DATE
 from ins_claim_detail 
 where claim_code= c.claim_code) START_DATE,
 
 
(select nvl(DISCHARGE_DATE,Opd_Treatment_To_Date) END_DATE
 from ins_claim_detail 
 where claim_code= c.claim_code) END_DATE,

                                 (select hospital_name from ins_claim_detail
                                 where claim_code = c.claim_code)hos_name,
                                
                                                 (SELECT NAME FROM INS_HEALTH_EMPLOYEE_INFO
                                                 WHERE EMP_CODE = C.REFERENCE_CODE) PAT_NAME,
                                                 (SELECT NAME FROM INS_HEALTH_EMPLOYEE_INFO
                                                 WHERE EMP_CODE = (SELECT NVL(PARENT_EMP_CODE,EMP_CODE)
                                                 FROM INS_HEALTH_EMPLOYEE_INFO
                                                 WHERE EMP_CODE = C.REFERENCE_CODE)) EMP_NAME,
                                                 
                                                 ic_stat.status_desc,ic_source.claim_source_name,
                                                 ipp.parttaker_name parent_name,
                                                 c.claim_rcv_date,c.claim_amount,
                                                 (SELECT health_id FROM INS_HEALTH_EMPLOYEE_INFO
                                                 WHERE EMP_CODE = C.REFERENCE_CODE) health_id
                                                 
                                                 
                   FROM INS_CLAIM C,
                        INS_ASSORTED A,
                        INS_PARTTAKER P,
                        INS_BRANCH B,
                        INS_POLICY_TYPES IPC,
                        INS_POLICY_CLASS IC,
                        INS_CLAIM_SERVEYOR ICS,
                        INS_LOSS_TYPES ILT,
                        INS_PARTTAKER IPP, 
                          INS_CLAIM_STATUS IC_STAT,
                        INS_CLAIM_SOURCE IC_SOURCE,
                        (SELECT SUM(REC_AMOUNT) PAID_AMT, IC.CLAIM_CODE

                           FROM INS_ASSORTED       IA,
                                INS_POLICY_TYPES   IPT,
                                INS_POLICY_CLASS   IPC,
                                INS_PREMIUM_MAST   IPM,
                                INS_PREMIUM_DET    IPD,
                                INS_CLAIM_DUE_INFO ICD,
                                INS_CLAIM          IC
                          WHERE IPM.PREMIUM_RCV_CODE = IPD.PREMIUM_RCV_CODE
                            AND IPD.ASSORTED_CODE = IA.ASSORTED_CODE
                            AND NVL(IPM.SEQNO, 0) <> 0
                            AND IPD.MODE_CODE = '01'
                            AND trunc(IPM.VOUCHER_DATE)<=
                                TO_DATE('12/01/2025', 'DD/MM/YYYY')
                            AND IA.POLICY_TYPE_CODE = IPT.POLICY_TYPE_CODE
                            AND IPT.CLASS_CODE = IPC.CLASS_CODE
                            AND ICD.CLAIM_INFO_CODE = IPD.CLAIM_INFO_CODE
                            AND ICD.CLAIM_CODE = IC.CLAIM_CODE
                          GROUP BY IC.CLAIM_CODE

                         ) PAID_DATA,
                        (SELECT SUM(RESERVED_AMOUNT) RES_AMT, A.CLAIM_CODE
                           FROM INS_CLAIM          A,
                                INS_CLAIM_RESERVED B,
                                INS_ASSORTED       IA,
                                INS_POLICY_CLASS   IPC
                          WHERE A.CLAIM_CODE = B.CLAIM_CODE
                            AND SUBSTR(CLAIM_STRING, 10, 1) =
                                TO_NUMBER(IPC.CLASS_CODE)
                            AND IA.ASSORTED_CODE = A.INSURANCE_TYPE
                            AND trunc(B.SUP_DATE) <= TO_DATE('12/01/2025', 'DD/MM/YYYY')
                          GROUP BY A.CLAIM_CODE) RES_DATA,
                          
                          (SELECT SUM(due_amount - nvl(salvage_amount,0)) due_AMT, A.CLAIM_CODE
                           FROM INS_CLAIM          A,
                                ins_claim_due_info B,ins_claim_dues c,
                                INS_ASSORTED       IA,
                                INS_POLICY_CLASS   IPC
                          WHERE A.CLAIM_CODE = B.CLAIM_CODE
                            AND SUBSTR(CLAIM_STRING, 10, 1) =
                                TO_NUMBER(IPC.CLASS_CODE)
                            AND IA.ASSORTED_CODE = A.INSURANCE_TYPE
                            and  B.CLAIM_INFO_CODE = C.CLAIM_INFO_CODE
                            AND  B.SUP_BY IS NOT NULL
                            AND trunc(B.SUP_DATE) <= TO_DATE('12/01/2025', 'DD/MM/YYYY')
                          GROUP BY A.CLAIM_CODE) DUE_DATA
                  WHERE A.ASSORTED_CODE = C.INSURANCE_TYPE
                    AND A.CLIENT_CODE = P.PARTTAKER_CODE
                    AND A.BRANCH_CODE = B.BRANCH_CODE
                    AND C.CLAIM_CODE = ICS.CLAIM_CODE(+)
                    AND C.LOSS_TYPE_CODE = ILT.LOSS_TYPE_CODE
                    AND A.POLICY_TYPE_CODE = IPC.POLICY_TYPE_CODE
                    AND IPC.CLASS_CODE = IC.CLASS_CODE
                    AND C.CLAIM_CODE = PAID_DATA.CLAIM_CODE(+)
                    AND C.CLAIM_CODE = RES_DATA.CLAIM_CODE(+)
                    AND C.CLAIM_CODE = DUE_DATA.CLAIM_CODE (+)
                    AND P.PARTTAKER_CODE = IPP.PARTTAKER_CODE 
                    AND ( NVL(RES_DATA.RES_AMT,0)<>0 OR NVL(PAID_DATA.PAID_AMT,0)<>0)


                        AND (IC.CLASS_CODE = '08' OR '08' = '08')
                        AND (B.BRANCH_CODE='00' OR '00' = '00')
                        AND (ILT.LOSS_TYPE_CODE='00' OR '00'='00')
                        AND (ICS.SURVEYOR_CODE='00' OR '00'='00')
                        AND (P.PARTTAKER_CODE='00' OR '00'='00')
                        AND (IPP.PARTTAKER_CODE='00' OR '00'='00')

                         AND (IC_STAT.CLAIM_STATUS_ID='00' OR '00'='00')
                         AND IC_STAT.CLAIM_STATUS_ID = C.CLAIM_STATUS_ID
                         AND (IC_SOURCE.CLAIM_SOURCE='0' OR '0'='0')
                         AND IC_SOURCE.CLAIM_SOURCE = C.CLAIM_SOURCE
)
ORDER BY SUBSTR(CLAIM_STRING,18,10)

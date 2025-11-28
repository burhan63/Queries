SELECT 

 (SELECT PARTTAKER_NAME FROM INS_PARTTAKER WHERE PARTTAKER_CODE= IA.CHANNEL_CODE AND CATEGORY_PARTTAKER_CODE ='30') CHANNEL_NAME,
 (SELECT PARTTAKER_NAME FROM INS_PARTTAKER WHERE PARTTAKER_CODE= IA.DEALER_CODE AND CATEGORY_PARTTAKER_CODE ='31') DEALER_NAME,
    IZ.ZONE_NAME,IA.ASSORTEd_CODE,nvl(IA.FRR,'FRE')FRR, FUNC_REN_FRESH(NVL(IA.POLICY_CODE, IA.ASSORTED_CODE)) FRESH_RENEW,
       FUNC_ASSORTED_STRING(nvl(IA.policy_code, IA.assorted_code)) POLICY_STRING,
       FUNC_ASSORTED_STRING(decode(IA.document_code, '05', IA.assorted_CODE))ENDORSEMENT_STRING,
       replace(ipc.abbreviation,'/') Clss_Name, 
--by akhlaq on 03/11/2015
       IA.TAKAFUL_TYPE,
       NVL(IA.INSURED_NAME, P.PARTTAKER_NAME) INSURED_NAME,
       IA.CLIENT_CODE,
       initcap(p.PARTTAKER_NAME) client_name,
       IA.AGENCY_CODE AGENCY_CODE, AG.PARTTAKER_NAME AGENCY_NAME ,
--By akhlaq ahmed on 09/11/2015
       decode(ipc.class_code,'02',func_get_veh_date(ia.assorted_code,'F'), IA.PERIOD_FROM)PERIOD_FROM,
       decode(ipc.class_code,'02',func_get_veh_date(ia.assorted_code,'T'),IA.PERIOD_TO_DATE)PERIOD_TO_DATE,
       
       IA.ISSUE_DATE,
       NET.NCONT,
       NET.COINS_CODE,
       GROSS.GCONT,
       GROSS.COINS_CODE,
       NET.CONTRIBUTION,
       CAT.ADMIN_SC,
       CAT.STAMP_DUTY,
       CAT.FIF,
       CAT.FED,
       CAT.DC,
       IA.DOCUMENT_CODE,
       NVL(FUNC_TRACKER_AMOUNT(IA.ASSORTED_CODE, IA.DOCUMENT_CODE),0) TRACKER_AMOUNT,
       decode(gross.coins_code,'11000003',NVL(FUNC_TRACKER_AMT_WITHOUT_TAX(IA.ASSORTED_CODE, IA.DOCUMENT_CODE),0),0) TRACKER_AMOUNT_WITHOUT_TAX,
       decode(gross.coins_code,'11000003',NVL(FUNC_TRACKER_TAX_AMOUNT(IA.ASSORTED_CODE, IA.DOCUMENT_CODE),0),0) TRACKER_TAX_AMOUNT,
       FUNC_TRACKER_CODE(IA.ASSORTED_CODE, IA.DOCUMENT_CODE) TRACKER_COMPANY_CODE,
       FUNC_TRACKER_NAME(IA.ASSORTED_CODE, IA.DOCUMENT_CODE) TRACKER_NAME,'A'A,
             (CASE
          WHEN (IPT.CLASS_CODE = '05' AND IA.DOCUMENT_CODE = '05') OR IPT.CLASS_CODE = '03' THEN
            mis_sumcovered_func_uw(IA.POLICY_TYPE_CODE,
                                 IA.ASSORTED_CODE,
                                 IA.DOCUMENT_CODE)
           ELSE                      
          NVL(SUM_COV.SC,
              DECODE(IA.TAKAFUL_TYPE,
                     'L',
                     DECODE(NET.COINS_CODE,
                            '11000003',
                            mis_sumcovered_func(IA.POLICY_TYPE_CODE,
                                                IA.ASSORTED_CODE,
                                                IA.DOCUMENT_CODE) *
                            NET.CONTRIBUTION / 100,
                            mis_sumcovered_func(IA.POLICY_TYPE_CODE,
                                                IA.ASSORTED_CODE,
                                                IA.DOCUMENT_CODE) *
                            NET.CONTRIBUTION / 100 * -1),

                     mis_sumcovered_func(IA.POLICY_TYPE_CODE,
                                         IA.ASSORTED_CODE,
                                         IA.DOCUMENT_CODE) * NET.CONTRIBUTION / 100))               
 
       END) SUM_COVERED                      
       ,DEFF_COMM_AMT, DEFF_COMM.AGENCY_CODE
  FROM (
SELECT SUM(NET) Ncont, A.ASSORTED_CODE, COINS_CODE, CONTRIBUTION
          FROM ( 
          
         SELECT DECODE(B.CLASS_CODE,
                              '01',
                              DECODE(A.DOCUMENT_CODE,
                                     '04',
                                     NVL(AMOUNT, 0),
                                     NVL(AMOUNT, 0) - NVL(PREV_AMOUNT, 0)),
                              NVL(AMOUNT, 0) - NVL(PREV_AMOUNT, 0)) NET,
                       A.ASSORTED_CODE,
                       '11000003' COINS_CODE,
                       IC.CONTRIBUTION
                  FROM INS_PREMIUM      P,
                       INS_CHARGES      C,
                       INS_ASSORTED     A,
                       INS_POLICY_TYPES B,
                       INS_COINSURANCES IC
                
                 WHERE P.CHARGE_CODE = C.CHARGE_CODE
                   AND REFERENCE_CODE = A.ASSORTED_CODE                  
                   AND CHARGE_CATEGORY_CODE = '23'  
                   AND A.DOCUMENT_CODE = '05'  
                   AND A.POLICY_TYPE_CODE = B.POLICY_TYPE_CODE
                   AND IC.ASSORTED_CODE = A.ASSORTED_CODE
                   AND IC.COINSURANCE_CODE = '11000003'
                   AND A.TAKAFUL_TYPE = 'L'
                   AND ((A.DOCUMENT_CODE = '05' AND A.ISSUE_DATE BETWEEN TO_DATE('01/01/2025','dd/MM/yyyy') AND TO_DATE('31/03/2025','dd/MM/yyyy') ) OR
                                (A.DOCUMENT_CODE <> '05' AND A.POLICY_DATE BETWEEN TO_DATE('01/01/2025','dd/MM/yyyy') AND TO_DATE('31/03/2025','dd/MM/yyyy') ))
          UNION ALL
          SELECT DECODE(B.CLASS_CODE,
                              '01',
                              DECODE(A.DOCUMENT_CODE,
                                     '04',
                                     NVL(AMOUNT, 0),
                                     NVL(AMOUNT, 0) - NVL(PREV_AMOUNT, 0)),
                              NVL(AMOUNT, 0) - NVL(PREV_AMOUNT, 0))  NET,
                       A.ASSORTED_CODE,
                       COINSURANCE_CODE COINS_CODE,
                       IC.CONTRIBUTION
                
                --(NVL(AMOUNT, 0) - NVL(PREV_AMOUNT, 0)) * (-1),A.ASSORTED_CODE
                  FROM INS_PREMIUM      P,
                       INS_CHARGES      C,
                       INS_ASSORTED     A,
                       INS_COINSURANCES IC,
                       INS_POLICY_TYPES B
                
                 WHERE P.CHARGE_CODE = C.CHARGE_CODE
                   AND A.ASSORTED_CODE = IC.ASSORTED_CODE
                   AND A.POLICY_TYPE_CODE = B.POLICY_TYPE_CODE
                   AND REFERENCE_CODE = A.ASSORTED_CODE || IC.ORDER_NO
                   AND CHARGE_CATEGORY_CODE = '31'
                   and charge_category_code != '23'
                   AND IC.COINSURANCE_CODE = COMPANY_CODE
                   AND A.TAKAFUL_TYPE = 'L'
                   AND ((A.DOCUMENT_CODE = '05' AND A.ISSUE_DATE BETWEEN TO_DATE('01/01/2025','dd/MM/yyyy') AND TO_DATE('31/03/2025','dd/MM/yyyy') ) OR
                                (A.DOCUMENT_CODE <> '05' AND A.POLICY_DATE BETWEEN TO_DATE('01/01/2025','dd/MM/yyyy') AND TO_DATE('31/03/2025','dd/MM/yyyy') ))
                UNION ALL
                SELECT DECODE(B.CLASS_CODE,
                              '01',
                              DECODE(A.DOCUMENT_CODE,
                                     '04',
                                     NVL(AMOUNT, 0),
                                     NVL(AMOUNT, 0) - NVL(PREV_AMOUNT, 0)),
                              NVL(AMOUNT, 0) - NVL(PREV_AMOUNT, 0)) NET,
                       A.ASSORTED_CODE,
                       '11000003',
                       100
                
                --NVL(AMOUNT, 0) - NVL(PREV_AMOUNT, 0),A.ASSORTED_CODE
                  FROM INS_PREMIUM      P,
                       INS_CHARGES      C,
                       INS_ASSORTED     A,
                       INS_POLICY_TYPES B
                 WHERE P.CHARGE_CODE = C.CHARGE_CODE
                   AND REFERENCE_CODE = A.ASSORTED_CODE
                   AND A.POLICY_TYPE_CODE = B.POLICY_TYPE_CODE
                   AND ((B.CLASS_CODE IN ('04', '05', '07') AND
                       CHARGE_CATEGORY_CODE = '24') OR
                       (B.CLASS_CODE NOT IN ('04', '05', '07') AND
                       CHARGE_CATEGORY_CODE = '31'))
                   AND A.TAKAFUL_TYPE = 'D'
                   AND ((A.DOCUMENT_CODE = '05' AND A.ISSUE_DATE BETWEEN TO_DATE('01/01/2025','dd/MM/yyyy') AND TO_DATE('31/03/2025','dd/MM/yyyy') ) OR
                                (A.DOCUMENT_CODE <> '05' AND A.POLICY_DATE BETWEEN TO_DATE('01/01/2025','dd/MM/yyyy') AND TO_DATE('31/03/2025','dd/MM/yyyy') ))
                UNION ALL
                SELECT DECODE(B.CLASS_CODE,
                              '01',
                              DECODE(A.DOCUMENT_CODE,
                                     '04',
                                     NVL(AMOUNT, 0),
                                     NVL(AMOUNT, 0) - NVL(PREV_AMOUNT, 0)),
                              NVL(AMOUNT, 0) - NVL(PREV_AMOUNT, 0)) NET,
                       A.ASSORTED_CODE,
                       '11000003',
                       IC.CONTRIBUTION
                
                --(NVL(AMOUNT, 0) - NVL(PREV_AMOUNT, 0)),A.ASSORTED_CODE
                  FROM INS_PREMIUM      P,
                       INS_CHARGES      C,
                       INS_ASSORTED     A,
                       INS_COINSURANCES IC,
                       INS_POLICY_TYPES B
                 WHERE P.CHARGE_CODE = C.CHARGE_CODE
                   AND A.ASSORTED_CODE = IC.ASSORTED_CODE
                   AND REFERENCE_CODE = A.ASSORTED_CODE || IC.ORDER_NO
                   AND CHARGE_CATEGORY_CODE = '31'
                   AND IC.COINSURANCE_CODE = COMPANY_CODE
                   AND A.TAKAFUL_TYPE = 'F'
                   AND A.POLICY_TYPE_CODE = B.POLICY_TYPE_CODE
                   AND ((A.DOCUMENT_CODE = '05' AND A.ISSUE_DATE BETWEEN TO_DATE('01/01/2025','dd/MM/yyyy') AND TO_DATE('31/03/2025','dd/MM/yyyy') ) OR
                                (A.DOCUMENT_CODE <> '05' AND A.POLICY_DATE BETWEEN TO_DATE('01/01/2025','dd/MM/yyyy') AND TO_DATE('31/03/2025','dd/MM/yyyy') ))
                ) A,
               INS_ASSORTED B
        
         WHERE A.ASSORTED_CODE = B.ASSORTED_CODE
           AND B.DOCUMENT_CODE IN ('04', '05', '06', '07','01')
         GROUP BY A.ASSORTED_CODE, COINS_CODE, CONTRIBUTION
        union all
        SELECT 0 Ncont, A.ASSORTED_CODE, '11000003', 100 CONTRIBUTION
        from ins_assorted  a
        where  ((A.DOCUMENT_CODE = '05' AND A.ISSUE_DATE BETWEEN TO_DATE('01/01/2025','dd/MM/yyyy') AND TO_DATE('31/03/2025','dd/MM/yyyy') ) OR
                                (A.DOCUMENT_CODE <> '05' AND A.POLICY_DATE BETWEEN TO_DATE('01/01/2025','dd/MM/yyyy') AND TO_DATE('31/03/2025','dd/MM/yyyy') ))
                                
           and assorted_code not in (
           select reference_code 
           from ins_premium ipp, ins_assorted iaa
           where ipp.reference_code = iaa.assorted_code
           and ((iaA.DOCUMENT_CODE = '05' AND iaA.ISSUE_DATE BETWEEN TO_DATE('01/01/2025','dd/MM/yyyy') AND TO_DATE('31/03/2025','dd/MM/yyyy') ) OR
                                (iaA.DOCUMENT_CODE <> '05' AND A.POLICY_DATE BETWEEN TO_DATE('01/01/2025','dd/MM/yyyy') AND TO_DATE('31/03/2025','dd/MM/yyyy') ))
               
        )
        
        ) NET ,
   (  SELECT SUM(NET) Gcont, A.ASSORTED_CODE, COINS_CODE
   FROM (
SELECT DECODE(B.CLASS_CODE,
              '01',
              DECODE(A.DOCUMENT_CODE,
                     '04',
                     NVL(AMOUNT, 0),
                     NVL(AMOUNT, 0) - NVL(PREV_AMOUNT, 0)),
              NVL(AMOUNT, 0) - NVL(PREV_AMOUNT, 0))  NET,
       A.ASSORTED_CODE,
       COINSURANCE_CODE COINS_CODE

--(NVL(AMOUNT, 0) - NVL(PREV_AMOUNT, 0)) * (-1),A.ASSORTED_CODE
  FROM INS_PREMIUM      P,
       INS_CHARGES      C,
       INS_ASSORTED     A,
       INS_COINSURANCES IC,
       INS_POLICY_TYPES B

WHERE P.CHARGE_CODE = C.CHARGE_CODE
   AND A.ASSORTED_CODE = IC.ASSORTED_CODE
   AND A.POLICY_TYPE_CODE = B.POLICY_TYPE_CODE
   AND REFERENCE_CODE = A.ASSORTED_CODE || IC.ORDER_NO
   AND CHARGE_CATEGORY_CODE = '21'
   AND IC.COINSURANCE_CODE = COMPANY_CODE
   AND A.TAKAFUL_TYPE = 'L'
   AND ((A.DOCUMENT_CODE = '05' AND
       A.ISSUE_DATE BETWEEN TO_DATE('01/01/2025', 'dd/MM/yyyy') AND
       TO_DATE('31/03/2025', 'dd/MM/yyyy')) OR
       (A.DOCUMENT_CODE <> '05' AND
       A.POLICY_DATE BETWEEN TO_DATE('01/01/2025', 'dd/MM/yyyy') AND
       TO_DATE('31/03/2025', 'dd/MM/yyyy')))
      --  and a.assorted_code = '040000073675'
       
UNION ALL
SELECT DECODE(B.CLASS_CODE,
              '01',
              DECODE(A.DOCUMENT_CODE,
                     '04',
                     NVL(AMOUNT, 0),
                     NVL(AMOUNT, 0) - NVL(PREV_AMOUNT, 0)),
              NVL(AMOUNT, 0) - NVL(PREV_AMOUNT, 0)) NET,
       A.ASSORTED_CODE,
       '11000003'

--NVL(AMOUNT, 0) - NVL(PREV_AMOUNT, 0),A.ASSORTED_CODE
  FROM INS_PREMIUM P, INS_CHARGES C, INS_ASSORTED A, INS_POLICY_TYPES B
WHERE P.CHARGE_CODE = C.CHARGE_CODE
   AND REFERENCE_CODE = A.ASSORTED_CODE
   AND A.POLICY_TYPE_CODE = B.POLICY_TYPE_CODE
   AND CHARGE_CATEGORY_CODE = '21'
   AND A.TAKAFUL_TYPE = 'D'
   AND ((A.DOCUMENT_CODE = '05' AND
       A.ISSUE_DATE BETWEEN TO_DATE('01/01/2025', 'dd/MM/yyyy') AND
       TO_DATE('31/03/2025', 'dd/MM/yyyy')) OR
       (A.DOCUMENT_CODE <> '05' AND
       A.POLICY_DATE BETWEEN TO_DATE('01/01/2025', 'dd/MM/yyyy') AND
       TO_DATE('31/03/2025', 'dd/MM/yyyy')))
UNION ALL
SELECT DECODE(B.CLASS_CODE,
              '01',
              DECODE(A.DOCUMENT_CODE,
                     '04',
                     NVL(AMOUNT, 0),
                     NVL(AMOUNT, 0) - NVL(PREV_AMOUNT, 0)),
              NVL(AMOUNT, 0) - NVL(PREV_AMOUNT, 0)) NET,
       A.ASSORTED_CODE,
       '11000003'

--(NVL(AMOUNT, 0) - NVL(PREV_AMOUNT, 0)),A.ASSORTED_CODE
  FROM INS_PREMIUM      P,
       INS_CHARGES      C,
       INS_ASSORTED     A,
       INS_COINSURANCES IC,
       INS_POLICY_TYPES B
WHERE P.CHARGE_CODE = C.CHARGE_CODE
   AND A.ASSORTED_CODE = IC.ASSORTED_CODE
   AND REFERENCE_CODE = A.ASSORTED_CODE || IC.ORDER_NO
   AND CHARGE_CATEGORY_CODE = '21'
   AND IC.COINSURANCE_CODE = COMPANY_CODE
   AND A.TAKAFUL_TYPE = 'F'
   AND A.POLICY_TYPE_CODE = B.POLICY_TYPE_CODE
   AND ((A.DOCUMENT_CODE = '05' AND
       A.ISSUE_DATE BETWEEN TO_DATE('01/01/2025', 'dd/MM/yyyy') AND
       TO_DATE('31/03/2025', 'dd/MM/yyyy')) OR
       (A.DOCUMENT_CODE <> '05' AND
       A.POLICY_DATE BETWEEN TO_DATE('01/01/2025', 'dd/MM/yyyy') AND
       TO_DATE('31/03/2025', 'dd/MM/yyyy')))) A, INS_ASSORTED B

WHERE A.ASSORTED_CODE = B.ASSORTED_CODE
   AND B.DOCUMENT_CODE IN ('04', '05', '06', '07', '01')
   --and a.assorted_code = '040000079347'
GROUP BY A.ASSORTED_CODE, COINS_CODE

   ) GROSS ,
      (SELECT SUM(DECODE(CHARGE_CATEGORY_CODE, '22', contRI, 0)) ADMIN_SC,
               SUM(DECODE(CHARGE_CATEGORY_CODE, '23', contRI, 0)) STAMP_DUTY,
               SUM(DECODE(CHARGE_CATEGORY_CODE, '25', contRI, 0)) FIF,
               SUM(DECODE(CHARGE_CATEGORY_CODE, '26', contRI, 0)) FED,
               SUM(DECODE(CHARGE_CATEGORY_CODE, '141', contRI, 0)) DC,
               ASSORTEd_CODE,
               COINS_CODE
          FROM (SELECT SUM(NET) contRI,
                       A.ASSORTED_CODE,
                       COINS_CODE,
                       CHARGE_CATEGORY_CODE
                  FROM (
                  SELECT DECODE(B.CLASS_CODE,
                                      '01',
                                      DECODE(A.DOCUMENT_CODE,
                                             '04',
                                             NVL(AMOUNT, 0),
                                             NVL(AMOUNT, 0) -
                                             NVL(PREV_AMOUNT, 0)),
                                      NVL(AMOUNT, 0) - NVL(PREV_AMOUNT, 0)) NET,
                               A.ASSORTED_CODE,
                               '11000003' COINS_CODE,
                               CHARGE_CATEGORY_CODE
                          FROM INS_PREMIUM      P,
                               INS_CHARGES      C,
                               INS_ASSORTED     A,
                               INS_POLICY_TYPES B
                                                              
                         WHERE P.CHARGE_CODE = C.CHARGE_CODE
                           AND REFERENCE_CODE = A.ASSORTED_CODE
                           AND CHARGE_CATEGORY_CODE = '23'                              
                           AND A.POLICY_TYPE_CODE = B.POLICY_TYPE_CODE
                           AND A.TAKAFUL_TYPE = 'L'
                           AND ((A.DOCUMENT_CODE = '05' AND A.ISSUE_DATE BETWEEN TO_DATE('01/01/2025','dd/MM/yyyy') AND TO_DATE('31/03/2025','dd/MM/yyyy') ) OR
                                (A.DOCUMENT_CODE <> '05' AND A.POLICY_DATE BETWEEN TO_DATE('01/01/2025','dd/MM/yyyy') AND TO_DATE('31/03/2025','dd/MM/yyyy') ))

                  UNION ALL
                  SELECT DECODE(B.CLASS_CODE,
                                      '01',
                                      DECODE(A.DOCUMENT_CODE,
                                             '04',
                                             NVL(AMOUNT, 0),
                                             NVL(AMOUNT, 0) -
                                             NVL(PREV_AMOUNT, 0)),
                                      NVL(AMOUNT, 0) - NVL(PREV_AMOUNT, 0))  NET,
                               A.ASSORTED_CODE,
                               COINSURANCE_CODE COINS_CODE,
                               CHARGE_CATEGORY_CODE
                        
                        --(NVL(AMOUNT, 0) - NVL(PREV_AMOUNT, 0)) * (-1),A.ASSORTED_CODE
                          FROM INS_PREMIUM      P,
                               INS_CHARGES      C,
                               INS_ASSORTED     A,
                               INS_COINSURANCES IC,
                               INS_POLICY_TYPES B
                      
                         WHERE P.CHARGE_CODE = C.CHARGE_CODE
                           AND A.ASSORTED_CODE = IC.ASSORTED_CODE
                           AND A.POLICY_TYPE_CODE = B.POLICY_TYPE_CODE
                           AND REFERENCE_CODE = A.ASSORTED_CODE || IC.ORDER_NO
                           AND CHARGE_CATEGORY_CODE IN
                            ('22', '25', '26', '141')
                           AND IC.COINSURANCE_CODE = COMPANY_CODE
                           AND A.TAKAFUL_TYPE = 'L'
                           AND ((A.DOCUMENT_CODE = '05' AND A.ISSUE_DATE BETWEEN TO_DATE('01/01/2025','dd/MM/yyyy') AND TO_DATE('31/03/2025','dd/MM/yyyy') ) OR
                                (A.DOCUMENT_CODE <> '05' AND A.POLICY_DATE BETWEEN TO_DATE('01/01/2025','dd/MM/yyyy') AND TO_DATE('31/03/2025','dd/MM/yyyy') ))
                        UNION ALL
                        SELECT DECODE(B.CLASS_CODE,
                                      '01',
                                      DECODE(A.DOCUMENT_CODE,
                                             '04',
                                             NVL(AMOUNT, 0),
                                             NVL(AMOUNT, 0) -
                                             NVL(PREV_AMOUNT, 0)),
                                      NVL(AMOUNT, 0) - NVL(PREV_AMOUNT, 0)) NET,
                               A.ASSORTED_CODE,
                               '11000003',
                               CHARGE_CATEGORY_CODE
                        
                        --NVL(AMOUNT, 0) - NVL(PREV_AMOUNT, 0),A.ASSORTED_CODE
                          FROM INS_PREMIUM      P,
                               INS_CHARGES      C,
                               INS_ASSORTED     A,
                               INS_POLICY_TYPES B
                         WHERE P.CHARGE_CODE = C.CHARGE_CODE
                           AND REFERENCE_CODE = A.ASSORTED_CODE
                           AND A.POLICY_TYPE_CODE = B.POLICY_TYPE_CODE
                           AND CHARGE_CATEGORY_CODE IN
                          ('22', '23', '25', '26', '141')
                           AND A.TAKAFUL_TYPE = 'D'
                           AND ((A.DOCUMENT_CODE = '05' AND A.ISSUE_DATE BETWEEN TO_DATE('01/01/2025','dd/MM/yyyy') AND TO_DATE('31/03/2025','dd/MM/yyyy') ) OR
                                (A.DOCUMENT_CODE <> '05' AND A.POLICY_DATE BETWEEN TO_DATE('01/01/2025','dd/MM/yyyy') AND TO_DATE('31/03/2025','dd/MM/yyyy') ))
                        UNION ALL
                        SELECT DECODE(B.CLASS_CODE,
                                      '01',
                                      DECODE(A.DOCUMENT_CODE,
                                             '04',
                                             NVL(AMOUNT, 0),
                                             NVL(AMOUNT, 0) -
                                             NVL(PREV_AMOUNT, 0)),
                                      NVL(AMOUNT, 0) - NVL(PREV_AMOUNT, 0)) NET,
                               A.ASSORTED_CODE,
                               '11000003',
                               CHARGE_CATEGORY_CODE
                        
                        --(NVL(AMOUNT, 0) - NVL(PREV_AMOUNT, 0)),A.ASSORTED_CODE
                          FROM INS_PREMIUM      P,
                               INS_CHARGES      C,
                               INS_ASSORTED     A,
                               INS_COINSURANCES IC,
                               INS_POLICY_TYPES B
                         WHERE P.CHARGE_CODE = C.CHARGE_CODE
                           AND A.ASSORTED_CODE = IC.ASSORTED_CODE
                           AND REFERENCE_CODE = A.ASSORTED_CODE || IC.ORDER_NO
                           AND CHARGE_CATEGORY_CODE IN
                               ('22', '23', '25', '26', '141')
                           AND IC.COINSURANCE_CODE = COMPANY_CODE
                           AND A.TAKAFUL_TYPE = 'F'
                           AND A.POLICY_TYPE_CODE = B.POLICY_TYPE_CODE
                           AND ((A.DOCUMENT_CODE = '05' AND A.ISSUE_DATE BETWEEN TO_DATE('01/01/2025','dd/MM/yyyy') AND TO_DATE('31/03/2025','dd/MM/yyyy') ) OR
                                (A.DOCUMENT_CODE <> '05' AND A.POLICY_DATE BETWEEN TO_DATE('01/01/2025','dd/MM/yyyy') AND TO_DATE('31/03/2025','dd/MM/yyyy') ))
                        
                        ) A,
                       INS_ASSORTED B
                
                 WHERE A.ASSORTED_CODE = B.ASSORTED_CODE
                   AND B.DOCUMENT_CODE IN ('04', '05', '06', '07','01')
                 GROUP BY A.ASSORTED_CODE, COINS_CODE, CHARGE_CATEGORY_CODE)
         GROUP BY ASSORTEd_CODE, COINS_CODE ) CAT,
        (SELECT SUM(NVL(COMMISSION_AMOUNT, 0) *
                   DECODE(C.TAKAFUL_TYPE,
                          'L',
                           NVL(CONTRIBUTION, 100),100) / 100) DEFF_COMM_AMT,
               A.ASSORTEd_CODE,
               A.AGENCY_CODE,
               NVL(B.COINSURANCe_CODE, '11000003') COINS_CODE
          FROM INS_ASSORTED_CLIENTS A, INS_COINSURANCES B, INS_ASSORTED C
        
         WHERE A.ASSORTED_CODE = B.ASSORTED_CODE(+)
           AND A.ASSORTED_CODE = C.ASSORTED_CODE
        
         GROUP BY A.ASSORTED_CODE,
                  A.AGENCY_CODE,
                  NVL(B.COINSURANCe_CODE, '11000003')) DEFF_COMM,
       
       INS_ASSORTED     IA,
       ins_policy_types ipt,
       ins_policy_class ipc, --by akhlaq on 03/11/2015
       INS_PARTTAKER P,
       INS_PARTTAKER AG,
       (
      SELECT SUM(NVL(SUM_COVERED,0)-NVL(PREV_SUM_COVERED,0)) SC , COINSURANCe_CODE,ASSORTEd_CODE
              FROM INS_COINSURANCES             
              WHERE SUM_COVERED IS NOT NULL
              GROUP BY COINSURANCE_CODE,ASSORTEd_CODE
      )SUM_COV, INS_BRANCH IB, INS_ZONE IZ
WHERE IA.DOCUMENT_CODE IN ('04', '05', '07')
   AND IA.CLIENT_CODE = P.PARTTAKER_CODE --by akhlaq on 10/11/2015
   AND IA.AGENCY_CODE = AG.PARTTAKER_CODE --by akhlaq on 10/11/2015
   AND ((IA.DOCUMENT_CODE = '05' AND IA.ISSUE_DATE BETWEEN TO_DATE('01/01/2025','dd/MM/yyyy') AND TO_DATE('31/03/2025','dd/MM/yyyy') ) OR
       (IA.DOCUMENT_CODE <> '05' AND IA.POLICY_DATE BETWEEN TO_DATE('01/01/2025','dd/MM/yyyy') AND TO_DATE('31/03/2025','dd/MM/yyyy') ))
   AND IA.ASSORTED_CODE = NET.ASSORTED_CODE(+)
   AND NET.ASSORTED_CODE = GROSS.ASSORTED_CODE(+)
   AND NET.COINS_CODE = GROSS.COINS_CODE(+)
   AND NET.ASSORTEd_CODE = CAT.ASSORTEd_CODE(+)
   AND NET.COINS_CODE = CAT.COINS_CODE(+)
   AND IA.POLICY_TYPE_CODE = IPT.POLICY_TYPE_CODE
   AND IPT.POLICY_TYPE_CODE != '77'
   AND IPT.CLASS_CODE(+) = IPC.CLASS_CODE --by akhlaq on 03/11/2015
  -- AND IA.AGENCY_CODE (+)= DEFF_COMM.AGENCY_CODE
   AND IA.ASSORTED_CODE = DEFF_COMM.ASSORTEd_CODE
   AND NET.COINS_CODE = DEFF_COMM.COINS_CODE
   AND (IPT.CLASS_CODE='00' OR '00'='00')
   AND ((IA.SEQ_NO IS NULL AND 'P'='U') OR (IA.SEQ_NO IS NOT NULL AND 'P'='P') OR 'P'='A')
   AND (IA.BRANCH_CODE='00' OR '00'='00')
   AND (IA.BUSINESS_CENTER_CODE = '00' OR '00' = '00')
   AND (IA.AGENCY_CODE='00' OR '00'='00')
   --AND (IA.CLIENT_CODE='00' OR '00'='00')
   AND (IA.TAKAFUL_TYPE='00' OR '00'='00')
   AND (P.CATEGORY_TYPE='00' OR '00'='00')
  AND (ia.channel_code='00' OR '00'='00')
  AND (ia.dealer_code='00' OR '00'='00')
   AND (FUNC_TRACKER_CODE(IA.ASSORTED_CODE, IA.DOCUMENT_CODE)='00' OR '00'='00')
   AND DECODE('00','00', P.PARTTAKER_CODE,P.PARENT_CODE) = DECODE('00','00',DECODE ('00','00',P.PARTTAKER_CODE,'00'),'00')
   AND NET.ASSORTEd_CODE = SUM_COV.ASSORTED_CODE(+)
   AND NET.COINS_CODE = SUM_COV.COINSURANCE_CODE(+)
   AND IA.BRANCH_CODE = IB.BRANCH_CODE
   AND IB.PARENT_ZONE = IZ.ZONE_CODE
   AND (IZ.ZONE_CODE='00' OR '00'='00' OR  '00'<>'00' )
     AND '1' = (CASE WHEN 'Y' = 'Y' AND FUNC_TRACKER_FOUND(IA.ASSORTED_CODE, IA.DOCUMENT_CODE) > 0  THEN '1'
                           WHEN 'Y' = 'N' AND FUNC_TRACKER_FOUND(IA.ASSORTED_CODE, IA.DOCUMENT_CODE) = 0 THEN '1'
                           WHEN 'Y' = '00' THEN '1' END)
--  and ia.assorted_code = '040000079347'                 
--  and ia.assorted_code = '050000022193'                           
   ORDER BY ASSORTED_CODE

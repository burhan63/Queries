SELECT
B.ASSORTED_CODE,
-- func_assorted_string(a.assorted_code) as pol_end_no,
func_assorted_string(nvl(b.policy_code,b.assorted_code))policy,
func_assorted_string(decode(b.document_code , '05',a.assorted_code))Endorsement,

 initcap(ipp.parttaker_name) || ' - ' || a.agency_code agency,
 (CASE WHEN '00' = '00' THEN 'ALL' ELSE initcap(ipp.parttaker_name) || ' - ' || a.agency_code END) as p_agency,
 initcap(ipc.parttaker_name) || ' - ' || b.client_code as client,
(CASE WHEN '00' = '00' THEN 'ALL' ELSE initcap(ipc.parttaker_name) || ' - ' || b.client_code END) as p_client,
b.takaful_type,
(CASE WHEN '00' = '00' THEN 'ALL' ELSE b.takaful_type END) p_TAKAFUL_TYPE,
 A.premium_rcv_date as payable_date,
 -- A.RCV_CONTRIBUTION TOTAL_RCVD_GROSS_CONT,
 ROUND((case
         when B.COMMISSION_AMOUNT <> 0 then
          ((A.PAYABLE_AMOUNT + nvl(DUE, 0) + nvl(adjust_payable_amount, 0)) /
          B.COMMISSION_AMOUNT) * A.GROSS_CONTRIBUTION
         else
          0
       end)) RCVD_GROSS_CONT,
 ROUND((case
         when ROUND((case
                      when B.COMMISSION_AMOUNT <> 0 then
                       ((A.PAYABLE_AMOUNT + nvl(DUE, 0) + nvl(adjust_payable_amount, 0)) /
                       B.COMMISSION_AMOUNT) * A.GROSS_CONTRIBUTION
                      else
                       0
                    end)) <> 0 then
          (A.PAYABLE_AMOUNT + nvl(DUE, 0) + nvl(adjust_payable_amount, 0)) /
          ROUND((case
                  when B.COMMISSION_AMOUNT <> 0 then
                   ((A.PAYABLE_AMOUNT + nvl(DUE, 0) + nvl(adjust_payable_amount, 0)) /
                   B.COMMISSION_AMOUNT) * A.GROSS_CONTRIBUTION
                  else
                   0
                end)) * 100
         else
          0
       end)) COMM_PERCENTAGE,
 (A.PAYABLE_AMOUNT + nvl(DUE, 0) + nvl(adjust_payable_amount, 0)) COMM_PAYABLE,
 vt_chq_tab.cheque_no,
 initcap(vt_chq_tab.name) deposited_bank,
(CASE WHEN  '00' =  '00' THEN 'ALL' ELSE B.CLASS_NAME END) p_CLASS_NAME,
(CASE WHEN '00' = '00' THEN 'ALL' ELSE b.branch_name END) p_branch_name,
 (CASE WHEN '00' = '00' THEN 'ALL' ELSE b.zone_name END) p_zone_name
  FROM (select a.assorted_code,
               a.agency_code,
               max(b.premium_rcv_date) premium_rcv_date,
               gross_contribution gross_contribution,
               net_contribution net_contribution,
               max(rcv_contribution) rcv_contribution,
               b.payable_amount,
               b.adjust_payable_amount
          from ins_commission_payable a,
               (select assorted_code,
                       agency_code,
                       max(premium_rcv_date) premium_rcv_date,
                       sum(payable_amount) payable_amount,
                       sum(adjust_payable_amount) adjust_payable_amount,
                       max(payable_date) pa_date
                  from ins_commission_payable
                 where premium_rcv_date <=
                       TO_DATE('24-Mar-2025', 'dd/MM/yyyy')
                   and nvl(comm_status, 'Y') <> 'N'
                 group by assorted_code, agency_code) b
         where a.assorted_code = b.assorted_code
           and a.agency_code = b.agency_code
           and a.premium_rcv_date = b.premium_rcv_date
           and nvl(comm_status, 'Y') <> 'N'
           and a.premium_rcv_date <= TO_DATE('24-Mar-2025', 'dd/MM/yyyy')
           and a.payable_date = pa_date
         group by a.assorted_code,
                  a.agency_code,
                  gross_contribution,
                  net_contribution, --rcv_contribution, 
                  b.payable_amount,
                  b.adjust_payable_amount
         order by a.assorted_code) A,
       (select substr(a.assorted_string, 7) Document_no,
               substr((select assorted_string
                        from ins_assorted
                       where assorted_code = a.policy_code),
                      7) Generate_Against,
               a.Takaful_type,
               ac.agency_code,
               a.client_code,
               ac.commission_amount,
               NVL(ac.commission_type, 'M') Commission_type,
               A.ASSORTED_CODE,
               ipt.class_code,               
               ipc.class_name,
               ib.branch_name,
               iz.zone_name, a.policy_code, a.document_code
          from ins_assorted a, ins_assorted_clients ac, INS_POLICY_TYPES IPT, ins_branch ib, ins_zone iz, ins_policy_class ipc
         where a.assorted_code = ac.assorted_code
         --  and a.agency_code = ac.agency_code
           AND IPT.POLICY_TYPE_CODE = A.POLICY_TYPE_CODE
           and ipt.class_code = ipc.class_code
           and a.branch_code = ib.branch_code
           and ib.zone_code = iz.zone_code
          -- and ipt.class_code='02'
         --  and nvl(a.channel_code,'0') ='30000002'
           AND iz.zone_code =
               DECODE('00',
                      '00',
                      iz.zone_code,
                      '00')
           AND ib.branch_code =
               DECODE('00',
                      '00',
                      ib.branch_code,
                      '00')
           AND A.CLIENT_CODE = DECODE('00',
                                      '00',
                                      A.CLIENT_CODE,
                                      '00')
           AND A.TAKAFUL_TYPE = DECODE('00',
                                       '00',
                                       A.TAKAFUL_TYPE,
                                       '00')
           AND AC.AGENCY_CODE = DECODE('00',
                                      '00',
                                      AC.AGENCY_CODE,
                                      '00')
           AND (IPT.CLASS_CODE = '00' OR '00' = '00')) B,
       (select SUM(DUE_AMOUNT) DUE, ASSORTED_CODE, PAID_TO_CODE
          from vw_ins_outstanding v
         where mode_code = '03'
           and ((insurance_type_code = principal_company and
               principal_company = 'F') OR (principal_company <> 'F'))
           AND DUE_DATE <= TO_DATE('24-Mar-2025', 'dd/MM/yyyy')
         GROUP BY ASSORTED_CODE, PAID_TO_CODE) C,
       INS_PARTTAKER IPP,
       ins_parttaker ipc,
       (SELECT distinct name, a.cheque_no, B.assorted_code
          FROM INS_PREMIUM_DET b,
               ins_premium_mast a,
               GL_CHART C,
               (SELECT MAX(SEQNO) SEQNO, ASSORTED_CODE
                  FROM INS_PREMIUM_DET B, INS_PREMIUM_MAST A
                 WHERE MODE_CODE = '02'
                   AND PAYMENT_TYPE = 'Receipt RV'
                   AND A.PREMIUM_RCV_CODE = B.PREMIUM_RCV_CODE
                 GROUP BY ASSORTED_CODE) SEQ
         WHERE mode_code = '02'
           and a.premium_rcv_code = b.premium_rcv_code
           AND A.BANK_CODE = C.ACCODE
           AND PAYMENT_TYPE = 'Receipt RV'
           AND A.SEQNO = SEQ.SEQNO
           AND SEQ.ASSORTED_CODE = B.ASSORTED_CODE) vt_Chq_tab
 WHERE A.ASSORTED_CODE = B.ASSORTED_CODE
   AND A.AGENCY_CODE = B.AGENCY_CODE
   AND A.ASSORTED_CODE = C.ASSORTED_CODE(+)
   AND A.AGENCY_CODE = C.PAID_TO_CODE(+)
   AND A.AGENCY_CODE = IPP.PARTTAKER_CODE
   and b.client_code = ipc.parttaker_code
   and A.ASSORTED_CODE = vt_chq_tab.ASSORTED_CODE(+)
   AND (nvl(C.DUE, 0) + A.PAYABLE_AMOUNT + nvl(adjust_payable_amount, 0))<>0 
   ORDER BY 1

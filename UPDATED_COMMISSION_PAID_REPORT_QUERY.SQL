select AA.BRANCH_CODE,
       DECODE(V.payment_type, 'Receipt RV', 'RV-', 'Payment PV', 'PV') ||
       V.VOUCHER_NO VOUCHER,
       V.voucher_date,
       v.cheque_no,
       FUNC_ASSORTED_STRING(DECODE(AA.DOCUMENT_CODE,
                                   '05',
                                   AA.POLICY_CODE,
                                   AA.ASSORTED_CODE)) POLICY_NO,
       FUNC_ASSORTED_STRING(DECODE(AA.DOCUMENT_CODE,
                                   '05',
                                   AA.ASSORTED_CODE,
                                   '')) END_NO,
       
       P.PARTTAKER_NAME CLIENT_NAME,
       AA.AGENCY_CODE,
       SUM(DUE_AMOUNT) * -1 COMMISSION_PAID,
       v.ASSORTED_CODE,
       PAID_TO_CODE,
       V.principal_company,
       to_number(func_get_amount_by_type(V.ASSORTED_CODE, 'GROSS')) GROSS,
       to_number(func_get_amount_by_type(V.ASSORTED_CODE, 'NET')) NET
/* func_get_net_contribution(v.ASSORTED_CODE) NET_CONT,
       sum(gross) gross
*/
  from vw_ins_outstanding v,
       INS_ASSORTED AA,
       INS_PARTTAKER P,
       (SELECT NVL(DUE_AMOUNT, 0) gross, a.assorted_code
          FROM VW_INS_OUTSTANDING A, INS_ASSORTED IA, INS_POLICY_CLASS IPC
         WHERE A.insurance_type_code = A.principal_company
           AND MODE_CODE = '21'
           AND A.assorted_code = IA.ASSORTED_CODE
           AND A.coinsurance_code = company_code
           AND IA.SUP_BY IS NOT NULL
           AND A.CLASS_CODE = IPC.CLASS_CODE
        --AND A.ASSORTED_CODE=V.assorted_code
         ORDER BY IA.ASSORTED_CODE) B

 where mode_code = '03'
   and b.assorted_code = v.assorted_code
   and ((insurance_type_code = principal_company and
       principal_company = 'F') OR (principal_company <> 'F'))
   AND TRUNC(DUE_DATE) BETWEEN TO_DATE('01/03/2024', 'DD/MM/YYYY') AND
       TO_DATE('31/03/2025', 'DD/MM/YYYY')
   AND (V.class_code = '02' OR '02' = '00')
   AND AA.ASSORTED_CODE = V.assorted_code
   AND AA.ASSORTED_CODE = B.ASSORTED_CODE
   AND AA.CLIENT_CODE = P.PARTTAKER_CODE
      
   AND DOCUMENT_CODE NOT IN ('02', '01', '08', '03')
   AND (v.paid_to_code = '09000221' OR '09000221' = '00')
 GROUP BY AA.BRANCH_CODE,
          v.ASSORTED_CODE,
          PAID_TO_CODE,
          principal_company,
          func_get_net_contribution(v.ASSORTED_CODE),
          func_assorted_string(v.ASSORTED_CODE),
          FUNC_ASSORTED_STRING(DECODE(AA.DOCUMENT_CODE,
                                      '05',
                                      AA.POLICY_CODE,
                                      AA.ASSORTED_CODE)),
          FUNC_ASSORTED_STRING(DECODE(AA.DOCUMENT_CODE,
                                      '05',
                                      AA.ASSORTED_CODE,
                                      '')),
          P.PARTTAKER_NAME,
          AA.AGENCY_CODE,
          V.VOUCHER_NO,
          V.voucher_date,
          v.cheque_no,
          V.payment_type

 ORDER BY V.ASSORTED_CODE

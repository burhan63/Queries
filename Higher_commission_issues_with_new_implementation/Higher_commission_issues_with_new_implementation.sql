select func_assorted_string(ia.assorted_code) POLICY,
       func_get_amount_by_type(ia.assorted_code, 'GROSS') * 1 GROSS,
       ia.assorted_code,
       ip.parttaker_code,
       ip.parttaker_name,
       ipt.policy_name,
       iac.commission_amount,
       (select round((iac.commission_amount /
                     func_get_amount_by_type(ia.assorted_code, 'GROSS') * 1) * 100,
                     0)
          from dual) Comm_Percentage
  from ins_assorted         ia,
       ins_policy_types     ipt,
       ins_assorted_clients iac,
       ins_parttaker        ip
 where ia.policy_type_code = ipt.policy_type_code
   and ia.assorted_code = iac.assorted_code
   and ia.agency_code = ip.parttaker_code
   and ia.assorted_code in
       ('040000201119', '040000201118', '040000201120', '040000201117')
   and ip.category_parttaker_code = '09';

Toyota Protection Plan = TPP Private Car Comprehensive = Non - TPP



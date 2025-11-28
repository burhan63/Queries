select ia.seq_no, to_number(func_get_amount_by_type(ia.assorted_code,'GROSS'))GROSS
from ins_assorted ia, ins_policy_types ipt
where trunc(ia.issue_date) between '01-Aug-2024' and '31-Aug-2024'
and ia.document_code in ('04', '05', '06', '07')
and ia.sup_date is not null
and ia.policy_type_code <> 77
and ia.policy_type_code = ipt.policy_type_code
--and ipt.class_code = '02'
--and ia.seq_no='2979613'
and to_number(func_get_amount_by_type(ia.assorted_code,'GROSS')) <> 0

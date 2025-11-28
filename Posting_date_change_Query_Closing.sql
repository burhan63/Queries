select * from ins_assorted ia, ins_policy_types ipt, ins_policy_class ipc
where ia.policy_type_code = ipt.policy_type_code
and ipt.class_code = ipc.class_code
and ia.document_code in('04','05','07')
and ipt.policy_type_code <> 77
and trunc(ia.issue_date) between '01-Oct-2024' and '31-Oct-2024' 
and ipc.class_code = '02'
and trunc(ia.sup_date) between '01-Nov-2024' and '07-Nov-2024'
--and ia.is_valid = 'Y'
and ia.sup_by is not null
and ia.sup_date is not null
order by ia.assorted_code asc

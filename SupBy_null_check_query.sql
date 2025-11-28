select ipc.class_code, ipc.class_name,
count(ia.document_code)CNT from Ins_Assorted ia, ins_policy_types ipt, ins_policy_class ipc
where ia.policy_type_code = ipt.policy_type_code
and ipt.class_code = ipc.class_code
and ia.document_code in('04','05')
and ia.is_valid = 'Y'
and trunc(ia.issue_date) between '01-Nov-2024' and '25-Nov-2024'
and ia.sup_by is null
and ia.sup_date is not null
and ipt.policy_type_code <> 77
and ipc.class_code in('02','08')
group by ia.document_code, ipc.class_code, ipc.class_name;

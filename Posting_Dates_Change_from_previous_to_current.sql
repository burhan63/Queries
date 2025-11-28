-- Shift Policies + Endorsements + Certificates Dates --
select * from ins_assorted i, ins_policy_types ipt, ins_policy_class ipc
where i.policy_type_code = ipt.policy_type_code
and ipt.class_code = ipc.class_code
and ipc.class_code = '02'
and i.document_code in('04','05','07')
and trunc(i.issue_date) between '01-Sep-2024' and '30-Sep-2024'
and ipt.policy_type_code <> 77
and trunc(i.sup_date) between '01-Oct-2024' and '02-Oct-2024'
and i.sup_by is not null
and i.sup_date is not null
and i.seq_no is not null

select func_assorted_string(ia.assorted_code)POLICY,
func_get_amount_by_type(ia.assorted_code, 'GROSS') *1 GROSS,
func_get_amount_by_type(ia.assorted_code, 'FIF') *1 FIF,
func_get_amount_by_type(ia.assorted_code, 'FED') *1 FED,
func_get_amount_by_type(ia.assorted_code, 'STAMPDUTY') *1 SD,
func_get_amount_by_type(ia.assorted_code, 'NET') *1 NET, 
ia.assorted_code, ia.generate_against, ia.ent_by, ia.sup_by, ia.sup_date, ipt.policy_type_code, ipc.class_code, 
ipc.class_name, gm.seq_no, gm.creat_by, gm.creat_dt, gm.posted_by, gm.post_dt
from ins_assorted ia , ins_policy_types ipt, ins_policy_class ipc , gl_voch_mast gm
where ia.policy_type_code = ipt.policy_type_code
and ipt.class_code = ipc.class_code
and ia.seq_no = gm.seq_no
and ia.document_code in('04','05')
and ipt.policy_type_code <> 77
and trunc(ia.issue_date) between '01-May-2025' and '31-May-2025'
and ia.sup_by is null
and ia.sup_date is not null
and ipc.class_code = '08'
order by ia.assorted_code asc



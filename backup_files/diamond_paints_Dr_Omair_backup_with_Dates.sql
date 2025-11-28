-- Dr. Omair diamond paints reopen --
select * from ins_assorted ia
--where nvl(ia.policy_code, ia.assorted_code) = '040000188643'; 
where ia.assorted_string like '%110764%' for update and ia.policy_type_code = '76' and 
ia.document_code = '04';


select * from  ins_health_employee_info ih 
where ih.assorted_code = '050000897016'
and (ih.emp_code = ih.addition_emp_code or ih.change_emp_code = ih.emp_code)
and ih.health_id in(
'193055', '193000','720718','192992','193055')
--and nvl(ih.relation, 'E') = 'E'

Backup
Status_Flag = R
Status_Date = 30/06/2025


select * from ins_assorted where 
assorted_string like '%110346%'


select * from mt_pay_details
where vehicle_detail_code = '2143175'
and trunc(billing_start_from) = '31-May-2025'
order by running_date desc

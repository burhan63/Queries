-- Dr. Omair Premier Sales Policy reopen --
select * from ins_assorted ia
--where nvl(ia.policy_code, ia.assorted_code) = '040000178601'; 
where ia.assorted_string like '%3243%' and ia.policy_type_code = '76' and 
ia.document_code = '04';


select * from  ins_health_employee_info ih --set ih.status_flag = 'R', 
--ih.status_date = to_date('30/11/2024','dd/mm/yyyy')
where ih.assorted_code = '050000832257'
and (ih.emp_code = ih.addition_emp_code or ih.change_emp_code = ih.emp_code)
and ih.health_id in(
'704412', '532048','532756','528817','532848','627001','529160','532429','709940')
--and nvl(ih.relation, 'E') = 'E'

Backup
Status_Flag = R
Status_Date = 30/11/2024

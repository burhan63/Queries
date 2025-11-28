select * from ins_assorted ia 
where ia.assorted_string like '%2787-11-2023%'


select * from ins_health_employee_info ih 
where ih.assorted_code = '040000157439'
and (ih.emp_code = ih.addition_emp_code or ih.emp_code = ih.change_emp_code)
and ih.health_id in('676061','676070','676073','676090','676091','676571')


update ins_health_employee_info 
set name = replace(name,chr(38) || '#160;','') 
where health_id in('676061','676070','676073','676090','676091','676571')



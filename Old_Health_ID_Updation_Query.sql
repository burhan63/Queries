-- OLD Health ID --
--Step No: 01 sub sy pehle assorted code pick karna hai
--Query :
select * from ins_assorted ia 
where ia.assorted_string like '%24178-02-2024%'
and ia.policy_type_code = '76';

--Step No: 02 --query mai assorted code paste karna hai or check karna hai data
--us kai bad humain check karna hai data us mai possible hai kai health id nh arahi hogi
-- Query:
select * from ins_health_employee_info
where assorteD_code ='050000718246' 
and (emp_code = addition_emp_code or emp_code = change_emp_code)

--health id missing aye gi family mai or sub sy 

--Step no: 03 uskai bad apko old health id given hogi simple apko pick karna hai or HELATH_ID mai dal daina hai
--sub kai sath
--query:
select * from ins_health_employee_info
where assorteD_code ='050000718246' 
and (emp_code = addition_emp_code or emp_code = change_emp_code)
for update;

--paste Old health id into HEALTH_ID




select ia.assorted_string,ia.assorted_code, func_get_amount_by_type(ia.assorted_code,'GROSS')*1 gross,
func_get_amount_by_type(ia.assorted_code,'NET')*1 net
from ins_assorted ia
where nvl(ia.policy_code, ia.assorted_code)='040000161705'

select *
from ins_assorted ia
where ia.assorted_string like '%81836%'


select *
from sy_users s
where s.user_cd like '%AMINAHMED%'

select *
from mt_vehicles_details m
where m.assorted_code in ('040000152924','050000653487','050000664336','050000679221','050000689273',
'050000698124') for update 



select *
from mt_pay_details a
where a.assorted_code ='040000152924'
order by a.running_date desc

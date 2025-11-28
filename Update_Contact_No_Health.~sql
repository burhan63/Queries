-- Update Contact No in Health --
select *
from ins_assorted ia
--where nvl(ia.policy_code, ia.assorted_code)='040000159315'
where ia.assorted_string like '%2542-06-2023%'
and ia.policy_type_code ='76'

-- check data is accurate or not --
select *
from Ins_Health_Employee_Info a
where a.health_id ='235544'
and nvl(a.relation,'E')='E'
and a.assorted_code in (select ia.assorted_code  
from ins_assorted ia where nvl(ia.policy_code, ia.assorted_code)='040000163963') for update 


-- update query --
update ins_health_employee_info a 
set a.uc_name = '0345-2824286' 
where a.health_id = '594726' and nvl(a.relation, 'E') = 'E' 
and a.assorted_code in(select i.assorted_code from ins_Assorted I 
where nvl(i.policy_code, i.assorted_code) = '040000158077');

update ins_health_employee_info a 
set a.uc_name = '03000770524' where 
a.health_id = '575125' and nvl(a.relation, 'E') = 'E' 
and a.assorted_code in (select i.assorted_code from ins_assorted i 
where nvl (i.policy_code, i.assorted_code) = '040000142904');


update ins_health_employee_info a 
set a.uc_name = '03002075047' 
where a.health_id = '235629' and 
nvl(a.relation, 'E') = 'E' and a.assorted_code 
in(select ia.assorted_code from ins_assorted ia where 
nvl(ia.policy_code, ia.assorted_code) = '040000163963');























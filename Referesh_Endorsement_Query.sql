-- Referesh Endorsement --
--Step NO: 01 pick assorted code
select * from ins_assorted ia 
where ia.assorted_code = '050000728770'
where ia.assorted_string like '%24414-03-2024%';

--Step NO: 02 delete ins_health_life data
delete ins_health_life a
where a.assorted_code='050000724973';

--Step NO: 03 delete ins_assorted_health_coverage data
delete ins_assorted_health_coverage b
where b.assorted_code ='050000724973';


--Step NO: 04 delete ins_health_emp_rate_table data
delete ins_health_emp_rate_table c
where c.emp_code in (select d.emp_code
from ins_health_employee_info d
where d.assorted_code ='050000724973');

--Step NO: 04 delete ins_health_employee_info data
delete  ins_health_employee_info d
where d.assorted_code ='050000724973';


--Step NO: 05 delete ins_health_plan data
delete ins_health_plan e
where e.assorted_code='050000724973';

--Step No: 06 perform Previous data issue 

--Step No: 07 call health_life_upd






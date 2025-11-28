-- deletion Health --
select * from ins_assorted ia 
where ia.assorted_string like '%26382-08-2024%'
--where nvl(ia.policy_code, ia.assorted_code) = '040000177688';

declare
begin
  for rec in (
select *
from ins_health_employee_info a
where a.assorted_code ='050000771176'
--and a.emp_code='51414646'
and nvl(a.status_flag,'o')<>'R'
--and a.status_date='01-Apr-2024'
and nvl(a.relation,'E')='E'
--and a.emp_code = a.change_emp_code
and a.health_id in (
)
)loop
PROC_HEALTH_ENDORSEMENT(rec.assorted_code,rec.emp_code, 'R','01/07/2024',rec.ent_by);
end loop;
end ;

select * from ins_claim ic, ins_claim_status ics
where ic.claim_status_id = ics.claim_status_id
and ics.claim_status_id = '3'
and trunc(ent_date) between '21-Mar-2024'and '25-Mar-2024'
and ic.claim_string like '%130111%'

-- huzaifa case --
select * from ins_health_employee_info ihk
where ihk.health_id = '670111'
AND (Ihk.EMP_CODE = ihk.ADDITION_EMP_CODE OR ihk.EMP_CODE = ihk.CHANGE_EMP_CODE)

--chalaye gey tw status flag A hoga or Status date kuch bh hogi us sy puchna hai 
--kon si date us per change karna hai backup laina hai old date ka 



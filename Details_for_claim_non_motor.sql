select ic.claim_string,ic.claim_code,
(select sum(ics.reserved_amount) from ins_claim_reserved ics 
where ics.claim_code = ic.claim_code)res_amount,
(select sum(nvl(icd.salvage_amount,0) - nvl(icd.due_amount,0)) 
from ins_claim_due_info icds, ins_claim_dues icd
where icds.claim_info_code = icd.claim_info_code and icds.claim_code = ic.claim_code)Due_Amount,
(select sum(pd.rec_amount) from ins_premium_det pd , ins_claim_due_info icds
where pd.claim_info_code = icds.claim_info_code and icds.claim_code = ic.claim_code)Pre_Amount
from ins_claim ic
where (
ic.claim_string like '%0000000226-09-2019%' or
ic.claim_string like '%0000000339-07-2020%' or
ic.claim_string like '%0000001076-09-2021%' or
ic.claim_string like '%0000000323-04-2020%' or
ic.claim_string like '%0000000609-10-2022%' or
ic.claim_string like '%0000001257-08-2022%' or
ic.claim_string like '%0000001509-08-2024%')


select * from ins_claim_due_info ics
where ics.claim_code in('0400040401','0400040340');

select * from ins_health_employee_info 
where health_id = '647638'
and (emp_code = addition_emp_code or emp_code = change_emp_code)


update ins_health_employee_info
                           set name = replace(name,chr(38)||'#160;',' ')
                           where health_id=647638

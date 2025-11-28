select a.policy_code,a.contact_no, a.full_name,
func_get_amount_by_type(ia.assorted_code,'NET')*1 net,
func_assorted_string(ia.assorted_code)policy
from salaamappdata a, ins_assorted ia
where a.policy_code = nvl(ia.policy_code, ia.assorted_code)
and (a.contact_no like '%+923020216643%')





select func_get_amount_by_type(ia.assorted_code,'GROSS')*1 gross,
func_get_amount_by_type(ia.assorted_code,'FIF')*1 fif,
func_get_amount_by_type(ia.assorted_code,'FED')*1 fed,
func_get_amount_by_type(ia.assorted_code,'STAMPDUTY')*1 SD,
func_get_amount_by_type(ia.assorted_code,'NET')*1 net, ia.internal, ia.email,
(select sum(i.rec_amount)
from ins_premium_det i
where i.assorted_code= ia.assorted_code
and i.mode_code='02')RT,func_assorted_string(ia.assorted_code)policy, ia.*
from  ins_assorted ia
--where ia.assorted_code='050000755913'
--where ia.generate_against='080000155357' for update
--where ia.assorted_string like '%40847-04%'
--where ia.assorted_code in ('050000718162') for update 
where nvl(ia.policy_code, ia.assorted_code)='040000157961'
and ia.internal <>'Y'

040000157961

select *
from ins_premium_det ipd
where ipd.assorted_code='050000769584'


select a.policy_code,a.*
from salaamappdata a
where (a.contact_no like '%+923331346630%')

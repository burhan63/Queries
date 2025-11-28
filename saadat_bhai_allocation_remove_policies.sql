delete from ins_premium_det
where 
 premium_rcv_code in 
(
'29Apr250001','29Apr250015'
) and 
assorteD_code in 
(
select a.assorted_code
from ins_premium_det a, ins_assorted b
where premium_rcv_code in 
(
'29Apr250001','29Apr250015'
)
and a.assorted_code = b.assorted_code
and func_ren_fresh(nvl(b.policy_code,b.assorted_code))='R'
);

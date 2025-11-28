select *
from ins_assorted ia
--where ia.assorted_code in ('050000777980') for update
where ia.seq_no in ('2927447') for update 


select *
from ins_assorted_clients iac
where iac.assorted_code='050000775570' for update 



    select --max(to_number(ip.premium_seqno))+1
  ip.premium_seqno,ip.premium_type_code, ip.reference_code,ip.ent_by, ip.rate,ip.charge_code, ip.order_no, ip.amount, ip.prev_amount,
   (ip.amount - ip.prev_amount)diff
    from     ins_premium ip
    where ip.reference_code  =  '040000181789'
    order by to_number(ip.order_no)  for update ;
    
   
    select *
    from gl_voch_det gvd
    where gvd.seq_no='2984782' for update 
    
2994692 SHAHZADALAM 02/08/2024 12:02:00 pm  050000772156
2994693 SHAHZADALAM 05/08/2024 11:32:28 am  050000773619
2994694 SHAHZADALAM 05/08/2024 11:32:28 am  050000775102
2994695 SHAHZADALAM 09/08/2024 11:13:46 am  050000776935

 
   
    select *
    from gl_voch_mast gvm
    where gvm.seq_no in('2984783') for update 
    
    select *
    from ins_installment_master a
    where a.assorted_code='050000777980'
    
    select * from ins_assorted i 
    where i.generate_against = '050000777980'
    
    select * from sy_users sy 
    where sy.user_cd like '%SHAHZADALAM%'
    
    
    select * from ins_assorted 
    where nvl(policy_code, assorted_code) = '040000162655'

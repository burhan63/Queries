-- how to cehck the health reserved for close claim --
--pick claim code
select * from ins_claim where 
claim_string like '%124368%'

-- check reserved or tms per jakar check karna hai kai limit kitni hain agar kam karni hai yah 0 karni
-- hai tw or tms error dai Amount is greater wala tw aik func hai func_check_remaing_limit 
select * from ins_claim_reserved
where claim_code = '0400168012'


-- us mai sy line 47,48,49 line ko uncommit kardaina hai claim code dal kar hojaey ga

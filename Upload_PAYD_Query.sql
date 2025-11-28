-- UPLOAD PAYD --
SELECT count(*) FROM TMP_MT_PAY_DETAILS TMP
WHERE TRUNC(TMP.ENT_DATE) = '12-July-2024'
and tmp.endorsement_code is null
ORDER BY 1 ASC 

select * from ins_assorted where assorted_code = '050000767585'

select * from ins_assorted ia 
where nvl(ia.policy_code, ia.assorted_code) = '040000149771' for update

080000163248
050000767614
040000149771

select * from ins_assorted 
where assorted_code = '080000163248' for update

050000767580

-- PAYD NOT GENERATED CHECK --
SELECT ia.pay_as_you_go,ia.* FROM INS_ASSORTED IA 
WHERE IA.POLICY_CODE IN(
SELECT DISTINCT(TMP.ASSORTED_CODE) FROM TMP_MT_PAY_DETAILS TMP
WHERE TMP.ENDORSEMENT_CODE IS NULL
) AND IA.SUP_BY IS NULL;

SELECT * FROM SY_USERS SY 
WHERE SY.USER_CD LIKE '%AMINAHMED%'
FOR UPDATE;

select * from ins_assorted 
where assorted_string like '%44396-08-2024%'
WHERE ASSORTED_CODE = '040000179319'
for update
  

select *
from adc_report jj
where jj.assorted_code='040000029960'

select *
from crm_welcome_call nn
where nn.assorted_code='040000163892' for update

select * from mt_vehicles_details 
where assorted_code = '040000163892'

select * from ins_parttaker ip
where ip.parttaker_code = '08815589'
and ip.category_parttaker_code = '08'
for update





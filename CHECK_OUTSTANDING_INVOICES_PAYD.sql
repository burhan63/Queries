select func_assorted_string(ia.assorted_code)POLICY, 
func_get_amount_by_type(ia.assorted_code,'GROSS')GROSS,
func_get_amount_by_type(ia.assorted_code,'FIF')FIF,
func_get_amount_by_type(ia.assorted_code,'FED')FED,
func_get_amount_by_type(ia.assorted_code,'STAMPDUTY')STAMPDUTY,
func_get_amount_by_type(ia.assorted_code,'NET')NET,
(SELECT SUM(I.REC_AMOUNT)
FROM INS_PREMIUM_DET I
WHERE I.ASSORTED_CODE = IA.ASSORTED_CODE
AND I.MODE_CODE='02'
AND I.COINSURANCE_CODE = COMPANY_CODE)rt,
IA.ASSORTED_CODE,IA.INTERNAL,IA.PERIOD_FROM,
IA.PERIOD_TO_DATE,IA.SUP_BY,IA.SUP_DATE
from ins_assorted ia 
where nvl(ia.policy_code, ia.assorted_code) = '040000162965'
ORDER BY IA.ASSORTED_CODE ASC



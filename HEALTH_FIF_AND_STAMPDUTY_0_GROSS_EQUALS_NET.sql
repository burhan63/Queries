select func_assorted_string(ia.assorted_code)POLICY,
func_get_amount_by_type(ia.assorted_code,'GROSS') *1 GROSS,
func_get_amount_by_type(ia.assorted_code,'FIF') *1 FIF,
func_get_amount_by_type(ia.assorted_code,'FED') *1 FED,
func_get_amount_by_type(ia.assorted_code,'STAMPDUTY') *1 SD,
func_get_amount_by_type(ia.assorted_code,'NET') *1 NET,ia.* from ins_assorted ia 
where(
ia.assorted_string like '%0000003674-09-2025%' or
ia.assorted_string like '%0000003675-09-2025%' or
ia.assorted_string like '%0000003676-09-2025%' or
ia.assorted_string like '%0000003677-09-2025%' or
ia.assorted_string like '%0000003678-09-2025%' or
ia.assorted_string like '%0000003679-09-2025%' or
ia.assorted_string like '%0000003680-09-2025%' or
ia.assorted_string like '%0000003681-09-2025%'
) and ia.policy_type_code = '76';

FIF : 004297
SD : 004296
NET : 004302



SELECT IP.PREMIUM_SEQNO,IP.PREMIUM_TYPE_CODE,IP.REFERENCE_CODE,IP.ORDER_NO,IP.AMOUNT,
IP.PREV_AMOUNT,(IP.AMOUNT-IP.PREV_AMOUNT) DIFFERENCE,IP.RATE, IP.CHARGE_CODE,IP.ENT_BY
FROM INS_PREMIUM IP
WHERE IP.REFERENCE_CODE = '040000201999'
ORDER BY TO_NUMBER(IP.ORDER_NO) ASC
FOR UPDATE;


Update ins_premium i set i.amount = '959453' where i.reference_code = '040000202019' and i.charge_code = '004302';
Update ins_premium i set i.amount = '95545125' where i.reference_code = '040000202022' and i.charge_code = '004302';
Update ins_premium i set i.amount = '479892' where i.reference_code = '040000202023' and i.charge_code = '004302';
Update ins_premium i set i.amount = '3699' where i.reference_code = '040000202025' and i.charge_code = '004302';
Update ins_premium i set i.amount = '8299378' where i.reference_code = '040000202016' and i.charge_code = '004302';
Update ins_premium i set i.amount = '174726' where i.reference_code = '040000202024' and i.charge_code = '004302';
Update ins_premium i set i.amount = '373759' where i.reference_code = '040000202013' and i.charge_code = '004302';
Update ins_premium i set i.amount = '52599' where i.reference_code = '040000202020' and i.charge_code = '004302';



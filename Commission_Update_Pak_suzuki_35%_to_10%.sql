select func_assorted_string(ia.assorted_code)POLICY,
func_get_amount_by_type(ia.assorted_code,'GROSS')GROSS,
func_get_amount_by_type(ia.assorted_code,'FIF')FIF,
func_get_amount_by_type(ia.assorted_code,'FED')FED,
func_get_amount_by_type(ia.assorted_code,'STAMPDUTY')STAMPDUTY,
func_get_amount_by_type(ia.assorted_code,'COMMOUR')COMM,assorted_code, ent_date,sup_by,sup_date
from ins_assorted ia 
where(
ia.assorted_string like '%101814-11-2024%' or
ia.assorted_string like '%101816-11-2024%' or
ia.assorted_string like '%101817-11-2024%' or
ia.assorted_string like '%101819-11-2024%' or
ia.assorted_string like '%101830-11-2024%' or
ia.assorted_string like '%101831-11-2024%' or
ia.assorted_string like '%101832-11-2024%' or
ia.assorted_string like '%101833-11-2024%' or
ia.assorted_string like '%101834-11-2024%' or
ia.assorted_string like '%101835-11-2024%' or
ia.assorted_string like '%101836-11-2024%' or
ia.assorted_string like '%101837-11-2024%' or
ia.assorted_string like '%101838-11-2024%' or
ia.assorted_string like '%101845-11-2024%' or
ia.assorted_string like '%101848-11-2024%' or
ia.assorted_string like '%101849-11-2024%' or
ia.assorted_string like '%101854-11-2024%')

update ins_assorted_clients iac set iac.commission_amount = round((13822 * 10)/100,0) where iac.assorted_code = '040000189144';
update ins_assorted_clients iac set iac.commission_amount = round((13822 * 10)/100,0) where iac.assorted_code = '040000189145';
update ins_assorted_clients iac set iac.commission_amount = round((12722 * 10)/100,0) where iac.assorted_code = '040000189160';
update ins_assorted_clients iac set iac.commission_amount = round((12722 * 10)/100,0) where iac.assorted_code = '040000189161';
update ins_assorted_clients iac set iac.commission_amount = round((12722 * 10)/100,0) where iac.assorted_code = '040000189166';
update ins_assorted_clients iac set iac.commission_amount = round((12722 * 10)/100,0) where iac.assorted_code = '040000189167';
update ins_assorted_clients iac set iac.commission_amount = round((10323 * 10)/100,0) where iac.assorted_code = '040000189142';
update ins_assorted_clients iac set iac.commission_amount = round((11358 * 10)/100,0) where iac.assorted_code = '040000189148';
update ins_assorted_clients iac set iac.commission_amount = round((19610 * 10)/100,0) where iac.assorted_code = '040000189194';
update ins_assorted_clients iac set iac.commission_amount = round((10323 * 10)/100,0) where iac.assorted_code = '040000189184';
update ins_assorted_clients iac set iac.commission_amount = round((12722 * 10)/100,0) where iac.assorted_code = '040000189189';
update ins_assorted_clients iac set iac.commission_amount = round((12722 * 10)/100,0) where iac.assorted_code = '040000189171';
update ins_assorted_clients iac set iac.commission_amount = round((19610 * 10)/100,0) where iac.assorted_code = '040000189162';
update ins_assorted_clients iac set iac.commission_amount = round((19610 * 10)/100,0) where iac.assorted_code = '040000189163';
update ins_assorted_clients iac set iac.commission_amount = round((19610 * 10)/100,0) where iac.assorted_code = '040000189164';
update ins_assorted_clients iac set iac.commission_amount = round((19610 * 10)/100,0) where iac.assorted_code = '040000189165';
update ins_assorted_clients iac set iac.commission_amount = round((12722 * 10)/100,0) where iac.assorted_code = '040000189188';


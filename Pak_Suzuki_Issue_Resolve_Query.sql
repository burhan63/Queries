-- PAK SUZUKI ISSUES --
SELECT func_assorted_string(IA.ASSORTED_CODE)POLICY,
FUNC_GET_AMOUNT_BY_TYPE(IA.ASSORTED_CODE,'GROSS')*1 GROSS,
FUNC_GET_AMOUNT_BY_TYPE(IA.ASSORTED_CODE,'FIF')*1 FIF,
FUNC_GET_AMOUNT_BY_TYPE(IA.ASSORTED_CODE,'FED')*1 FED,
FUNC_GET_AMOUNT_BY_TYPE(IA.ASSORTED_CODE,'STAMPDUTY')*1 SD,
FUNC_GET_AMOUNT_BY_TYPE(IA.ASSORTED_CODE,'NET')*1 NET, IA.*
FROM INS_ASSORTED IA
WHERE IA.ENT_BY like '%3100%'
AND IA.DOCUMENT_CODE = '04'
AND IA.IS_VALID = 'Y'
AND TRUNC(IA.ENT_DATE) BETWEEN '01-Aug-2024' AND '08-Aug-2024'
AND IA.SUP_BY IS NULL
AND IA.SUP_DATE IS NULL
AND IA.CUSTODIAN IS NOT NULL
AND IA.ASSORTED_STRING IS Not NULL
ORDER BY 1 ASC



update ins_premium i set i.amount = 102 -1 where i.reference_code = '040000180467' and i.charge_code = '000054';
update ins_premium i set i.amount = 102 -1 where i.reference_code = '040000180490' and i.charge_code = '000054';
update ins_premium i set i.amount = 102 -1 where i.reference_code = '040000180491' and i.charge_code = '000054';
update ins_premium i set i.amount = 103 +1 where i.reference_code = '040000180516' and i.charge_code = '000054';
update ins_premium i set i.amount = 102 -1 where i.reference_code = '040000180550' and i.charge_code = '000054';
update ins_premium i set i.amount = 102 -1 where i.reference_code = '040000180557' and i.charge_code = '000054';
update ins_premium i set i.amount = 102 -1 where i.reference_code = '040000180558' and i.charge_code = '000054';
update ins_premium i set i.amount = 102 -1 where i.reference_code = '040000180568' and i.charge_code = '000054';
update ins_premium i set i.amount = 102 -1 where i.reference_code = '040000180569' and i.charge_code = '000054';
update ins_premium i set i.amount = 102 -1 where i.reference_code = '040000180595' and i.charge_code = '000054';
update ins_premium i set i.amount = 102 -1 where i.reference_code = '040000180596' and i.charge_code = '000054';
update ins_premium i set i.amount = 114 -1 where i.reference_code = '040000180615' and i.charge_code = '000054';
update ins_premium i set i.amount = 102 -1 where i.reference_code = '040000180620' and i.charge_code = '000054';
update ins_premium i set i.amount = 102 -1 where i.reference_code = '040000180621' and i.charge_code = '000054';
update ins_premium i set i.amount = 102 -1 where i.reference_code = '040000180622' and i.charge_code = '000054';
update ins_premium i set i.amount = 102 -1 where i.reference_code = '040000180623' and i.charge_code = '000054';
update ins_premium i set i.amount = 102 -1 where i.reference_code = '040000180624' and i.charge_code = '000054';
update ins_premium i set i.amount = 102 -1 where i.reference_code = '040000180625' and i.charge_code = '000054';
update ins_premium i set i.amount = 102 -1 where i.reference_code = '040000180633' and i.charge_code = '000054';
update ins_premium i set i.amount = 102 -1 where i.reference_code = '040000180634' and i.charge_code = '000054';
update ins_premium i set i.amount = 102 -1 where i.reference_code = '040000180636' and i.charge_code = '000054';
update ins_premium i set i.amount = 102 -1 where i.reference_code = '040000180637' and i.charge_code = '000054';
update ins_premium i set i.amount = 114 -1 where i.reference_code = '040000180638' and i.charge_code = '000054';
update ins_premium i set i.amount = 102 -1 where i.reference_code = '040000180639' and i.charge_code = '000054';
update ins_premium i set i.amount = 102 -1 where i.reference_code = '040000180643' and i.charge_code = '000054';
update ins_premium i set i.amount = 102 -1 where i.reference_code = '040000180648' and i.charge_code = '000054';
update ins_premium i set i.amount = 102 -1 where i.reference_code = '040000180649' and i.charge_code = '000054';
update ins_premium i set i.amount = 114 -1 where i.reference_code = '040000180662' and i.charge_code = '000054';
update ins_premium i set i.amount = 103 +1 where i.reference_code = '040000180663' and i.charge_code = '000054';
update ins_premium i set i.amount = 102 -1 where i.reference_code = '040000180715' and i.charge_code = '000054';
update ins_premium i set i.amount = 102 -1 where i.reference_code = '040000180716' and i.charge_code = '000054';
update ins_premium i set i.amount = 102 -1 where i.reference_code = '040000180717' and i.charge_code = '000054';
update ins_premium i set i.amount = 102 -1 where i.reference_code = '040000180719' and i.charge_code = '000054';
update ins_premium i set i.amount = 102 -1 where i.reference_code = '040000180723' and i.charge_code = '000054';
update ins_premium i set i.amount = 102 -1 where i.reference_code = '040000180724' and i.charge_code = '000054';
update ins_premium i set i.amount = 114 -1 where i.reference_code = '040000180746' and i.charge_code = '000054';
update ins_premium i set i.amount = 103 +1 where i.reference_code = '040000180751' and i.charge_code = '000054';
update ins_premium i set i.amount = 114 -1 where i.reference_code = '040000180760' and i.charge_code = '000054';
update ins_premium i set i.amount = 102 -1 where i.reference_code = '040000180763' and i.charge_code = '000054';
update ins_premium i set i.amount = 114 -1 where i.reference_code = '040000180766' and i.charge_code = '000054';
update ins_premium i set i.amount = 102 -1 where i.reference_code = '040000180782' and i.charge_code = '000054';
update ins_premium i set i.amount = 102 -1 where i.reference_code = '040000180794' and i.charge_code = '000054';
update ins_premium i set i.amount = 102 -1 where i.reference_code = '040000180795' and i.charge_code = '000054';
update ins_premium i set i.amount = 102 -1 where i.reference_code = '040000180801' and i.charge_code = '000054';
update ins_premium i set i.amount = 102 -1 where i.reference_code = '040000180802' and i.charge_code = '000054';
update ins_premium i set i.amount = 102 -1 where i.reference_code = '040000180804' and i.charge_code = '000054';
update ins_premium i set i.amount = 102 -1 where i.reference_code = '040000180808' and i.charge_code = '000054';
update ins_premium i set i.amount = 102 -1 where i.reference_code = '040000180809' and i.charge_code = '000054';
update ins_premium i set i.amount = 102 -1 where i.reference_code = '040000180810' and i.charge_code = '000054';
update ins_premium i set i.amount = 102 -1 where i.reference_code = '040000180811' and i.charge_code = '000054';
update ins_premium i set i.amount = 102 -1 where i.reference_code = '040000180812' and i.charge_code = '000054';
update ins_premium i set i.amount = 102 -1 where i.reference_code = '040000180813' and i.charge_code = '000054';
update ins_premium i set i.amount = 102 -1 where i.reference_code = '040000180814' and i.charge_code = '000054';
update ins_premium i set i.amount = 102 -1 where i.reference_code = '040000180815' and i.charge_code = '000054';
update ins_premium i set i.amount = 102 -1 where i.reference_code = '040000180816' and i.charge_code = '000054';
update ins_premium i set i.amount = 102 -1 where i.reference_code = '040000180817' and i.charge_code = '000054';
update ins_premium i set i.amount = 102 -1 where i.reference_code = '040000180818' and i.charge_code = '000054';
update ins_premium i set i.amount = 102 -1 where i.reference_code = '040000180819' and i.charge_code = '000054';
update ins_premium i set i.amount = 136 -1 where i.reference_code = '040000180913' and i.charge_code = '000054';
update ins_premium i set i.amount = 136 -1 where i.reference_code = '040000180914' and i.charge_code = '000054';
update ins_premium i set i.amount = 114 -1 where i.reference_code = '040000180915' and i.charge_code = '000054';
update ins_premium i set i.amount = 136 -1 where i.reference_code = '040000180924' and i.charge_code = '000054';
update ins_premium i set i.amount = 136 -1 where i.reference_code = '040000180925' and i.charge_code = '000054';
update ins_premium i set i.amount = 179 -1 where i.reference_code = '040000180927' and i.charge_code = '000054';
update ins_premium i set i.amount = 125 -1 where i.reference_code = '040000180952' and i.charge_code = '000054';
update ins_premium i set i.amount = 103 +1 where i.reference_code = '040000180957' and i.charge_code = '000054';
update ins_premium i set i.amount = 125 -1 where i.reference_code = '040000180967' and i.charge_code = '000054';
update ins_premium i set i.amount = 125 -1 where i.reference_code = '040000180968' and i.charge_code = '000054';
update ins_premium i set i.amount = 125 -1 where i.reference_code = '040000180969' and i.charge_code = '000054';
update ins_premium i set i.amount = 136 -1 where i.reference_code = '040000180973' and i.charge_code = '000054';
update ins_premium i set i.amount = 136 -1 where i.reference_code = '040000180974' and i.charge_code = '000054';
update ins_premium i set i.amount = 125 -1 where i.reference_code = '040000180989' and i.charge_code = '000054';
update ins_premium i set i.amount = 114 -1 where i.reference_code = '040000180997' and i.charge_code = '000054';
update ins_premium i set i.amount = 125 -1 where i.reference_code = '040000180998' and i.charge_code = '000054';
update ins_premium i set i.amount = 103 +1 where i.reference_code = '040000181006' and i.charge_code = '000054';
update ins_premium i set i.amount = 125 -1 where i.reference_code = '040000181014' and i.charge_code = '000054';
update ins_premium i set i.amount = 125 -1 where i.reference_code = '040000181015' and i.charge_code = '000054';
update ins_premium i set i.amount = 103 +1 where i.reference_code = '040000181028' and i.charge_code = '000054';
update ins_premium i set i.amount = 114 -1 where i.reference_code = '040000181032' and i.charge_code = '000054';
update ins_premium i set i.amount = 125 -1 where i.reference_code = '040000181048' and i.charge_code = '000054';
update ins_premium i set i.amount = 125 -1 where i.reference_code = '040000181050' and i.charge_code = '000054';
update ins_premium i set i.amount = 125 -1 where i.reference_code = '040000181058' and i.charge_code = '000054';
update ins_premium i set i.amount = 125 -1 where i.reference_code = '040000181059' and i.charge_code = '000054';
update ins_premium i set i.amount = 125 -1 where i.reference_code = '040000181062' and i.charge_code = '000054';
update ins_premium i set i.amount = 125 -1 where i.reference_code = '040000181063' and i.charge_code = '000054';
update ins_premium i set i.amount = 103 +1 where i.reference_code = '040000181075' and i.charge_code = '000054';
update ins_premium i set i.amount = 125 -1 where i.reference_code = '040000181077' and i.charge_code = '000054';
update ins_premium i set i.amount = 125 -1 where i.reference_code = '040000181078' and i.charge_code = '000054';
update ins_premium i set i.amount = 125 -1 where i.reference_code = '040000181080' and i.charge_code = '000054';
update ins_premium i set i.amount = 125 -1 where i.reference_code = '040000181081' and i.charge_code = '000054';
update ins_premium i set i.amount = 114 -1 where i.reference_code = '040000181082' and i.charge_code = '000054';
update ins_premium i set i.amount = 103 +1 where i.reference_code = '040000181086' and i.charge_code = '000054';
update ins_premium i set i.amount = 103 +1 where i.reference_code = '040000181098' and i.charge_code = '000054';


select * from ins_assorted ia 
where ia.assorted_code = '070000121989'

select * from mt_vehicles_details 
where assorted_code = '070000121989'


4230136799867
4230136799867






























-- HIGHER COMMISSION CASSES --
SELECT func_assorted_string(ia.assorted_code)POLICY,IA.ASSORTED_CODE,IA.Remarks,ia.* FROM INS_ASSORTED IA 
WHERE (
ia.assorted_string like '%41325-05-2024%' or
ia.assorted_string like '%41380-05-2024%' or
ia.assorted_string like '%41326-05-2024%' or
ia.assorted_string like '%41575-05-2024%' or
ia.assorted_string like '%41380-05-2024%' or
ia.assorted_string like '%41357-05-2024%' or
ia.assorted_string like '%41624-05-2024%' or
ia.assorted_string like '%41368-05-2024%' or
ia.assorted_string like '%41621-05-2024%' or
ia.assorted_string like '%41368-05-2024%' or
ia.assorted_string like '%41326-05-2024%' or
ia.assorted_string like '%41359-05-2024%' or
ia.assorted_string like '%41380-05-2024%' or
ia.assorted_string like '%41575-05-2024%' or
ia.assorted_string like '%41359-05-2024%' or
ia.assorted_string like '%41575-05-2024%' or
ia.assorted_string like '%41243-05-2024%' or
ia.assorted_string like '%41434-05-2024%' or
ia.assorted_string like '%41438-05-2024%' or
ia.assorted_string like '%41560-05-2024%' or
ia.assorted_string like '%41399-05-2024%' or
ia.assorted_string like '%41391-05-2024%' or
ia.assorted_string like '%41390-05-2024%' or
ia.assorted_string like '%41389-05-2024%' or
ia.assorted_string like '%41337-05-2024%' or
ia.assorted_string like '%41630-05-2024%'
) AND IA.SUP_DATE IS NULL
AND IA.SUP_BY IS NULL
ORDER BY 1 ASC

040000158740
040000158678
040000158766

SELECT func_assorted_string(I.ASSORTED_CODE)POLICY,I.* FROM INS_ASSORTED I
WHERE I.ASSORTED_CODE IN(
'040000158634'
)
040000158634 DONE


LHR/LHR/D/MO/PC COMP/P/78773/11/2023
LHR/LHR/D/MO/PC COMP/P/78824/11/2023
LHR/LHR/D/MO/PC COMP/P/78846/11/2023

select * from Ins_Assorted 
where assorteD_string like '%82069-01-2024%'

select func_assorted_string(assorted_code)Policy from ins_assorted 
where assorted_code in(
'040000129367',
'080000152483',
'040000129370',
'040000150871',
'040000145318',
'040000142798',
'040000141956',
'050000599231',
'040000129368',
'040000147801',
'040000139471',
'040000150106',
'040000141957',
'040000139397',
'040000139458',
'040000148968',
'040000147353',
'040000144107',
'040000144104',
'040000144101',
'050000568805',
'040000140730',
'040000152962',
'040000149739',
'040000148502',
'040000147321',
'040000140821',
'040000140728',
'040000139574'
)




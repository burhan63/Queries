-- Shahzad Sir Work F and R --
select func_assorted_string(ia.assorted_code)POLICY, 
SUBSTR(IA.ASSORTED_STRING,-18,10)PNO,SUBSTR(IA.ASSORTED_STRING,14,11)CNO,
func_ren_fresh(IA.ASSORTED_CODE)FRR,IPC.CLASS_NAME,
IA.ASSORTED_CODE from ins_assorted ia, INS_POLICY_TYPES IPT, INS_POLICY_CLASS IPC
WHERE IA.DOCUMENT_CODE IN('07')
AND IA.POLICY_TYPE_CODE <>'77'
--AND IPC.CLASS_CODE = '02'
AND IA.POLICY_TYPE_CODE = IPT.POLICY_TYPE_CODE
AND IPT.CLASS_CODE = IPC.CLASS_CODE
AND ASSORTED_CODE IN (SELECT INSURANCE_TYPE FROM INS_CLAIM)


-- Claim String  F and R--
SELECT IC.CLAIM_CODE,I.ASSORTED_CODE,SUBSTR(IC.CLAIM_STRING,-18,10)Claim,func_ren_fresh(I.ASSORTED_CODE)FRR 
FROM Ins_Assorted I, INS_POLICY_TYPES IZT, INS_POLICY_CLASS IZC, INS_CLAIM IC
WHERE I.ASSORTED_CODE = IC.INSURANCE_TYPE
AND I.POLICY_TYPE_CODE = IZT.POLICY_TYPE_CODE
AND IZT.CLASS_CODE = IZC.CLASS_CODE
AND IZC.CLASS_CODE = '02'

select * from sy_users
where user_cd = 'DRMUHAMMADRADIF'


select ia.assorted_code,ia.third_party_category from ins_assorted ia 
where (ia.assorted_string like '%106208-01-2025%' or ia.assorted_string like '%106277-01-2025%' or 
ia.assorted_string like '%106355-01-2025%' or ia.assorted_string like '%106424-01-2025%' or 
ia.assorted_string like '%106433-01-2025%' or ia.assorted_string like '%106490-01-2025%' or 
ia.assorted_string like '%106578-01-2025%' or ia.assorted_string like '%106581-01-2025%')  

select * from mtr_retail_thrd_prty

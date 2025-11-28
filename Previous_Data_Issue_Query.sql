-- PREVIOUS DATA ISSUE --
--Step No: 01
--sub sy pehle check karna hai assorted_code
select * from Ins_Assorted ia 
where ia.assorted_string like '%24414-03-2024%';

--Step No: 02 assorted_code paste karna hai
--Query:
select * from ins_assorted
where assorted_code='050000729145'


assorted_code: 050000729145
generate_against: 050000726858
ent_by: MNAVEED
policy_date: 28/03/2024


--Step No: 03
-- uskai bad assorted_code ko paste karna hai data apko nh mile ga phr generate_against wala
-- bh check karna hai us mai data hoga
select * from ins_health_employee_info
where assorted_code ='050000729145'

--step No: 04
-- or us kai bad endorsent_health ka procedure test karna hai
--p_assorted_code mai assorted_code jo nikala hai wo paste karna hai
--p_generate_against mai generate_against wala hi dalna hai
--p_ga_period_flag mai 'A' dalna hai
--p_period_flag mai 'A' dalna hai
--p_user_cd mai jo bh ent_by mai aye ga uska name dalna hai jo assotred_code column mai hai

select * from ins_health_emp_rate_table
where assorted_code = '050000692004'

select * from ins_assorted_health_coverage
where assorted_code = '050000692004'

SELECT * FROM INS_PARTTAKER IP 
WHERE IP.PARTTAKER_CODE = '08000089'
AND IP.CATEGORY_PARTTAKER_CODE = '08'

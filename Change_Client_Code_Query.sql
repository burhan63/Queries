-- Client Code Changing --
--Step No : 01 sub sy pehle assorted code pick karna hai or agency_code or Client_code lai laina hai
select * from Ins_Assorted ia 
where ia.assorted_string like '%80138-12-2023%' for update

Agency : 09000210
Client : 08000025

--Step No : 02 check karna hai kai agency kia dali hui hai agency same honi chahiye ins_Assorted or ins_assorted_clients mai
select * from ins_assorted_clients iac
where iac.assorted_code = '040000146979';

--Step No : 03 check karna hai kai RT tw generate nh hai agar generate hai tw Shahzad Bhai sy approval laini hai
select * from ins_premium_det pd 
where pd.assorted_code = '040000146979';

--Step No: 04 check karna hai kai ins_assorted mai jo agency dali hui hai or ins_agencies mai jo dali hui hai
--wo same ho
-- or phr new wala jo client code aya hai us mai bh daikhna hai kai kia hai same ani chahiye
-- yeh jo parttaker_code mai jo dala hua hai wo client_code hai
select * from ins_agencies ig
where ig.parttaker_code in('08811688','08814911')
and ig.agency_code = '09000578'

new client code : 08815412

--Step No: 05 sari requirment full fill karkai change kardaina hai client_code
select * from Ins_Assorted ia 
where ia.assorted_string like '%65784%'
for update;

--client code change kardain gey


-- Query for kai kon sa parttaker hai --
select * from ins_parttaker ip
where ip.parttaker_code = '08808709'

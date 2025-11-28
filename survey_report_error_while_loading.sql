-- SURVEY REPORT ERROR WHILE LOADING --
--sub sy pehle ins_claim mai sy claim no nikalna hai or workshop daikhni hai.
select * from ins_claim
where claim_code = '0400215824';

-- workshopcode pick karna hai or workshop daikhni hai kon si dali hui hai.
select * from ins_parttaker
where parttaker_code = '27001245';


-- phr apko daikhna hai ins_claim_serveyor_report mai daikhna hai 2 workshop arahi hongi apko us mai daikhna hai
-- aik workshop ghalat dali hogi apko wo hata daini hai match karkai jo ins_claim mai dali hogi.
select icsr.detail_desc,icsr.*
from ins_claim_serveyor_report icsr where 
icsr.group_desc = 'LABOURPAYEE'
and icsr.claim_code = '0400215824' for update;

-- survey_report chal jaey gi.

-- Payment Not Show --

--Step No : 01 sub sy pehle claim nikal laina hai
select * from ins_claim ic 
where ic.claim_string like '%54099%'

--Step No: 02 check claim_due_info 
select * from ins_claim_due_info 
where claim_code = '0700023093'

-- claim_info_code nikal kar rakh laina hai then aik aik ko pls_transaction_details mai check karna hai first column sort karkai last mai 'N' ko 'Y' kardaina hai.


select * from pls_transaction_details
where claim_info_code = 'claim_info_code' 

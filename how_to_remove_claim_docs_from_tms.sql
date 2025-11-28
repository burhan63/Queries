-- how to remove the claim doc from tms --
select * from ins_claim ic 
where ic.claim_string like '%1992-10-2024%'; --pick claim code


-- now ins_claim_docs mai documents check karne hain kai kon sa upload hai
select * from ins_claim_docs 
where claim_code = '0400203248' for update

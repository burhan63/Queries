-- Change Name in Claim Payment Vocher --
--Step No: 01 Pick claim_code
select * from ins_claim ic 
where ic.claim_string like '%1677-01-2025%'

--Step No: 02 now check claim_due_info and check claim_paid_to_name or wo jo name bol raha hai update kardaina hai.
select * from ins_claim_due_info
where claim_code = '0400216405' for update

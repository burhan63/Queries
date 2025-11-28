-- Retail Mis policy is not appear --
-- Step No : 01 sub sy pehle assorted code pick karna hai ins_assorted sy or client code bh utha laina hai
-- then humain yeh bh check karna hai kai channel retail  hi dala hua ho.
select ia.assorted_code, IA.* from ins_assorted ia 
where ia.assorted_string like '%3299-08-2024%' and ia.document_code = '04';

-- client code laine kai bad humain check karna hai kai category_type blank hai agar blank hai 
-- tw ins_assorted mai daikhna hai kai company per hai policy yah kisi kai name per hai
-- agar company per name hai tw us ki category code dal daina hai.
SELECT * FROM INS_PARTTAKER IP 
WHERE IP.PARTTAKER_CODE = '08009504'
AND IP.CATEGORY_PARTTAKER_CODE = '08' for update;


-- catgory yahan sy daikhni hai --
select * from vw_parttaker_category_setup;

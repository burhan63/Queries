-- Portal Related issue --
--Step No : 01 sub sy pehle client code nikal laine hain
select * from ins_parttaker
where parttaker_name like '%Mendoza%'
and category_parttaker_code = '08'

--Step No: 02 uskai bad humain assorted_code sort karkai nikal laina hai.
select * from ins_assorted ia 
where ia.client_code in('08802410') and ia.policy_type_code = '76'
and ia.document_code = '04'


--Step No: 03 humain check karna hai jo request_date di hui hogi or assorted_code paste karkai agar endorsement_code
-- blank hai tw humain delete kardaina hai.
select * from  ins_health_emp_request
where policy_code in('040000182036')
and request_date = '11-Mar-2025'

assorted code : 040000182044 request date : 10-Mar-2025  The Looks (Pvt) Limited
assorted code : 040000182036 request date : 11-Mar-2025  LE Mendoza Pharmaceutical (Private) Limited



-- Delete request query.
delete from  ins_health_emp_request
where policy_code in('040000182036')
and request_date = '11-Mar-2025'

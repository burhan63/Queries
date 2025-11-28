-- Active Workshop List--
select ia.parttaker_code Workshop_code, ia.parttaker_name Workshop_name, ia.active, ia.ntn_no  NTN, ia.email_address email_address, 
ia.phone_no Contact_number,
aa.city_name, aa.region_name
from ins_parttaker ia,
(Select i.district_code, a.city_name, a.region_name
from  ins_city a, ins_district i
where a.city_code = i.city_code)aa
where ia.category_parttaker_code = '26'
and ia.district_code = aa.district_code
and ia.active='Y'



-- daily Check for reset error in 10.6.100.94 --
select *
from crm_email_notifications a
where a.error_message is not null
and a.subject like '%Pay%'
and a.notification_id <>'140053'
order by 1
for update
  
-- Load Report Failed aye ga query mai sub sy pehle 10.6.100.94 per jana hai or 
-- phr Ecommerce per jakar EcommerceNotification ki service restart karni hai 
-- or phr error message ko blank karna hai then check karna hai 




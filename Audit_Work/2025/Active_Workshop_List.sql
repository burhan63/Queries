select su.user_cd, su.user_name, su.active, su.ent_date, SUL.LAST_LOGIN, SU.LAST_UPDATE_DATE, cc.cost_name
from sy_users su,  (

select login_user, max(login_date) last_login
from sy_user_logging sul
where sul.status='SUCCESS'
GROUP BY LOGIN_USER) sul, cu_cost_center cc
where su.user_cd = sul.login_user
--AND su.ACTIVE='Y'
--AND TRUNC(ENT_DATE) >='01-JAN-2020'
AND SU.USER_CATEGORY='B'
--AND TRUNC(SU.LAST_UPDATE_DATE) >='01-JAN-2020'
--AND SUL.LAST_LOGIN >='01-JAN-2020'
and su.cost_code = cc.cost_code
and su.user_category not in('C','A','D')
--and su.user_category not in ('C','A','D')


select * from  sy_users --set active = 'N', last_update_date = to_date('31/03/2025','dd/mm/yyyy')
where user_cd in(
'IQRAKHANZADA'
) FOR UPDATE

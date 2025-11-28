-- user rights query --
select *
from sy_users s
where s.user_cd like '%SALEEM%'

select *--'ABEEHASHAHAB', a.opt_cd, a.access_type, a.branch_code, a.class_code, 'ABDUL', sysdate, a.ent_by_ip
from  sy_perm_list a
where a.user_cd like '%BEHROOZKHAN%'

----- for branches -----
insert into sy_user_branches
  (user_cd, branch_code, class_code, ent_by, ent_date, ent_by_ip)
  (select 'MUHAMMADSHOAIB', s.branch_code, s.class_code, 'ABDUL', sysdate, s.ent_by_ip
from sy_user_branches s
where s.user_cd = 'JIBRANCHUHAN' 
--and s.branch_code <> '02'
);

----- for options ------
insert into sy_perm_list
  (user_cd, opt_cd, access_type, branch_code, class_code, ent_by, ent_date, ent_by_ip, master_menu_code, project_type)
(
select 'BEHROOZKHAN', a.opt_cd, a.access_type, a.branch_code, a.class_code, 'ABDUL', sysdate, a.ent_by_ip,
a.master_menu_code, a.project_type
from  sy_perm_list a
where a.user_cd =  'BEHROOZKHAN'
AND A.CLASS_CODE = '01'
);

SELECT * FROM INS_POLICY_CLASS IPC
WHERE IPC.CLASS_NAME = 'MARINE'

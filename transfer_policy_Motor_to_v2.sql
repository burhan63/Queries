select func_assorted_string(ia.assorted_code)POLICY,
func_get_amount_by_type(ia.assorted_code,'GROSS') *1 GROSS, IA.* from ins_assorted ia 
where ia.assorted_string like '%111607-09-2025%';

select * from ins_policy_types
where policy_type_code = '06';



select * from ins_premium a, ins_charges b
where a.charge_code =b.charge_code
and b.charge_category_code='31'
and a.reference_code in (select assorted_code from ins_assorted
                       where generate_against='040000202304')

rate  = 408.66     
contribution = 1366754
commission  =  147236
select * from ins_assorted_clients
where assorted_code in (
(select assorted_code from ins_assorted
                       where generate_against='040000202304')
)

update mt_vehicles_details
set assorted_code ='040000202304'
where assorted_code in (select assorted_code from ins_assorted
                       where generate_against='040000202304')
                       
                       
delete from ins_premium
where reference_code in
(select assorted_code from ins_assorted
                       where generate_against='040000202304')                       
                       
delete from ins_assorted_clients
where assorted_code in
(select assorted_code from ins_assorted
                       where generate_against='040000202304')       

delete from ins_assorted_warranties
where assorted_code in
(select assorted_code from ins_assorted
                       where generate_against='040000202304')       


delete from ins_assorted
where assorted_code in
(select assorted_code from ins_assorted
                       where generate_against='040000202304')       

update mt_vehicles_details x
set x.cont_mat_date = null
,x.frr='REN'
WHERE ASSORTED_CODE    ='040000202304'  

UPDATE INS_ASSORTED
SET frr='REN'
WHERE ASSORTED_CODE    ='040000202304'  


select * from ins_premium
where reference_code ='040000121047'

select * from sy_users
where user_cd like '%ATIF.SHERAZ%'

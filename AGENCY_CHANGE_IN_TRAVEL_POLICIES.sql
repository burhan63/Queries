-- Kashif Bhai Support Work --
select * from ins_assorted
where assorted_string like '%10616-09-2025%';

-- Check RT
select * from ins_premium_det
where assorted_code = '040000201911';

-- Check agency on agent side jo kai same honi chahiye ins_assorted sy
select * from ins_assorted_clients
where assorted_code = '040000201911';

-- check commssion if released or not released.
select * from ins_commission_payable
where assorted_code = '040000201911';


-- Update Agency in ins_assorted
update ins_assorted set agency_code = '09000329' where assorted_code = '040000201911';

-- Update Agency on ins_assorted_clients
update ins_assorted_clients set agency_code = '09000329' where assorted_code = '040000201911';

-- Update Agency on tmp_travel_policy
update tmp_travel_policy set agent_code = '09000329' where policy_code = '040000201911';

select * from tmp_travel_policy where policy_code = '040000201911';




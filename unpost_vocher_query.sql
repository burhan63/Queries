-- unpost voucher query --
--Step No : 01 sub sy pehle gl_voch_mast mai entery daikhni hai
select * from gl_voch_mast
where vouchno = '25-01-1571'
and v_type = 'PV'
for update
  
ALYA  20/02/2025 6:57:52 pm
  
-- agar unpost karne kai bad re-print mai dalna ho tw 

select * from pls_voucher_detail
where voucher_seq_no = '3157348' for update


select * from ins_premium_mast
where vouchno = '25-01-1571'
and payment_type = 'Payment PV' for update 


select * from ins_claim
where claim_string like '%154136%'

select * from pls_health_transactions_header
where claim_code = '0400204745'

select * from pls_health_transactions_detail
where txn_header_id = '86651' for update

select * from pls_sub_process_master
where sub_process_id = '211'
  

select * from report_parameters
where rp_name like '%GL%'

select * from ins_premium_mast ipm
where ipm.vouchno = '25-01-1571'
and ipm.payment_type = 'PV'

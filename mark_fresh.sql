--Mark Fresh --

--Check Month
--Check FRR
select * from ins_assorted a
where a.assorted_string like '%92574-07-2024%' --for update




--Check FRR
select * from mt_vehicles_details vd
where vd.assorted_code = '040000178214' --for update


--it should be null
select * from ins_premium_det pd
where pd.assorted_code = '040000178214'




--it will check last three column should be same and check RESH_PCT,RENEW_PCT,ROLL_PCT will be same
select * from motor_commission_setup n
where n.client_code = '08805673'



select * from ins_premium pm
where pm.reference_code = '040000178214'

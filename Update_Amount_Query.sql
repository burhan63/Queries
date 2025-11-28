-- UPDATE AMOUNT --
SELECT * FROM INS_PREMIUM_MAST IPM
WHERE IPM.VOUCHNO IN(
'24-07-0186'
)
AND IPM.PAYMENT_TYPE = 'Receipt RV'
FOR UPDATE;

2645262
--Comments or IT Remarks of Updation Check Amount --
Request by Mr. Muhammad Adam (Accounts) 02-July-2024
Change cheque Amount 349,500/- instead of this 352000
Change Pay Name BANKISLAMI PAKISTAN LTD. instead of this Blank.


--Comments or IT Remarks of Updation Pay name --
Request by Mr. Muhammad Adam (Accounts) 25-Nov-2023
Change Pay Name VICTOR SARDAR(35201-7360400-1) instead of this Blank.


--Comments or IT Remarks of Updation Check Number --
Request by Mr. Muhammad Adam (Accounts) 07-June-2024
Change cheque Number 75763664 instead of this 7576364
Change Pay Name ALKHIDMAT FAREEDA YAQOOB HOSPITAL instead of this AL-KHIDMAT HOSPITAL.


-- unpost vouvher --

select * from gl_voch_mast h
where h.vouchno IN2640480
2640431
2640492
2640571

and h.posted_by is null
and h.post_dt is null for update

-- erase post_by and post_date remember disale gl_vooch_mast trigger and then erase --

select * from gl_voch_mast jj
where jj.vouchno = '24-06-0224'
and jj.v_type = 'JV' for update

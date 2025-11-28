-- FED RECONCILE QUERY + METHOD --
-- sub sy pehle yeh query run karni hai or daikhna hai kai itne records arahe hain.
--Query : 
select *
from ins_assorted ia,vw_ins_outstanding vu
where trunc(ia.ent_date) between '01-Aug-2025' and '31-Aug-2025'
and ia.document_code in ('04', '05', '07')
and ia.policy_type_code <> 77
and ia.assorted_code = vu.assorted_code
and vu.mode_code = '26'
and vu.principal_company = vu.insurance_type_code
and vu.coinsurance_code = '11000003'
and vu.due_amount <>0
and ia.sales_tax_dc_no is null

-- if agar records atey hain tw humain check karna hai kai sales_tax_dc_no blank araha hoga jo records is query sy aye gey then un assorted code ko pick karkai ins_assorted_code mai check karna hai. or yeh column daikh laina hai bus blank hoga.

-- if agar sup_by null hoga tw humain us ka seq no get karna hai then is query sy jiss nai post kia hai uska name lailaina hai.
select * from gl_voch_mast gm
where gm.seq_no = 'seq_no';


-- yeh karne kai bad humain un assorted_codes ko pick karna hai or PROC_SALE_TAX_NO mai assorted_code ki entries jitni bh arahi hain usey 2 jagah paste kardaina hai 225 line kai bad or 504 line no kai bad jahan tak updated remarks hain.

-- then humain aik aik assorted_code ko procedure PROC_SALE_TAX_NO  mai test karwa daina hai or ins_assorted_code mai check karlaina hai 
--sales_tax_dc_no fill hojaey ga.

-- Job Map cr Work --
select a.is_posted_yn, a.assorted_code, a.seq_no, a.gcont
from tm_ft_cr a
where trunc(a.posting_date) between '01-Aug-2024' and '31-Aug-2024'
and a.gcont <>0
and a.class_code='02'
and a.is_posted_yn='Y' for update 

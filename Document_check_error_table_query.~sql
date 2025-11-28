-- sub sy pehle assorted_code nikalna hai --
select * from ins_assorted 
where assorted_string like '%98130-09-2024%' for update

--sub sy pehle assorted code ko is table mai enter karna hai --
SELECT * FROM TMS_ERROR_DOC_CHECK 
where assorted_code in('050000799100')

-- Assorted code table mai dal kar yeh query run kardaija hai--
begin
  for rec in(
select * from tms_error_doc_check where run_date is null 
)loop
begin 
proc_documents_check(p_assorted_code => rec.assorted_code);
exception when others then null; 
end;
end loop;
end;






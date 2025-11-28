-- BULK UNPOSTING METHOD --
SELECT * FROM INS_ASSORTED IA 
where(
ia.assorted_string like '%91083-06-2024%' or
ia.assorted_string like '%90344-06-2024%' or
ia.assorted_string like '%90343-06-2024%' or
ia.assorted_string like '%90443-06-2024%' or
ia.assorted_string like '%90444-06-2024%' or
ia.assorted_string like '%90356-06-2024%' or
ia.assorted_string like '%90128-06-2024%' or
ia.assorted_string like '%90478-06-2024%' or
ia.assorted_string like '%90479-06-2024%' or
ia.assorted_string like '%90071-06-2024%' or
ia.assorted_string like '%90072-06-2024%' or
ia.assorted_string like '%91350-06-2024%' or
ia.assorted_string like '%90903-06-2024%' or
ia.assorted_string like '%90121-06-2024%' or
ia.assorted_string like '%90895-06-2024%' or
ia.assorted_string like '%90454-06-2024%' or
ia.assorted_string like '%90274-06-2024%' or
ia.assorted_string like '%90275-06-2024%' or
ia.assorted_string like '%90317-06-2024%'
) AND IA.ASSORTED_CODE NOT IN('040000175220')
ORDER BY 1 ASC




-- Bulk Unposting Method --
declare
v_result varchar2(15);
begin
   for rec in (
select *--ia.assorted_code
 from ins_assorted ia 
where ia.assorted_code in(
'050000830654',
'050000830655',
'050000830656',
'050000830657',
'050000830658',
'050000830659',
'050000830660',
'050000830661',
'050000830662',
'050000830663',
'050000830664',
'050000830665',
'050000830666',
'050000830667',
'050000830668',
'050000830669',
'050000830670',
'050000830671',
'050000830672',
'050000830673',
'050000830674',
'050000830675',
'050000830676',
'050000830677',
'050000830678',
'050000830679',
'050000830680',
'050000830681',
'050000830682',
'050000830683',
'050000830684',
'050000830685',
'050000830686',
'050000830687',
'050000830688',
'050000830689',
'050000830690',
'050000830691',
'050000830692',
'050000830693',
'050000830694',
'050000830695',
'050000830696',
'050000830697',
'050000830698',
'050000830699',
'050000830700',
'050000830701',
'050000830702',
'050000830703',
'050000830704',
'050000830705',
'050000830706',
'050000830707',
'050000830708',
'050000830709',
'050000830710',
'050000830711',
'050000830712',
'050000830713',
'050000830714',
'050000830715',
'050000830716',
'050000830717',
'050000830718',
'050000830719',
'050000830720'
)
)loop
proc_unpost_document(rec.assorted_code, v_result);
end loop;
end;

-- FOR CANCEL PROCEDURE --
proc_cancel_document

-- FOR UNPOSTING PROCEDURE --
proc_unpost_document

select func_assorted_string(assorted_code)policy, sup_by, sup_date from ins_assorted
where assorted_code in('070000159661','070000159848')


050000811548
050000816341


040000167091
040000174221

66379
663
500






-- delete bulk renewal notices --
declare 
--v_result varchar(15);
begin
  for rec in (
select *
from ins_assorted ia
where(
ia.assorted_string like '%82208%' or
ia.assorted_string like '%82239%' or
ia.assorted_string like '%82050%' or
ia.assorted_string like '%82053%' or
ia.assorted_string like '%82058%' or
ia.assorted_string like '%82068%' or
ia.assorted_string like '%82072%') and ia.document_code = '08'
and ia.sup_by is null
and ia.sup_date is null
)
loop
 -- proc_unpost_document(rec.assorted_code,v_result);
 DELETE FROM INS_PREMIUM WHERE SUBSTR(REFERENCE_CODE, 1, 12) = rec.assorted_code;
    DELETE FROM INS_PREMIUM
     WHERE REFERENCE_CODE IN
           (SELECT VEHICLE_DETAIL_CODE
              FROM MT_VEHICLES_DETAILS
             WHERE ASSORTED_CODE = rec.assorted_code);
    DELETE FROM MT_PR_IN_ACCESSORIES
     WHERE VEHICLE_DETAIL_CODE IN
           (SELECT VEHICLE_DETAIL_CODE
              FROM MT_VEHICLES_DETAILS
             WHERE ASSORTED_CODE = rec.assorted_code);
    DELETE FROM INS_PERIL_RIDERS_POLICY
     WHERE VEHICLE_DETAIL_CODE IN
           (SELECT VEHICLE_DETAIL_CODE
              FROM MT_VEHICLES_DETAILS
             WHERE ASSORTED_CODE = rec.assorted_code);
    DELETE FROM MT_VEHICLES_DETAILS WHERE ASSORTED_CODE = rec.assorted_code;
    DELETE FROM MT_VEHICLES_DETAILS WHERE ASSORTED_CODE = rec.assorted_code;
    DELETE FROM INS_COINSURANCES WHERE ASSORTED_CODE = rec.assorted_code;
    DELETE FROM INS_FINANCIAL_INSTITUTE_INTERE
     WHERE ASSORTED_CODE = rec.assorted_code;
    DELETE FROM INS_ASSORTED_WARRANTIES WHERE ASSORTED_CODE = rec.assorted_code;
    DELETE FROM INS_ASSORTED_GEN_CONDITIONS WHERE ASSORTED_CODE = rec.assorted_code;
    DELETE FROM INS_ASSORTED_CLIENTS WHERE ASSORTED_CODE = rec.assorted_code;
        DELETE FROM INS_ASSORTED WHERE ASSORTED_CODE = rec.assorted_code;
        commit;
        end loop;
        end;

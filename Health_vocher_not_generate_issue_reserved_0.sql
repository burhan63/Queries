-- vocher not generate issue reserved 0 amount --
declare
begin
  for rec in (select ic.claim_code
from ins_claim ic, ins_loss_types ilt
where ic.Claim_String like '%96898%'
and ic.loss_type_code = ilt.loss_type_code
and ilt.class_code='08')loop

insert into ins_claim_reserved
  (claim_code, reserved_code, reserved_amount, reserved_date, remarks, seq_no, ent_by, ent_date, 
  sup_by, sup_date, reserve_type)
values
  (rec.claim_code, '001', 0, trunc(sysdate), 'Reserved Auto generate for recovery voucher generate', 
  '', 'SYS', sysdate, 'SYS', sysdate, 'T');
  
  end loop;
  end;

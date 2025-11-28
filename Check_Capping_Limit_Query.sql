--CHECK CAPPING LIMIT --
select func_get_amount_by_type(IA.POLICY_CODE, '040000166605') TOTALGROSS,
                       func_get_amount_by_type(IA.ASSORTEd_CODE, '050000772505') GROSS,
                       NVL(IAC.COMMISSION_AMOUNT, 0) COMM_AMOUNT,
                       IAC.AGENCY_CODE,
                       IAGC.COMMISSION_RATE,
                       NVL((SELECT SUM(COMMISSION_AMOUNT)
                             FROM INS_ASSORTED_CLIENTS X, INS_ASSORTED Y
                            WHERE X.ASSORTED_CODE = Y.ASSORTED_CODE
                              AND NVL(Y.POLICY_CODE, Y.ASSORTED_CODE) =
                                  '040000166605'
                              AND X.AGENCY_CODE = IAC.AGENCY_CODE),
                           0) TOTAL_COMMISSION
                  from ins_assorted          ia,
                       ins_assorted_clients  iac,
                       ins_agent_commissions iagc
                 where ia.assorted_code = iac.assorted_code
                   and iac.agency_code = iagc.parttaker_code
                   and ia.policy_type_code = iagc.policy_type_code
                   and ia.assorted_code = '050000772505'
050000766032 

050000766034 issue                  
                   
select * from ins_assorted 
--where assorted_string like '%93750-07-2024%'
where assorted_code = '050000772505'

select * from ins_parttaker ip 
where ip.parttaker_code = '09000401'
and ip.category_parttaker_code = '09'

select func_assorted_string(assorted_code)policy,
func_get_amount_by_type(assorted_code,'GROSS')GROSS,
func_get_amount_by_type(assorted_code,'FIF')FIF,
func_get_amount_by_type(assorted_code,'FED')FED,
func_get_amount_by_type(assorted_code,'STAMPDUTY')STAMPDUTY,assorted_code,sup_by,sup_date
from ins_assorted 
where nvl(policy_code, assorted_code) = '040000166605'

09000564
09000564

select func_assorted_string(k.assorted_code)POLICY,kn.assorted_code,
k.agency_code,kn.agency_code,kn.commission_amount from ins_assorted k, ins_assorted_clients kn
where k.assorted_code = kn.assorted_code
--and nvl(k.policy_code, k.assorted_code) = '040000159330'
and nvl(k.policy_code, k.assorted_code)='040000166605'

select * from ins_parttaker ip
where ip.parttaker_code = '09000538'
and ip.category_parttaker_code = '09'





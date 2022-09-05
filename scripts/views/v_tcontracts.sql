create vieW v_tcontracts as
select id, bar_code, personal_account, contract_id, contract_number, startdate::text, enddate::text, customer_id, сonsignee_id,
eso_contract_number, eso_id, area_id, customer_group_id, contract_mot_id, notes, motnotes, custname, custaddress, consname, eso_name, 
area_name, customer_group_name, contract_mot_name_ru, contract_mot_name_kz 
from v_contracts;
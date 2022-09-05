create or replace view v_charges as
select wcg.id, wcg.charge_date::text, wcg.contract_id, wcg.obj_id, wcg.obj_type_id, wcg.pu_id, wcg.charge_type_id, wcg.qty, wcg.trans_loss, 
wcg.line_loss, wcg.startdate::text, wcg.enddate::text, wcd.contract_number, wo.object_name, wp.pu_number, sct.charge_type_name
from wt_charges wcg join wt_contract_details wcd on wcg.contract_id = wcd.contract_id join wt_objects wo on wcg.obj_id = wo.id 
join wt_pu wp on wcg.pu_id = wp.id join st_charge_types sct on wcg.charge_type_id = sct.id
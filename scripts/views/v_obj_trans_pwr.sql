create or replace view v_obj_trans_pwr as
select wot.id, wot.obj_id, wot.obj_type_id, wot.trans_pwr_id, wot.startdate::text, wot.enddate::text, wo.object_name, 
vtp.trans_pwr_name, vtp.trans_pwr_type_id, vtp.trans_pwr_type_name, vtp.short_circuit_power, vtp.idling_loss_power, vtp.nominal_power
from wt_obj_trans_pwr wot, v_trans_pwr vtp, wt_objects wo
where wot.obj_type_id = 0 and wot.trans_pwr_id = vtp.id and wot.obj_id = wo.id
union
select wot.id, wot.obj_id, wot.obj_type_id, wot.trans_pwr_id, wot.startdate::text, wot.enddate::text, wt.tgu_name as object_name, 
vtp.trans_pwr_name, vtp.trans_pwr_type_id, vtp.trans_pwr_type_name, vtp.short_circuit_power, vtp.idling_loss_power, vtp.nominal_power
from wt_obj_trans_pwr wot, v_trans_pwr vtp, wt_tgu wt
where wot.obj_type_id > 0 and wot.trans_pwr_id = vtp.id and wot.obj_id = wt.id
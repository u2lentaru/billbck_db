create or replace view v_obj_trans_volt as
select wot.id, wot.obj_id, wot.obj_type_id, wot.trans_volt_id, wot.startdate::text, wot.enddate::text, wo.object_name, 
vtc.trans_volt_name, vtc.trans_type_id, vtc.checkdate::text, vtc.nextcheckdate::text, 
vtc.proddate::text, vtc.serial1, vtc.serial2, vtc.serial3, vtc.trans_type_name, vtc.ratio, vtc."class", 
vtc.maxcurr, vtc.nomcurr 
from wt_obj_trans_volt wot, v_trans_volt vtc, wt_objects wo
where wot.obj_type_id = 0 and wot.trans_volt_id = vtc.id and wot.obj_id = wo.id
union
select wot.id, wot.obj_id, wot.obj_type_id, wot.trans_volt_id, wot.startdate::text, wot.enddate::text, wt.tgu_name as object_name, 
vtc.trans_volt_name, vtc.trans_type_id, vtc.checkdate::text, vtc.nextcheckdate::text, 
vtc.proddate::text, vtc.serial1, vtc.serial2, vtc.serial3, vtc.trans_type_name, vtc.ratio, vtc."class", 
vtc.maxcurr, vtc.nomcurr 
from wt_obj_trans_volt wot, v_trans_volt vtc, wt_tgu wt
where wot.obj_type_id > 0 and wot.trans_volt_id = vtc.id and wot.obj_id = wt.id
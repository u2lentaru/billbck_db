create or replace view v_obj_lines as
select wol.id, wol.obj_id, wol.obj_type_id, wol.cable_resistance_id, wol.line_length, wol.startdate::text, wol.enddate::text, 
wo.object_name, scr.cable_resistance_name, scr.resistance, scr.material_type
from wt_obj_lines wol join st_cable_resistances scr on wol.cable_resistance_id = scr.id join wt_objects wo on wol.obj_id = wo.id
where wol.obj_type_id = 0
union
select wol.id, wol.obj_id, wol.obj_type_id, wol.cable_resistance_id, wol.line_length, wol.startdate::text, wol.enddate::text, 
wt.tgu_name as object_name, scr.cable_resistance_name, scr.resistance, scr.material_type
from wt_obj_lines wol join st_cable_resistances scr on wol.cable_resistance_id = scr.id join wt_tgu wt on wol.obj_id = wt.id
where wol.obj_type_id > 0

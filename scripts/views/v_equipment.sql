create or replace view v_equipment as
select se.*, set2.equipment_type_name, set2.equipment_type_power, wo.object_name 
from st_equipment se, st_equipment_types set2, wt_objects wo 
where se.equipment_type_id = set2.id  
and se.obj_id = wo.id 
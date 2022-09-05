create or replace view v_act_heads as
select wa.id, wa.act_type_id, wa.act_number, wa.act_date::text, wa.object_id, wa.staff_id, wa.notes, wa.activated::text, sat.act_type_name, 
vo.object_name, vo.flat_number, vo.reg_qty, vo.street_name, vo.city_name, vo.house_number, vo.building_number, vo.tariff_group_name, ss.staff_name
from wt_acts wa, st_act_types sat, v_objects vo, st_staff ss
where wa.act_type_id=sat.id and wa.object_id=vo.id and wa.staff_id = ss.id
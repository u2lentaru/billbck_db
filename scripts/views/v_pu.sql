create or replace view v_pu as
select wp.id, wp.startdate::text, wp.enddate::text, wp.pu_type_id, spt.pu_type_name, wp.pu_number, wp.install_date::text, wp.check_interval, 
wp.initial_value, wp.dev_stopped, wp.object_id, wp.obj_type_id, vo.object_name, vo.house_id, vo.house_number, vo.flat_number, 
vo.building_number, vo.reg_qty, vo.street_id, vo.street_name, vo.city_name, vo.building_type_name, vs.cityid, vs.created, vs.closed, wp.pid  
from wt_pu wp, v_objects vo, v_streets vs, st_pu_types spt 
where wp.object_id= vo.id and wp.obj_type_id = 0 and vo.street_id = vs.street_id and wp.pu_type_id = spt.id
union
select wp.id, wp.startdate::text, wp.enddate::text, wp.pu_type_id, spt.pu_type_name, wp.pu_number, wp.install_date::text, wp.check_interval, 
wp.initial_value, wp.dev_stopped, wp.object_id, wp.obj_type_id, wt.tgu_name, 0, '0', '0', '0', 0, 0, 'ТГУ', 'ТГУ', 'ТГУ', 0, '2019-01-01', null, null
from wt_pu wp, wt_tgu wt, st_pu_types spt
where wp.object_id = wt.id and wp.obj_type_id > 0 and wp.pu_type_id = spt.id

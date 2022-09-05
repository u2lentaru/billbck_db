create or replace view v_objects as
select wo.*, vh.building_types_id, vh.street_id, vh.house_number, vh.building_number, vh.rp_id, vh.area_id, vh.ksk_id, vh.sector_id, 
vh.connector_id, vh.input_type_id, vh.reliability_id, vh.voltage_id, vh.building_type_name, vh.street_name, vh.created, vh.city_name, 
vh.rp_name, vh.area_name, vh.area_number, vh.ksk_name, vh.sector_name, vh.connector_name, vh.input_type_name, vh.reliability_name, 
vh.voltage_name, vh.voltage_value, sot.obj_type_name, su.uzo_name, su.uzo_value, stg.tariff_group_name, sct.calculation_type_name,
sst.obj_status_name 
from wt_objects wo join v_houses vh on wo.house_id=vh.id join st_obj_types sot on wo.obj_type_id=sot.id
join  st_uzo su on wo.uzo_id=su.id join st_tariff_groups stg on wo.tariff_group_id=stg.id 
join st_calculation_types sct on wo.calculation_type_id=sct.id join st_obj_statuses sst on wo.obj_status_id=sst.id

-- create or replace view v_objects as
-- select wo.*, vh.building_types_id, vh.street_id, vh.house_number, vh.building_number, vh.rp_id, vh.area_id, vh.ksk_id, vh.sector_id, 
-- vh.connector_id, vh.input_type_id, vh.reliability_id, vh.voltage_id, vh.building_type_name, vh.street_name, vh.created, vh.city_name, 
-- vh.rp_name, vh.area_name, vh.area_number, vh.ksk_name, vh.sector_name, vh.connector_name, vh.input_type_name, vh.reliability_name, 
-- vh.voltage_name, vh.voltage_value, sot.obj_type_name, su.uzo_name, su.uzo_value, stg.tariff_group_name, sct.calculation_type_name,
-- sst.obj_status_name 
-- from wt_objects wo, v_houses vh , st_obj_types sot, st_uzo su, st_tariff_groups stg, st_calculation_types sct, st_obj_statuses sst
-- where wo.house_id=vh.id and wo.obj_type_id=sot.id and wo.uzo_id=su.id and wo.tariff_group_id=stg.id 
-- and wo.calculation_type_id=sct.id  and wo.obj_status_id=sst.id
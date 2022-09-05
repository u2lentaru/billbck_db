create or replace view v_houses as
select sh.*, sbt.building_type_name, vs.street_name, vs.created, vs.city_name, sr.tgu_name as rp_name, sa.area_name, sa.area_number, 
sk.ksk_name, ss.sector_name, sc.connector_name, sit.input_type_name, sr2.reliability_name, sv.voltage_name, sv.voltage_value 
from st_houses sh join st_building_types sbt on sh.building_types_id = sbt.id join v_streets vs on sh.street_id = vs.street_id 
join wt_tgu sr on sh.rp_id = sr.id join st_areas sa on sh.area_id = sa.id join st_ksk sk on sh.ksk_id = sk.id 
join st_sectors ss on sh.sector_id = ss.id join st_connectors sc on sh.connector_id =sc.id 
join st_input_types sit on sh.input_type_id = sit.id join st_reliabilities sr2 on sh.reliability_id = sr2.id 
join st_voltage sv on sh.voltage_id = sv.id


-- create or replace view v_houses as
-- select sh.*, sbt.building_type_name, vs.street_name, vs.created, vs.city_name, sr.tgu_name as rp_name, sa.area_name, sa.area_number, 
-- sk.ksk_name, ss.sector_name, sc.connector_name, sit.input_type_name, sr2.reliability_name, sv.voltage_name, sv.voltage_value 
-- from st_houses sh, st_building_types sbt, v_streets vs, wt_tgu sr, st_areas sa, st_ksk sk, st_sectors ss, st_connectors sc, 
-- st_input_types sit, st_reliabilities sr2, st_voltage sv 
-- where sh.building_types_id = sbt.id and sh.street_id = vs.street_id and sh.rp_id = sr.id and sh.area_id = sa.id and sh.ksk_id = sk.id and 
-- sh.sector_id = ss.id and sh.connector_id =sc.id and sh.input_type_id = sit.id and sh.reliability_id = sr2.id and sh.voltage_id = sv.id 
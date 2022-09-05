create or replace view v_obj_contracts as
select woc.id, woc.contract_id, woc.obj_id, woc.type_id, woc.startdate::text, woc.enddate::text, vo.object_name, vo.reg_qty, vo.flat_number, vo.house_id, 
vo.house_number, vo.building_number, vo.city_name, vo.street_id, vo.street_name , vo.tariff_group_id, vo.tariff_group_name, vc.contract_number, 
vc.startdate::text as cstartdate, vc.enddate::text as cenddate, vc.customer_id, vc.custname, vc.сonsignee_id, vc.consname
from wt_obj_contract woc join v_objects vo on woc.obj_id = vo.id join v_contracts vc on woc.contract_id = vc.id 
where woc.type_id = 0
union
select woc.id, woc.contract_id, woc.obj_id, woc.type_id, woc.startdate::text, woc.enddate::text, 
wt.tgu_name, 0, '0', 0, '0', '0', 'ТГУ', 0, 'ТГУ', 1, 'ТГУ', vc.contract_number, 
vc.startdate::text as cstartdate, vc.enddate::text as cenddate, vc.customer_id, vc.custname, vc.сonsignee_id, vc.consname
from wt_obj_contract woc join wt_tgu wt on woc.obj_id = wt.id join v_contracts vc on woc.contract_id = vc.id
where woc.type_id > 0;


-- select woc.id, woc.contract_id, woc.obj_id, woc.type_id, woc.startdate::text, woc.enddate::text, vo.object_name, vo.reg_qty, vo.flat_number, vo.house_id, 
-- vo.house_number, vo.building_number, vo.city_name, vo.street_id, vo.street_name , vo.tariff_group_id, vo.tariff_group_name, vc.contract_number, 
-- vc.startdate::text as cstartdate, vc.enddate::text as cenddate, vc.customer_id, vc.custname, vc.сonsignee_id, vc.consname
-- from wt_obj_contract woc, v_objects vo, v_contracts vc
-- where woc.obj_id = vo.id and woc.contract_id = vc.id and woc.type_id = 0
-- union
-- select woc.id, woc.contract_id, woc.obj_id, woc.type_id, woc.startdate::text, woc.enddate::text, 
-- wt.tgu_name, 0, '0', 0, '0', '0', 'ТГУ', 0, 'ТГУ', 1, 'ТГУ', vc.contract_number, 
-- vc.startdate::text as cstartdate, vc.enddate::text as cenddate, vc.customer_id, vc.custname, vc.сonsignee_id, vc.consname
-- from wt_obj_contract woc, wt_tgu wt, v_contracts vc
-- where woc.obj_id = wt.id and woc.contract_id = vc.id and woc.type_id > 0;
create view v_seals as
select sl.id, sl.packet_number, sl.area_id, sl.staff_id, sl.seal_type_id, sl.seal_colour_id, sl.seal_status_id, sl.issue_date::text, 
sl.report_date::text, sa.area_name, ss.staff_name, sst.seal_type_name, ssc.seal_colour_name, sss.seal_status_name   
from st_seals sl, st_areas sa, st_staff ss, st_seal_types sst, st_seal_colours ssc, st_seal_statuses sss 
where sl.area_id = sa.id and sl.staff_id = ss.id and sl.seal_type_id = sst.id and sl.seal_colour_id = ssc.id and sl.seal_status_id = sss.id ;
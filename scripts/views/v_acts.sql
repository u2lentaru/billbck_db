create or replace view v_acts as
select vah.*, 
wad.id as wad_id, wad.detail_date::text as wad_date ,wad.pu_id, wad.pu_type_id, wad.pu_number, wad.pu_install_date::text,
wad.pu_check_interval, wad.pu_initial_value, wad.pu_dev_stopped, wad.startdate::text, wad.enddate::text, wad.pu_pid, wad.ad_pu_value,
wad.seal_id, wad.seal_number, wad.seal_date::text, wad.conclusion_id, wad.conclusion_num, wad.shutdown_type_id, wad.reason_id, 
wad.violation_id, wad.customer, wad.customer_phone, wad.customer_pos, wad.notes as wad_notes, null as pu_type_name, null as conclusion_name, 
null as shutdown_type_name, null as reason_name, null as violation_name 
from v_act_heads vah , wt_act_details wad
where vah.id = wad.act_id
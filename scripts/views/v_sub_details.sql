create or replace view v_sub_details as
select sub_id, sub_type, sub_phys, sub_descr, sub_name, bin, head_pos, head_name, acc_pos, acc_name, sub_address, sub_phone, 
created::text, sub_account, sst.type_name, sph.position_name as hname, spa.position_name as accname, job, email, mob_phone, job_phone, notes 
from st_sub_details ssd join st_sub_types sst on ssd.sub_type = sst.id left join st_positions sph on ssd.head_pos = sph.id
left join st_positions spa on ssd.acc_pos = spa.id;

-- create or replace view v_sub_details as
-- select sub_id, sub_type, sub_phys, sub_descr, sub_name, bin, head_pos, head_name, acc_pos, acc_name, sub_address, sub_phone, 
-- created::text, sub_account, sst.type_name, sph.position_name as hname, spa.position_name as accname, job, email, mob_phone, job_phone, notes 
-- from st_sub_details ssd, st_sub_types sst, st_positions sph, st_positions spa
-- where ssd.sub_type = sst.id and ssd.head_pos = sph.id and ssd.acc_pos = spa.id;
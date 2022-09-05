create or replace view v_users as
select su.id, su.user_name, su.org_id, su.lang_id, su.change_pass, su.position_id, su.full_name, 
su.created::text, su.closed::text, soi.full_name as org_name, sl.lang_name, sp.position_name 
from st_users su, st_org_info soi, st_langs sl, st_positions sp 
where su.org_id = soi.id and su.lang_id = sl.id and su.position_id = sp.id
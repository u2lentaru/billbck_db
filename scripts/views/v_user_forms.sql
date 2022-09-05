create or replace view v_user_forms as
select form_url, rights, user_id, user_name from st_forms sf, st_user_forms suf, st_users su 
where sf.id = suf.form_id and su.id = suf.user_id
create or replace view v_balance as
--func_balance_cnt(wt.id::int) correct for v_balance!!! chldcnt = 0 for tgu_type_id = 0 !!!
select wt.id, wt.pid, wt.tgu_name, wt.tgu_type_id, stt.tgu_type_name, 1 as chldcnt, '1:'||cast(wt.id as text) as reqid 
from wt_tgu wt, st_tgu_types stt 
where wt.tgu_type_id = stt.id 
union all
select wo.id, sh.rp_id, wo.object_name, 0, 'Потребитель', 0, '0:'||cast(wo.id as text) as reqid 
from wt_objects wo, st_houses sh 
where wo.house_id = sh.id and mff_id is null;
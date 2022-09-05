create or replace view v_trans_curr as
select stc.id, stc.trans_curr_name, stc.trans_type_id, stc.checkdate::text, stc.nextcheckdate::text, 
stc.proddate::text, stc.serial1, stc.serial2, stc.serial3, stt.trans_type_name, stt.ratio, stt."class", 
stt.maxcurr, stt.nomcurr
from st_trans_curr stc join st_trans_types stt on stc.trans_type_id = stt.id;
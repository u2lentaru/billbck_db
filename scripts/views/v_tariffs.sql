create view v_tariffs as
select st.id, st.tariff_name, st.tariff_group_id, st.norma, st.tariff, st.startdate::text, st.enddate::text, stg.tariff_group_name
from st_tariffs st, st_tariff_groups stg
where st.tariff_group_id = stg.id 

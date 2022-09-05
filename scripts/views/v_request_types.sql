create or replace view v_request_types as
select rt.*, rk.request_kind_name 
from st_request_types rt join st_request_kinds rk on rt.request_kind_id = rk.id
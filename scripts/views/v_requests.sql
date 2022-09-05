create or replace view v_requests as
select wr.id, wr.request_number, wr.request_date::text, wr.contract_id, wr.service_type_id, wr.request_type_id, wr.request_kind_id, 
wr.claim_type_id, wr.term_date::text, wr.executive, wr.accept, wr.notes, wr.result_id, wr.act_id, wr.obj_id, wcd.contract_number, 
sst.service_type_name, srt.request_type_name, srk.request_kind_name, sct.claim_type_name, sr.result_name, wa.act_number, wo.object_name 
from wt_requests wr left join wt_contract_details wcd on wr.contract_id = wcd.contract_id 
left join st_service_types sst on wr.service_type_id = sst.id left join st_request_types srt on wr.request_type_id = srt.id
left join st_request_kinds srk on wr.request_kind_id = srk.id left join st_claim_types sct on wr.claim_type_id = sct.id
left join st_results sr on wr.result_id = sr.id left join wt_acts wa on wr.act_id = wa.id 
left join wt_objects wo on wr.obj_id = wo.id 
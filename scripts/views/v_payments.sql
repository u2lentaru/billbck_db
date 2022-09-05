create or replace view v_payments as
select wp.id, wp.payment_date::text, wp.contract_id, wp.obj_id, wp.payment_type_id, wp.charge_type_id, wp.cashdesk_id,
wp.bundle_number, wp.amount, wcd.contract_number, wo.object_name, spt.payment_type_name, sct.charge_type_name, sc.cashdesk_name 
from wt_payments wp join wt_contract_details wcd on wp.contract_id = wcd.contract_id join wt_objects wo on wp.obj_id = wo.id 
join st_payment_types spt on wp.payment_type_id = spt.id join st_charge_types sct on wp.charge_type_id = sct.id join st_cashdesks sc on wp.cashdesk_id = sc.id 
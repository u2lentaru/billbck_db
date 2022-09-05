create view v_pu_values as
select wpv.id, wpv.pu_id, wpv.value_date::text, wpv.pu_value from wt_pu_values wpv;
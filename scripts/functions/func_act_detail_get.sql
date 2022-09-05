CREATE OR REPLACE FUNCTION func_act_detail_get(x int) RETURNS v_acts AS
$$
DECLARE
ret v_acts;
BEGIN
	select va.id, va.act_type_id, va.act_number, va.act_date, va.object_id, va.staff_id, va.notes, va.activated, va.act_type_name, 
    va.object_name, va.flat_number, va.reg_qty, va.street_name, va.city_name, va.house_number, va.building_number, va.tariff_group_name, 
    va.staff_name, va.wad_id, va.wad_date, va.pu_id, va.pu_type_id, va.pu_number, va.pu_install_date, va.pu_check_interval, 
    va.pu_initial_value, va.pu_dev_stopped, va.startdate, va.enddate, va.pu_pid, va.ad_pu_value, va.seal_id, va.seal_number, va.seal_date, 
    va.conclusion_id, va.conclusion_num, va.shutdown_type_id, va.reason_id, va.violation_id, va.customer , va.customer_phone, va.customer_pos, 
    va.wad_notes, ptn.pu_type_name, fcg.conclusion_name, fst.shutdown_type_name, frg.reason_name, fvg.violation_name
    from public.v_acts va, func_pu_type_get(pu_type_id::int) ptn, func_conclusion_get(conclusion_id) fcg, func_reason_get(reason_id) frg,
    func_violation_get(violation_id) fvg, func_shutdown_type_get(shutdown_type_id) fst 
    where wad_id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
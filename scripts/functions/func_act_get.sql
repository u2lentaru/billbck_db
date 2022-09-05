CREATE OR REPLACE FUNCTION func_act_get(x int) RETURNS v_act_heads AS
$$
DECLARE
ret v_act_heads;
BEGIN
    if x is null then
    	select null as id, null as act_type_id, null as act_number, null as act_date, null as object_id, 
        null as staff_id, null as notes, null as activated, null as act_type_name, null as object_name, 
        null as flat_number, null as reg_qty, null as street_name, null as city_name, null as house_number, 
        null as building_number, null as tariff_group_name, null as staff_name 
        from public.v_act_heads va into ret;
    else
	    select va.id, va.act_type_id, va.act_number, va.act_date, va.object_id, va.staff_id, va.notes, va.activated, va.act_type_name, va.object_name, 
        va.flat_number, va.reg_qty, va.street_name, va.city_name, va.house_number, va.building_number, va.tariff_group_name, va.staff_name 
        from public.v_act_heads va 
        where va.id = x into ret;
    end if;
    return ret;
END
$$ LANGUAGE 'plpgsql';
CREATE OR REPLACE FUNCTION func_equipment_getbyid(x int) RETURNS v_equipment AS
$$
DECLARE
ret v_equipment;
BEGIN
	select * from public.v_equipment where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
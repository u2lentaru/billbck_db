CREATE OR REPLACE FUNCTION func_charge_type_get(x int) RETURNS st_charge_types AS
$$
DECLARE
ret st_charge_types;
BEGIN
	select * from public.st_charge_types where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
CREATE OR REPLACE FUNCTION func_equipment_type_get(x int) RETURNS st_equipment_types AS
$$
DECLARE
ret st_equipment_types;
BEGIN
	select * from public.st_equipment_types where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
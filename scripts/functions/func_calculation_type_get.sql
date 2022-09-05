CREATE OR REPLACE FUNCTION func_calculation_type_get(x int) RETURNS st_calculation_types AS
$$
DECLARE
ret st_calculation_types;
BEGIN
	select * from public.st_calculation_types where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
CREATE OR REPLACE FUNCTION func_pu_value_type_get(x int) RETURNS st_pu_value_types AS
$$
DECLARE
ret st_pu_value_types;
BEGIN
	select * from public.st_pu_value_types where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
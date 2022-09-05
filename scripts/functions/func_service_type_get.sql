CREATE OR REPLACE FUNCTION func_service_type_get(x int) RETURNS st_service_types AS
$$
DECLARE
ret st_service_types;
BEGIN
	select * from public.st_service_types where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
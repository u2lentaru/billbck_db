CREATE OR REPLACE FUNCTION func_shutdown_type_get(x int) RETURNS st_shutdown_types AS
$$
DECLARE
ret st_shutdown_types;
BEGIN
	select * from public.st_shutdown_types where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
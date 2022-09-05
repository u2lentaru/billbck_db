CREATE OR REPLACE FUNCTION func_seal_type_get(x int) RETURNS st_seal_types AS
$$
DECLARE
ret st_seal_types;
BEGIN
	select * from public.st_seal_types where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
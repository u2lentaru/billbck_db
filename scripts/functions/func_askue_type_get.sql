CREATE OR REPLACE FUNCTION func_askue_type_get(x int) RETURNS st_askue_types AS
$$
DECLARE
ret st_askue_types;
BEGIN
	select * from public.st_askue_types where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
CREATE OR REPLACE FUNCTION func_obj_type_get(x int) RETURNS st_obj_types AS
$$
DECLARE
ret st_obj_types;
BEGIN
	select * from public.st_obj_types where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
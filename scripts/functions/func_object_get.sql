CREATE OR REPLACE FUNCTION func_object_get(x int) RETURNS v_objects AS
$$
DECLARE
ret v_objects;
BEGIN
	select * from public.v_objects where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
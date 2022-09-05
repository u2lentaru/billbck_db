CREATE OR REPLACE FUNCTION func_act_type_get(x int) RETURNS st_act_types AS
$$
DECLARE
ret st_act_types;
BEGIN
	select * from public.st_act_types where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
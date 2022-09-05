CREATE OR REPLACE FUNCTION func_trans_type_get(x int) RETURNS st_trans_types AS
$$
DECLARE
ret st_trans_types;
BEGIN
	select * from public.st_trans_types where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
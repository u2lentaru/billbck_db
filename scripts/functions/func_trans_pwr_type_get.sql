CREATE OR REPLACE FUNCTION func_trans_pwr_type_get(x int) RETURNS st_trans_pwr_types AS
$$
DECLARE
ret st_trans_pwr_types;
BEGIN
	select * from public.st_trans_pwr_types where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
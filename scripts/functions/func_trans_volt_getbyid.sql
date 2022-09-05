CREATE OR REPLACE FUNCTION func_trans_volt_getbyid(x int) RETURNS v_trans_volt AS
$$
DECLARE
ret v_trans_volt;
BEGIN
	select * from public.v_trans_volt where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
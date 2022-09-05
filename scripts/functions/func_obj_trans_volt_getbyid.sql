CREATE OR REPLACE FUNCTION func_obj_trans_volt_getbyid(x int) RETURNS v_obj_trans_volt AS
$$
DECLARE
ret v_obj_trans_volt;
BEGIN
	select * from public.v_obj_trans_volt where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
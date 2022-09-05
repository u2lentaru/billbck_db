CREATE OR REPLACE FUNCTION func_trans_pwr_getbyid(x int) RETURNS v_trans_pwr AS
$$
DECLARE
ret v_trans_pwr;
BEGIN
	select * from public.v_trans_pwr where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
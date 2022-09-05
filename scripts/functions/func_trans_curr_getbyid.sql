CREATE OR REPLACE FUNCTION func_trans_curr_getbyid(x int) RETURNS v_trans_curr AS
$$
DECLARE
ret v_trans_curr;
BEGIN
	select * from public.v_trans_curr where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
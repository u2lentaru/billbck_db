CREATE OR REPLACE FUNCTION func_tp_getbyid(x int) RETURNS v_tp AS
$$
DECLARE
ret v_tp;
BEGIN
	select * from public.v_tp where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
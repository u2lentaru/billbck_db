CREATE OR REPLACE FUNCTION func_rp_getbyid(x int) RETURNS v_rp AS
$$
DECLARE
ret v_rp;
BEGIN
	select * from public.v_rp where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
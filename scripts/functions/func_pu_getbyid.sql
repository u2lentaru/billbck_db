CREATE OR REPLACE FUNCTION func_pu_getbyid(x int) RETURNS v_pu AS
$$
DECLARE
ret v_pu;
BEGIN
	select * from public.v_pu where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
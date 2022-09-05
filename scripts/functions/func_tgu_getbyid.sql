CREATE OR REPLACE FUNCTION func_tgu_getbyid(x int) RETURNS v_tgu AS
$$
DECLARE
ret v_tgu;
BEGIN
	select * from public.v_tgu where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
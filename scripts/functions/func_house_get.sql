CREATE OR REPLACE FUNCTION func_house_get(x int) RETURNS v_houses AS
$$
DECLARE
ret v_houses;
BEGIN
	select * from public.v_houses where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
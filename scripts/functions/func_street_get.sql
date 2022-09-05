CREATE OR REPLACE FUNCTION func_street_get(x int) RETURNS v_streets AS
$$
DECLARE
ret v_streets;
BEGIN
	select * from public.v_streets where street_id = x and closed is null into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
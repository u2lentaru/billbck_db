CREATE OR REPLACE FUNCTION func_seal_get(x int) RETURNS v_seals AS
$$
DECLARE
ret v_seals;
BEGIN
	select * from public.v_seals where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
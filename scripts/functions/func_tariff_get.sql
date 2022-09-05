CREATE OR REPLACE FUNCTION func_tariff_get(x int) RETURNS v_tariffs AS
$$
DECLARE
ret v_tariffs;
BEGIN
	select * from public.v_tariffs where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
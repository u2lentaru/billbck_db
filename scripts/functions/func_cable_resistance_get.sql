CREATE OR REPLACE FUNCTION func_cable_resistance_get(x int) RETURNS st_cable_resistances AS
$$
DECLARE
ret st_cable_resistances;
BEGIN
	select * from public.st_cable_resistances where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
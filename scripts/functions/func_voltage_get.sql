CREATE OR REPLACE FUNCTION func_voltage_get(vi int) RETURNS st_voltage AS
$$
DECLARE
ret st_voltage;
BEGIN
	select * from public.st_voltage where id = vi into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
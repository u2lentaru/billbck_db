CREATE OR REPLACE FUNCTION func_reliability_get(ri int) RETURNS st_reliabilities AS
$$
DECLARE
ret st_reliabilities;
BEGIN
	select * from public.st_reliabilities where id = ri into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
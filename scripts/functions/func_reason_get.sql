CREATE OR REPLACE FUNCTION func_reason_get(x int) RETURNS st_reasons AS
$$
DECLARE
ret st_reasons;
BEGIN
	select * from public.st_reasons where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
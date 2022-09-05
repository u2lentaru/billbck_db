CREATE OR REPLACE FUNCTION func_seal_status_get(x int) RETURNS st_seal_statuses AS
$$
DECLARE
ret st_seal_statuses;
BEGIN
	select * from public.st_seal_statuses where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
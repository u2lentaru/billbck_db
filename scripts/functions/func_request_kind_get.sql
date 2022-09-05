CREATE OR REPLACE FUNCTION func_request_kind_get(x int) RETURNS st_request_kinds AS
$$
DECLARE
ret st_request_kinds;
BEGIN
	select * from public.st_request_kinds where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
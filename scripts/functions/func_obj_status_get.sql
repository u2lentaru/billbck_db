CREATE OR REPLACE FUNCTION func_obj_status_get(x int) RETURNS st_obj_statuses AS
$$
DECLARE
ret st_obj_statuses;
BEGIN
	select * from public.st_obj_statuses where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
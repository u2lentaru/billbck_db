CREATE OR REPLACE FUNCTION func_grp_getbyid(x int) RETURNS st_grp AS
$$
DECLARE
ret st_grp;
BEGIN
	select * from public.st_grp where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
CREATE OR REPLACE FUNCTION func_uzo_getbyid(x int) RETURNS st_uzo AS
$$
DECLARE
ret st_uzo;
BEGIN
	select * from public.st_uzo where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
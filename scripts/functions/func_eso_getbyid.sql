CREATE OR REPLACE FUNCTION func_eso_getbyid(ei int) RETURNS st_eso AS
$$
DECLARE
ret st_eso;
BEGIN
	select * from public.st_eso where id = ei into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
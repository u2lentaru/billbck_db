CREATE OR REPLACE FUNCTION func_sub_pu_getbyid(x int) RETURNS st_sub_pu AS
$$
DECLARE
ret st_sub_pu;
BEGIN
	select * from public.st_sub_pu where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
CREATE OR REPLACE FUNCTION func_violation_get(x int) RETURNS st_violations AS
$$
DECLARE
ret st_violations;
BEGIN
	select * from public.st_violations where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
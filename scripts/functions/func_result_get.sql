CREATE OR REPLACE FUNCTION func_result_get(x int) RETURNS st_results AS
$$
DECLARE
ret st_results;
BEGIN
	select * from public.st_results where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
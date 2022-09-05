CREATE OR REPLACE FUNCTION func_conclusion_get(x int) RETURNS st_conclusions AS
$$
DECLARE
ret st_conclusions;
BEGIN
	select * from public.st_conclusions where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
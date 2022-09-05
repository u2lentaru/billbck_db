CREATE OR REPLACE FUNCTION func_cashdesk_get(x int) RETURNS st_cashdesks AS
$$
DECLARE
ret st_cashdesks;
BEGIN
	select * from public.st_cashdesks where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
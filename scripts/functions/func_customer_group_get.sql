CREATE OR REPLACE FUNCTION func_customer_group_get(cgi int) RETURNS st_customer_groups AS
$$
DECLARE
ret st_customer_groups;
BEGIN
	select * from public.st_customer_groups where id = cgi into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
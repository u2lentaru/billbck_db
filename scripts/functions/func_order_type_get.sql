CREATE OR REPLACE FUNCTION func_order_type_get(x int) RETURNS st_order_types AS
$$
DECLARE
ret st_order_types;
BEGIN
	select * from public.st_order_types where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
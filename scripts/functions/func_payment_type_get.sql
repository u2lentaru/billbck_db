CREATE OR REPLACE FUNCTION func_payment_type_get(x int) RETURNS st_payment_types AS
$$
DECLARE
ret st_payment_types;
BEGIN
	select * from public.st_payment_types where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
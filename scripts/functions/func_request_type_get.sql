CREATE OR REPLACE FUNCTION func_request_type_get(x int) RETURNS v_request_types AS
$$
DECLARE
ret v_request_types;
BEGIN
	select * from public.v_request_types where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
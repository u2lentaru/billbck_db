CREATE OR REPLACE FUNCTION func_request_get(x int) RETURNS v_requests AS
$$
DECLARE
ret v_requests;
BEGIN
	select * from v_requests where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
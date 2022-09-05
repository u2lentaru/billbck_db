CREATE OR REPLACE FUNCTION func_staff_getbyid(x int) RETURNS v_staff AS
$$
DECLARE
ret v_staff;
BEGIN
	select * from public.v_staff where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
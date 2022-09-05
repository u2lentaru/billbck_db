CREATE OR REPLACE FUNCTION func_user_get(x int) RETURNS v_users AS
$$
DECLARE
ret v_users;
BEGIN
	select * from public.v_users where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
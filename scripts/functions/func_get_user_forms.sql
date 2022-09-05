CREATE OR REPLACE FUNCTION func_get_user_forms(usrnm text) RETURNS SETOF v_user_forms AS
$$
BEGIN
	return query select * from public.v_user_forms where user_id in 
	(select id from public.st_users where user_name = usrnm);
END
$$ LANGUAGE 'plpgsql';
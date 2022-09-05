CREATE OR REPLACE FUNCTION func_user_getauth(un text, fn text) 
RETURNS table(c boolean, r boolean, u boolean, d boolean) AS
$$
DECLARE
i int := 0;
BEGIN
	select count(*) from v_user_forms 
	where user_name = un and form_url = fn into i;
	if (i = 0) 
	then
		RETURN query select false, false, false, false;
	end if;
	RETURN query
	select (rights->'Create')::boolean, (rights->'Read')::boolean, (rights->'Update')::boolean, (rights->'Delete')::boolean 
	from v_user_forms where user_name = un and form_url = fn;    
END
$$ LANGUAGE 'plpgsql';
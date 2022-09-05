CREATE OR REPLACE FUNCTION func_users_add(n text, np text, o int, l int, cp boolean, p int, fn text, sd text) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	begin
		insert into public.st_users (user_name, org_id, lang_id, change_pass, position_id, full_name, created) 
        values (n, o, l, cp, p, fn, to_date(sd, 'YYYY-mm-dd')) returning id into i;
	exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;
	create user n with password np;
	return i;
END
$$ LANGUAGE 'plpgsql';
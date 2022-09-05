CREATE OR REPLACE FUNCTION func_users_upd(x int, n text, o int, l int, cp boolean, p int, fn text, sd text, ed text) RETURNS int AS
$$
DECLARE
i int := 0;
BEGIN
	begin
        update public.st_users set (user_name, org_id, lang_id, change_pass, position_id, full_name, created, closed) = 
        (n, o, l, cp, p, fn, to_date(sd, 'YYYY-mm-dd'), to_date(ed, 'YYYY-mm-dd')) 
        where id = x returning id into i;
	exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;
    if ( i is null ) then
		return 0;
	end if;
	return i;
END
$$ LANGUAGE 'plpgsql';
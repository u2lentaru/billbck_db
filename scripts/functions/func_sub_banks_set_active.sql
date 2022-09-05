CREATE OR REPLACE FUNCTION func_sub_banks_set_active(x int) RETURNS int AS
$$
DECLARE
i int := 0;
BEGIN
	begin
		update public.st_sub_banks set active = false
		where sub_id = (select sub_id from public.st_sub_banks where id = x);
        update public.st_sub_banks set active = true
		where id = x returning id into i;
	exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;
    if ( i is null )
	then
		return 0;
	end if;
	return i;
END
$$ LANGUAGE 'plpgsql';
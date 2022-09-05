CREATE OR REPLACE FUNCTION func_customer_groups_upd(cgi int,cgn text) RETURNS int AS
$$
DECLARE
i int :=0;
BEGIN
	begin
        update public.st_customer_groups set customer_group_name = cgn where id = cgi returning id into i;
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
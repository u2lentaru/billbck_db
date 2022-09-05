CREATE OR REPLACE FUNCTION func_customer_groups_del(cgi int) RETURNS int AS
$$
DECLARE
i int :=0;
BEGIN
	begin
        delete from public.st_customer_groups where id = cgi returning id into i;
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
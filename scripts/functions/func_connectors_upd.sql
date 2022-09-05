CREATE OR REPLACE FUNCTION func_connectors_upd(ci int,cn text) RETURNS int AS
$$
DECLARE
i int :=0;
BEGIN
	begin
        update public.st_connectors set connector_name = cn where id = ci returning id into i;
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
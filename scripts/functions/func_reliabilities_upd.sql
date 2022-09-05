CREATE OR REPLACE FUNCTION func_reliabilities_upd(ri int,rn text) RETURNS int AS
$$
DECLARE
i int :=0;
BEGIN
	begin
        update public.st_reliabilities set reliability_name = rn where id = ri returning id into i;
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
CREATE OR REPLACE FUNCTION func_reasons_upd(x int,n text) RETURNS int AS
$$
DECLARE
i int :=0;
BEGIN
	begin
        update public.st_reasons set reason_name = n where id = x returning id into i;
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
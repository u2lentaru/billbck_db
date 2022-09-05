CREATE OR REPLACE FUNCTION func_claim_types_del(x int) RETURNS int AS
$$
DECLARE
i int :=0;
BEGIN
	begin
        delete from public.st_claim_types where id = x returning id into i;
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
CREATE OR REPLACE FUNCTION func_uzo_upd(x int,n text, v int) RETURNS int AS
$$
DECLARE
i int :=0;
BEGIN
	begin
        update public.st_uzo set (uzo_name, uzo_value) = (n, v) where id = x returning id into i;
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
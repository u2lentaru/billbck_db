CREATE OR REPLACE FUNCTION func_eso_upd(ei int,en text) RETURNS int AS
$$
DECLARE
i int :=0;
BEGIN
	begin
        update public.st_eso set eso_name = en where id = ei returning id into i;
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
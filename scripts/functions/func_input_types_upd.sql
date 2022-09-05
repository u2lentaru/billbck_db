CREATE OR REPLACE FUNCTION func_input_types_upd(iti int,itn text) RETURNS int AS
$$
DECLARE
i int :=0;
BEGIN
	begin
        update public.st_input_types set input_type_name = itn where id = iti returning id into i;
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
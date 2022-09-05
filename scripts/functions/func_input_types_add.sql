CREATE OR REPLACE FUNCTION func_input_types_add(itn text) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	begin
		insert into public.st_input_types (id, input_type_name) values (default, itn) returning id into i;
	exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;
	return i;
END
$$ LANGUAGE 'plpgsql';
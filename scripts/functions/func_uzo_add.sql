CREATE OR REPLACE FUNCTION func_uzo_add(n text, v int) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	begin
		insert into public.st_uzo (id, uzo_name, uzo_value) values (default, n, v) returning id into i;
	exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;
	return i;
END
$$ LANGUAGE 'plpgsql';
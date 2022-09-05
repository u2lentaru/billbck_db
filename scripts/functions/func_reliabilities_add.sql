CREATE OR REPLACE FUNCTION func_reliabilities_add(rn text) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	begin
		insert into public.st_reliabilities (id, reliability_name) values (default, rn) returning id into i;
	exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;
	return i;
END
$$ LANGUAGE 'plpgsql';
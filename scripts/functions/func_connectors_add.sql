CREATE OR REPLACE FUNCTION func_connectors_add(cn text) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	begin
		insert into public.st_connectors (id, connector_name) values (default, cn) returning id into i;
	exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;
	return i;
END
$$ LANGUAGE 'plpgsql';
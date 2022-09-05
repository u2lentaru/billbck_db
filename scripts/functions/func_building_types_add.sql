CREATE OR REPLACE FUNCTION func_building_types_add(btn text) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	begin
		insert into public.st_building_types (id, building_type_name) values (default, btn) returning id into i;
	exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;
	return i;
END
$$ LANGUAGE 'plpgsql';
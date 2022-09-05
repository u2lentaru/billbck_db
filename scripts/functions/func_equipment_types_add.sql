CREATE OR REPLACE FUNCTION func_equipment_types_add(n text, p numeric) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	begin
		insert into public.st_equipment_types (equipment_type_name, equipment_type_power) values (n, p) returning id into i;
	exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;
	return i;
END
$$ LANGUAGE 'plpgsql';
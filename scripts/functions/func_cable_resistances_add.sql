CREATE OR REPLACE FUNCTION func_cable_resistances_add(n text, r numeric(10,3), m boolean) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	begin
		insert into public.st_cable_resistances (cable_resistance_name, resistance, material_type) 
        values (n, r, m) returning id into i;
	exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;
	return i;
END
$$ LANGUAGE 'plpgsql';
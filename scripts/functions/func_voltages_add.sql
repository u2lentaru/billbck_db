CREATE OR REPLACE FUNCTION func_voltages_add(vn text, vv int) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	begin
		insert into public.st_voltage (id, voltage_name, voltage_value) values (default, vn, vv) returning id into i;
	exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;
	return i;
END
$$ LANGUAGE 'plpgsql';
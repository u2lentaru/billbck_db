CREATE OR REPLACE FUNCTION func_equipment_add(t int, o int, q int, w numeric) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	begin
		insert into public.st_equipment (equipment_type_id, obj_id, qty, working_hours) values (t, o, q, w) returning id into i;
	exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;
	return i;
END
$$ LANGUAGE 'plpgsql';
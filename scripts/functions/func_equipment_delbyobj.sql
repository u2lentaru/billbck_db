CREATE OR REPLACE FUNCTION func_equipment_delbyobj(x int) RETURNS int AS
$$
BEGIN
	begin
        delete from public.st_equipment where obj_id = x;
	exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;
	return 1;
END
$$ LANGUAGE 'plpgsql';
CREATE OR REPLACE FUNCTION func_building_types_upd(ibt int, btn text) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	begin
		update public.st_building_types set building_type_name = btn where id = ibt returning id into i;
	exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;
	return i;
END
$$ LANGUAGE 'plpgsql';
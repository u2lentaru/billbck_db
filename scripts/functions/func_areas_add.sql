CREATE OR REPLACE FUNCTION func_areas_add(anb text, anm text) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	begin
		insert into public.st_areas (id, area_number, area_name) values (default, anb, anm) returning id into i;
	exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;
	return i;
END
$$ LANGUAGE 'plpgsql';
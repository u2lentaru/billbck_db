CREATE OR REPLACE FUNCTION func_areas_upd(ai int,anb text, anm text) RETURNS int AS
$$
DECLARE
i int :=0;
BEGIN
	begin
        update public.st_areas set (area_number, area_name) = (anb, anm) where id = ai returning id into i;
	exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;
    if ( i is null )
	then
		return 0;
	end if;
	return i;
END
$$ LANGUAGE 'plpgsql';
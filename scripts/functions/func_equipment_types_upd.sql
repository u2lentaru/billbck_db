CREATE OR REPLACE FUNCTION func_equipment_types_upd(x int,n text, p numeric) RETURNS int AS
$$
DECLARE
i int := 0;
BEGIN
	begin
        update public.st_equipment_types set (equipment_type_name, equipment_type_power) = (n, p) where id = x returning id into i;
	exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;
    if ( i is null ) then
		return 0;
	end if;
	return i;
END
$$ LANGUAGE 'plpgsql';
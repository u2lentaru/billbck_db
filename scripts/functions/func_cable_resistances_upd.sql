CREATE OR REPLACE FUNCTION func_cable_resistances_upd(x int, n text, r numeric(10,3), m boolean) RETURNS int AS
$$
DECLARE
i int :=0;
BEGIN
	begin
        update public.st_cable_resistances set (cable_resistance_name, resistance, material_type) = 
        (n, r, m) where id = x returning id into i;
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
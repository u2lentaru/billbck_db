CREATE OR REPLACE FUNCTION func_voltages_upd(vi int,vn text, vv int) RETURNS int AS
$$
DECLARE
i int :=0;
BEGIN
	begin
        update public.st_voltage set (voltage_name, voltage_value) = (vn, vv) where id = vi returning id into i;
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
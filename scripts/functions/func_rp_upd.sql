CREATE OR REPLACE FUNCTION func_rp_upd(x int, n text, v text, i1 int, o1 int, o2 int, r int) RETURNS int AS
$$
DECLARE
i int :=0;
BEGIN
	begin
        update public.st_rp set (rp_name, inv_number, input_voltage, output_voltage1, output_voltage2, tp_id) = (n, v, i1, o1, o2, r) 
        where id = x returning id into i;
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
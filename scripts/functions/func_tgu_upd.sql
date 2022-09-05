CREATE OR REPLACE FUNCTION func_tgu_upd(x int,px int, n text, tx int, nb text, iv int, ov1 int, ov2 int) RETURNS int AS
$$
DECLARE
i int := 0;
BEGIN
	begin
        update public.wt_tgu set (pid, tgu_name, tgu_type_id, inv_number, input_voltage, output_voltage1, output_voltage2) = 
        (px, n, tx, nb, iv, ov1, ov2) where id = x returning id into i;
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
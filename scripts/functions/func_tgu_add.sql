CREATE OR REPLACE FUNCTION func_tgu_add(px int, n text, tx int, nb text, iv int, ov1 int, ov2 int) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	begin
		insert into public.wt_tgu (pid, tgu_name, tgu_type_id, inv_number, input_voltage, output_voltage1, output_voltage2) 
        values (px, n, tx, nb, iv, ov1, ov2) returning id into i;
	exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;
	return i;
END
$$ LANGUAGE 'plpgsql';
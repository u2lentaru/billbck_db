CREATE OR REPLACE FUNCTION func_trans_pwr_types_add(n text, scp numeric(10,2), ilp numeric(10,2), np int) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	begin
		insert into public.st_trans_pwr_types (trans_pwr_type_name, short_circuit_power, idling_loss_power, nominal_power) 
        values (n, scp, ilp, np) returning id into i;
	exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;
	return i;
END
$$ LANGUAGE 'plpgsql';
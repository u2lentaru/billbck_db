CREATE OR REPLACE FUNCTION func_trans_pwr_add(n text, t int) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	begin
		insert into public.st_trans_pwr (trans_pwr_name, trans_pwr_type_id)
        values (n, t) returning id into i;
	exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;
	return i;
END
$$ LANGUAGE 'plpgsql';
CREATE OR REPLACE FUNCTION func_pu_values_add(x int, d text, v numeric) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	begin
		insert into public.wt_pu_values (pu_id, value_date, pu_value) values (x, to_date(d, 'YYYY-mm-dd'), v) returning id into i;
	exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;
	return i;
END
$$ LANGUAGE 'plpgsql';
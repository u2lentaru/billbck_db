CREATE OR REPLACE FUNCTION func_acts_add(t int, n text, d text, o int, st int, nt text) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	begin
		insert into public.wt_acts (id, act_type_id, act_number, act_date, object_id, staff_id, notes) 
		values (default, t, n, to_date(d, 'YYYY-mm-dd'), o, st, nt) 
        returning id into i;
	exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;
	return i;
END
$$ LANGUAGE 'plpgsql';
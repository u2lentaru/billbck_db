CREATE OR REPLACE FUNCTION func_acts_upd(x int, t int, n text, d text, o int, st int, nt text) RETURNS int AS
$$
DECLARE
i int :=0;
BEGIN
	begin
        update public.wt_acts set (act_type_id, act_number, act_date, object_id, staff_id, notes) = 
		(t, n, to_date(d, 'YYYY-mm-dd'), o, st, nt) 
        where id = x returning id into i;
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
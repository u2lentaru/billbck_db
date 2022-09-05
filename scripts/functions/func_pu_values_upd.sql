CREATE OR REPLACE FUNCTION func_pu_values_upd(x int,d text, v numeric) RETURNS int AS
$$
DECLARE
i int :=0;
BEGIN
	begin
        update public.wt_pu_values set (value_date, pu_value) = (to_date(d, 'YYYY-mm-dd'), v) where id = x returning id into i;
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
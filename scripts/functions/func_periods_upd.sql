CREATE OR REPLACE FUNCTION func_periods_upd(x int, n text, sd text, ed text) RETURNS int AS
$$
DECLARE
i int :=0;
BEGIN
	begin
        update public.st_periods set (period_name, drperiod) = 
        (n,daterange(to_date(sd, 'YYYY-mm-dd'), to_date(ed, 'YYYY-mm-dd'),'[]')) where id = x returning id into i;
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
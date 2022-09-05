CREATE OR REPLACE FUNCTION func_periods_add(n text, sd text, ed text) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	begin
		insert into public.st_periods (period_name, drperiod) 
        values (n, daterange(to_date(sd, 'YYYY-mm-dd'), to_date(ed, 'YYYY-mm-dd'),'[]')) returning id into i;
	exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;
	return i;
END
$$ LANGUAGE 'plpgsql';
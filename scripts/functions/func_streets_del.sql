CREATE OR REPLACE FUNCTION func_streets_del(x int, d text) RETURNS int AS
$$
DECLARE
i int :=0;
BEGIN
	begin
        update public.st_street_names set closed = to_date(d, 'YYYY-mm-dd') where street_id = x returning x into i;
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
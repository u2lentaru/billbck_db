CREATE OR REPLACE FUNCTION func_streets_add(n text, c int, d text) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	insert into public.st_streets (id, city_id) values (default, c) returning id into i;
	-- id not exist
	if ( i is null )
	then
		return 0;
	end if;
	insert into public.st_street_names (street_id, street_name, created, closed) values (i, n, to_date(d, 'YYYY-mm-dd'), null);
	return i;
END
$$ LANGUAGE 'plpgsql';
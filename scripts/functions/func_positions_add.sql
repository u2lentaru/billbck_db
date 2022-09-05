CREATE OR REPLACE FUNCTION func_positions_add(pn text) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	insert into public.st_positions (id, position_name) values (default, pn) returning id into i;
	-- id not exist
	if ( i is null )
	then
		return 0;
	end if;
	return i;
END
$$ LANGUAGE 'plpgsql';
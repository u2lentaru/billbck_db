CREATE OR REPLACE FUNCTION func_positions_upd(ip int, pn text) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	update public.st_positions set position_name = pn where id = ip returning id into i;
    -- id not exist
	if ( i is null )
	then
		return 0;
	end if;
	return i;
END
$$ LANGUAGE 'plpgsql';
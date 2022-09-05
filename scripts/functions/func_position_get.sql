CREATE OR REPLACE FUNCTION func_position_get(ip int) RETURNS st_positions AS
$$
DECLARE
ret st_positions;
BEGIN
	select id, position_name from public.st_positions where id = ip into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
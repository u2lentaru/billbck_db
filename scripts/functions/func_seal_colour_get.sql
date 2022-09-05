CREATE OR REPLACE FUNCTION func_seal_colour_get(x int) RETURNS st_seal_colours AS
$$
DECLARE
ret st_seal_colours;
BEGIN
	select * from public.st_seal_colours where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
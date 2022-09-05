CREATE OR REPLACE FUNCTION func_area_get(ia int) RETURNS st_areas AS
$$
DECLARE
ret st_areas;
BEGIN
	select * from public.st_areas where id = ia into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
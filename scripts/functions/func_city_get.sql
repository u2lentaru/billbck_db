CREATE OR REPLACE FUNCTION func_city_get(x int) RETURNS st_cities AS
$$
DECLARE
ret st_cities;
BEGIN
	select * from public.st_cities where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
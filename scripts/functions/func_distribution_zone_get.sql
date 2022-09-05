CREATE OR REPLACE FUNCTION func_distribution_zone_get(x int) RETURNS st_distribution_zones AS
$$
DECLARE
ret st_distribution_zones;
BEGIN
	select * from public.st_distribution_zones where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
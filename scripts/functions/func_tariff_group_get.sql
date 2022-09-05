CREATE OR REPLACE FUNCTION func_tariff_group_get(x int) RETURNS st_tariff_groups AS
$$
DECLARE
ret st_tariff_groups;
BEGIN
	select * from public.st_tariff_groups where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
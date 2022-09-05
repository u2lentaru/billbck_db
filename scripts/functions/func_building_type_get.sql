CREATE OR REPLACE FUNCTION func_building_type_get(ibt int) RETURNS st_building_types AS
$$
DECLARE
ret st_building_types;
BEGIN
	select id, building_type_name from public.st_building_types where id = ibt into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
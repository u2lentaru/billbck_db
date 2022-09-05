CREATE OR REPLACE FUNCTION func_connector_get(ci int) RETURNS st_connectors AS
$$
DECLARE
ret st_connectors;
BEGIN
	select * from public.st_connectors where id = ci into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
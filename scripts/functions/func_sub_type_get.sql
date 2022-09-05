CREATE OR REPLACE FUNCTION func_sub_type_get(ist int) RETURNS st_sub_types AS
$$
DECLARE
ret st_sub_types;
BEGIN
	select id, type_name, type_descr from public.st_sub_types where id = ist into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
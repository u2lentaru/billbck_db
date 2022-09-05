CREATE OR REPLACE FUNCTION func_input_type_get(iti int) RETURNS st_input_types AS
$$
DECLARE
ret st_input_types;
BEGIN
	select * from public.st_input_types where id = iti into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
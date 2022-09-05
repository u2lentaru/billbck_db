CREATE OR REPLACE FUNCTION func_contract_type_get(x int) RETURNS st_contract_types AS
$$
DECLARE
ret st_contract_types;
BEGIN
	select * from public.st_contract_types where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
CREATE OR REPLACE FUNCTION func_claim_type_get(x int) RETURNS st_claim_types AS
$$
DECLARE
ret st_claim_types;
BEGIN
	select * from public.st_claim_types where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
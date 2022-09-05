CREATE OR REPLACE FUNCTION func_contract_mot_get(x int) RETURNS st_contract_mots AS
$$
DECLARE
ret st_contract_mots;
BEGIN
	select * from public.st_contract_mots where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
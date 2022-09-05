CREATE OR REPLACE FUNCTION func_contract_get(x int) RETURNS v_tcontracts AS
$$
DECLARE
ret v_tcontracts;
BEGIN
	select * from public.v_tcontracts where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
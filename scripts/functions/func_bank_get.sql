CREATE OR REPLACE FUNCTION func_bank_get(ib int) RETURNS st_banks AS
$$
DECLARE
ret st_banks;
BEGIN
	select id, bank_name, bank_descr, mfo from public.st_banks where id = ib into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
CREATE OR REPLACE FUNCTION func_sub_bank_get(x int) RETURNS v_sub_banks AS
$$
declare
ret v_sub_banks;
BEGIN
    select * from v_sub_banks where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
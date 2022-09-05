CREATE OR REPLACE FUNCTION func_charge_get(x int) RETURNS v_charges AS
$$
declare
ret v_charges;
BEGIN
    select * from v_charges where id = x into ret;
	return ret;
END
$$ LANGUAGE 'plpgsql';
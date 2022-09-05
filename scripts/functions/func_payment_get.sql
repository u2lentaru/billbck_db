CREATE OR REPLACE FUNCTION func_payment_get(x int) RETURNS v_payments AS
$$
declare
ret v_payments;
BEGIN
    select * from v_payments where id = x into ret;
	return ret;
END
$$ LANGUAGE 'plpgsql';
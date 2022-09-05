CREATE OR REPLACE FUNCTION func_pu_value_get(x int) RETURNS v_pu_values AS
$$
DECLARE
ret v_pu_values;
BEGIN
    select * from public.v_pu_values where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
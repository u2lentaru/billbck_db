CREATE OR REPLACE FUNCTION func_act_details_cnt(x int) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	select count(*) from public.v_acts where id = x into i;
    return i;
END
$$ LANGUAGE 'plpgsql';
CREATE OR REPLACE FUNCTION func_pu_values_cnt(x int) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	select count(*) from public.wt_pu_values where pu_id = x into i;
    return i;
END
$$ LANGUAGE 'plpgsql';
CREATE OR REPLACE FUNCTION func_sub_detail_get(isb int) RETURNS v_sub_details AS
$$
DECLARE
ret v_sub_details;
BEGIN
	select * from public.v_sub_details where sub_id = isb into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
CREATE OR REPLACE FUNCTION func_obj_contract_get(x int, d text) RETURNS v_obj_contracts AS
$$
DECLARE
ret v_obj_contracts;
BEGIN
	select * from public.v_obj_contracts where id = x and
    ((startdate::date <= to_date(d, 'YYYY-mm-dd') and enddate::date >= to_date(d, 'YYYY-mm-dd')) 
    or (startdate::date <= to_date(d, 'YYYY-mm-dd') and enddate is null))
    and ((cstartdate::date <= to_date(d, 'YYYY-mm-dd') and cenddate::date >= to_date(d, 'YYYY-mm-dd')) 
    or (cstartdate::date <= to_date(d, 'YYYY-mm-dd') and cenddate is null))
    into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
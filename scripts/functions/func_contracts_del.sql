CREATE OR REPLACE FUNCTION func_contracts_del(x int, d text, cm int, mn text) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	begin
        update public.wt_contract_details set (enddate, contract_mot_id, motnotes) = (to_date(d, 'YYYY-mm-dd'), cm, mn)
        where contract_id = x and (startdate <= to_date(d, 'YYYY-mm-dd') and enddate is null) returning contract_id into i;
    exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;
    if ( i is null )
	then
		return 0;
	end if;
    return i;
END
$$ LANGUAGE 'plpgsql';
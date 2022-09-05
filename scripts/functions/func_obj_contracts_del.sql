CREATE OR REPLACE FUNCTION func_obj_contracts_del(x int, d text) RETURNS int AS
$$
DECLARE
i int :=0;
BEGIN
	begin
        update public.wt_obj_contract set enddate = to_date(d, 'YYYY-mm-dd')
        where id = x and (startdate <= to_date(d, 'YYYY-mm-dd') and enddate is null) returning id into i;
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
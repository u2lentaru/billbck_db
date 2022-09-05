CREATE OR REPLACE FUNCTION func_obj_contracts_upd(x int, c int, o int, t int, s text, e text) RETURNS int AS
$$
DECLARE
i int :=0;
BEGIN
	begin
        update public.wt_obj_contract set (contract_id, obj_id, type_id, startdate, enddate) = (c, o, t, to_date(s, 'YYYY-mm-dd'), 
        to_date(e, 'YYYY-mm-dd')) where id = x returning id into i;
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
CREATE OR REPLACE FUNCTION func_obj_trans_curr_upd(x int, o int, ot int, t int, s text, e text) RETURNS int AS
$$
DECLARE
i int :=0;
BEGIN
	begin
        update public.wt_obj_trans_curr set (obj_id, obj_type_id, trans_curr_id, startdate, enddate) = 
        (o, ot, t, to_date(s, 'YYYY-mm-dd'), to_date(e, 'YYYY-mm-dd')) where id = x returning id into i;
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
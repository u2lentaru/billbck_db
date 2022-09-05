CREATE OR REPLACE FUNCTION func_pu_upd(x int, o int, ot int, pt int, pn text, di text, ci int, iv numeric, ds boolean, d text, e text, p int) RETURNS int AS
$$
DECLARE
i int :=0;
BEGIN
	begin
        update public.wt_pu set (object_id, obj_type_id, pu_type_id, pu_number, install_date, check_interval, initial_value, dev_stopped, 
		startdate, enddate, pid) = 
		(o, ot, pt, pn, to_date(di, 'YYYY-mm-dd'), ci, iv, ds, to_date(d, 'YYYY-mm-dd'), to_date(e, 'YYYY-mm-dd'), p) 
        where id = x returning id into i;
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
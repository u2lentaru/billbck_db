CREATE OR REPLACE FUNCTION func_pu_add(o int, ot int, pt int, pn text, di text, ci int, iv numeric, ds boolean, d text, p int) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	begin
		insert into public.wt_pu (object_id, obj_type_id, pu_type_id, pu_number, install_date, check_interval, initial_value, dev_stopped, 
		startdate, enddate, pid) 
		values (o, ot, pt, pn, to_date(di, 'YYYY-mm-dd'), ci, iv, ds, to_date(d, 'YYYY-mm-dd'), null, p) 
        returning id into i;
	exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;
	return i;
END
$$ LANGUAGE 'plpgsql';
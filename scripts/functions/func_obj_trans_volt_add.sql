CREATE OR REPLACE FUNCTION func_obj_trans_volt_add(o int, ot int, t int, s text) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	begin
        select count(*) from public.wt_obj_trans_volt
		where obj_id = o and obj_type_id = ot and enddate is null into i;
		if i > 0 
		then
			-- obj_id exist, enddate not is null
			update public.wt_obj_trans_volt set enddate = to_date(s, 'YYYY-mm-dd') - interval '1 day'
			where obj_id = o and obj_type_id = ot and enddate is null;	
		end if;
		insert into public.wt_obj_trans_volt (obj_id, obj_type_id, trans_volt_id, startdate) 
        values (o, ot, t, to_date(s, 'YYYY-mm-dd')) returning id into i;
	exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;
	return i;
END
$$ LANGUAGE 'plpgsql';
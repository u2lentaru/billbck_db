CREATE OR REPLACE FUNCTION func_charges_add(d text, c int, o int, ot int, p int, t int, q numeric, tl numeric, ll numeric, sd text, ed text) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	begin
		insert into public.wt_charges (charge_date, contract_id, obj_id, obj_type_id, pu_id, charge_type_id, qty, trans_loss, line_loss, startdate, enddate) 
        values (to_date(d, 'YYYY-mm-dd'), c, o, ot, p, t, q, tl, ll, to_date(sd, 'YYYY-mm-dd'), to_date(ed, 'YYYY-mm-dd')) returning id into i;
	exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;
	return i;
END
$$ LANGUAGE 'plpgsql';
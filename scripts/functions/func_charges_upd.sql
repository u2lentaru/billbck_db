CREATE OR REPLACE FUNCTION func_charges_upd(x int,d text, c int, o int, ot int, p int, t int, q numeric, tl numeric, ll numeric, sd text, ed text) RETURNS int AS
$$
DECLARE
i int :=0;
BEGIN
	begin
        update public.wt_charges set (charge_date, contract_id, obj_id, obj_type_id, pu_id, charge_type_id, qty, trans_loss, line_loss, startdate, enddate) = 
        (to_date(d, 'YYYY-mm-dd'), c, o, ot, p, t, q, tl, ll, to_date(sd, 'YYYY-mm-dd'), to_date(ed, 'YYYY-mm-dd')) where id = x returning id into i;
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
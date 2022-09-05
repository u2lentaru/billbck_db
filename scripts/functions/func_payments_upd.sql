CREATE OR REPLACE FUNCTION func_payments_upd(x int,d text, c int, o int, p int, t int, h int, b int, a numeric) RETURNS int AS
$$
DECLARE
i int :=0;
BEGIN
	begin
        update public.wt_payments set (payment_date, contract_id, obj_id, payment_type_id, charge_type_id, cashdesk_id, bundle_number, amount) = 
        (to_date(d, 'YYYY-mm-dd'), c, o, p, t, h, b, a) where id = x returning id into i;
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
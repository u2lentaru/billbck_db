CREATE OR REPLACE FUNCTION func_payments_add(d text, c int, o int, p int, t int, h int, b int, a numeric) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	begin
		insert into public.wt_payments (payment_date, contract_id, obj_id, payment_type_id, charge_type_id, cashdesk_id, bundle_number, amount) 
        values (to_date(d, 'YYYY-mm-dd'), c, o, p, t, h, b, a) returning id into i;
	exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;
	return i;
END
$$ LANGUAGE 'plpgsql';
CREATE OR REPLACE FUNCTION func_requests_add(n text, d text, c int, st int, rt int, rk int, ct int, td text, e text, ac text, nt text, r int, a int, o int) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	begin
		insert into public.wt_requests (request_number, request_date, contract_id, service_type_id, request_type_id, 
		request_kind_id, claim_type_id, term_date, executive, accept, notes, result_id, act_id, obj_id) 
        values (n, to_date(d, 'YYYY-mm-dd'), c, st, rt, rk, ct, to_date(td, 'YYYY-mm-dd'), e, ac, nt, r, a, o) 
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
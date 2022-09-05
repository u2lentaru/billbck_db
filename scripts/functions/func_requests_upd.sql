CREATE OR REPLACE FUNCTION func_requests_upd(x int, n text, d text, c int, st int, rt int, rk int, ct int, td text, e text, ac text, nt text, r int, a int, o int) RETURNS int AS
$$
DECLARE
i int :=0;
BEGIN
	begin
        update public.wt_requests set (request_number, request_date, contract_id, service_type_id, request_type_id, 
		request_kind_id, claim_type_id, term_date, executive, accept, notes, result_id, act_id, obj_id) = 
		(n, to_date(d, 'YYYY-mm-dd'), c, st, rt, rk, ct, to_date(td, 'YYYY-mm-dd'), e, ac, nt, r, a, o) 
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
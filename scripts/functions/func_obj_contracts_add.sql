CREATE OR REPLACE FUNCTION func_obj_contracts_add(c int, o int, t int, s text) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	begin
		select count(*) from public.wt_obj_contract 
		where obj_id = o and type_id = t and enddate is null into i;
		if i > 0 
		then
			-- obj_id exist, contract date not is null
			update public.wt_obj_contract set enddate = to_date(s, 'YYYY-mm-dd') - interval '1 day'
			where obj_id = o and type_id = t and enddate is null;	
		end if;
		insert into public.wt_obj_contract (id, contract_id, obj_id, type_id, startdate, enddate) values (default, c, o, t,
        to_date(s, 'YYYY-mm-dd'), null) returning id into i;
	exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;
	return i;
END
$$ LANGUAGE 'plpgsql';
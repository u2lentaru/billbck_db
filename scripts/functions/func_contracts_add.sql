CREATE OR REPLACE FUNCTION func_contracts_add(pa numeric(12), bc text, cn text, sd text, cti int, csi int, ecn text, ei int, ai int, cgi int, nt text) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	begin
	insert into public.wt_contracts (id, personal_account, bar_code) values (default, pa, bc) returning id into i;
	-- id not exist
	if ( i is null )
	then
		return 0;
	end if;
	insert into public.wt_contract_details values (i, cn, to_date(sd, 'YYYY-mm-dd'), null, cti, csi, ecn, ei, ai, cgi, null, nt, null);
	return i;
	exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;
	return i;
END
$$ LANGUAGE 'plpgsql';
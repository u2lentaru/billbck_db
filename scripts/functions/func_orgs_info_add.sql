CREATE OR REPLACE FUNCTION func_orgs_info_add(oin text, oib text, oia text, oibn int, oian text, oif text) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	insert into public.st_org_info (id, name, bin, address, bank_id, account_number, full_name) values (default, oin, oib, oia, oibn, oian, oif) returning id into i;
	-- id not exist
	if ( i is null )
	then
		return 0;
	end if;
	return i;
END
$$ LANGUAGE 'plpgsql';
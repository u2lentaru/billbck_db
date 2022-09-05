CREATE OR REPLACE FUNCTION func_orgs_info_upd(oid int, oin text, oib text, oia text, oibn int, oian text, oif text) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	update public.st_org_info set (name, bin, address, bank_id, account_number, full_name) = (oin, oib, oia, oibn, oian, oif) where id = oid returning id into i;
	-- id not exist
	if ( i is null )
	then
		return 0;
	end if;
	return i;
END
$$ LANGUAGE 'plpgsql';
CREATE OR REPLACE FUNCTION func_org_info_get(ioi int) RETURNS v_org_info AS
$$
DECLARE
ret v_org_info;
BEGIN
	select * from public.v_org_info where id = ioi into ret;
    if ( ret is null )
	then
		ret.id = null;
        ret.name = null;
        ret.bin = null;
        ret.address = null;
        ret.bank_id = null;
        ret.account_number = null;
        ret.full_name = null;
	end if;
    return ret;
END
$$ LANGUAGE 'plpgsql';
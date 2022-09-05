CREATE OR REPLACE FUNCTION func_contracts_upd(ci int,cn text, sd text, ed text, cti int, csi int, ecn text, ei int, ai int, cgi int, cm int, nt text, mnt text) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	begin
        update public.wt_contract_details set (contract_id, contract_number, startdate, enddate, customer_id, сonsignee_id, 
        eso_contract_number, eso_id, area_id, customer_group_id, contract_mot_id, notes, motnotes) = (ci, cn, to_date(sd, 'YYYY-mm-dd'), 
		to_date(ed, 'YYYY-mm-dd'), cti, csi, ecn, ei, ai, cgi, cm, nt, mnt) 
        where contract_id = ci and enddate is null returning contract_id into i;
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
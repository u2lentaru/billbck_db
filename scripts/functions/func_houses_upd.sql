CREATE OR REPLACE FUNCTION func_houses_upd(x int, bti int, sti int, hn text, bn text, ri int, ai int, ki int, si int, ci int, ii int, rl int, vi int, nt text) RETURNS int AS
$$
DECLARE
i int :=0;
BEGIN
	begin
        update public.st_houses set (building_types_id, street_id, house_number, building_number, rp_id, area_id, ksk_id, sector_id, connector_id, 
        input_type_id, reliability_id, voltage_id, notes) = (bti, sti, hn, bn, ri, ai, ki, si, ci, ii, rl, vi, nt) where id = x returning id into i;
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
CREATE OR REPLACE FUNCTION func_houses_add(bti int, sti int, hn text, bn text, ri int, ai int, ki int, si int, ci int, ii int, rl int, vi int, nt text) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	begin
		insert into public.st_houses (id, building_types_id, street_id, house_number, building_number, rp_id, area_id, ksk_id, 
        sector_id, connector_id, input_type_id, reliability_id, voltage_id, notes) 
        values (default, bti, sti, hn, bn, ri, ai, ki, si, ci, ii, rl, vi, nt) returning id into i;
	exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;
	return i;
END
$$ LANGUAGE 'plpgsql';
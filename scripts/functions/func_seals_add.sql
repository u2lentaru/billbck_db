CREATE OR REPLACE FUNCTION func_seals_add(n text, a int, s int, st int, sc int, ss int, d text, r text) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	begin
		insert into public.st_seals (packet_number, area_id, staff_id, seal_type_id, seal_colour_id, seal_status_id, issue_date, report_date) 
        values (n, a, s, st, sc, ss, to_date(d, 'YYYY-mm-dd'), to_date(r, 'YYYY-mm-dd')) returning id into i;
	exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;
	return i;
END
$$ LANGUAGE 'plpgsql';
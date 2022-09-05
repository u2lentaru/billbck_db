CREATE OR REPLACE FUNCTION func_seals_upd(x int, n text, a int, s int, st int, sc int, ss int, d text, r text) RETURNS int AS
$$
DECLARE
i int :=0;
BEGIN
	begin
        update public.st_seals set (packet_number, area_id, staff_id, seal_type_id, seal_colour_id, seal_status_id, issue_date, report_date) = 
        (n, a, s, st, sc, ss, to_date(d, 'YYYY-mm-dd'), to_date(r, 'YYYY-mm-dd')) where id = x returning id into i;
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
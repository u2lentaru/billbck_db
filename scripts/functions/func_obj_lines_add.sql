CREATE OR REPLACE FUNCTION func_obj_lines_add(o int, ot int, r int, l numeric(10,3), s text) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	begin
		insert into public.wt_obj_lines (obj_id, obj_type_id, cable_resistance_id, line_length, startdate) 
        values (o, ot, r, l, to_date(s, 'YYYY-mm-dd')) returning id into i;
	exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;
	return i;
END
$$ LANGUAGE 'plpgsql';
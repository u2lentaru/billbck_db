CREATE OR REPLACE FUNCTION func_objects_add(n text, hi int, fn text, oti int, rq int, ui int, tgi int, cti int, osi int, nt text, mi int) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	begin
		insert into public.wt_objects (object_name, house_id, flat_number, obj_type_id, reg_qty, uzo_id, tariff_group_id, calculation_type_id, obj_status_id, notes, mff_id) 
        values (n, hi, fn, oti, rq, ui, tgi, cti, osi, nt, mi) returning id into i;
	exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;
	return i;
END
$$ LANGUAGE 'plpgsql';
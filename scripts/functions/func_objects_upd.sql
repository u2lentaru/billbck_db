CREATE OR REPLACE FUNCTION func_objects_upd(x int,n text, hi int, fn text, oti int, rq int, ui int, tgi int, cti int, osi int, nt text, mi int) RETURNS int AS
$$
DECLARE
i int :=0;
BEGIN
	begin
        update public.wt_objects set (object_name, house_id, flat_number, obj_type_id, reg_qty, uzo_id, tariff_group_id, calculation_type_id, obj_status_id, notes, mff_id) = 
        (n, hi, fn, oti, rq, ui, tgi, cti, osi, nt, mi) where id = x returning id into i;
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
CREATE OR REPLACE FUNCTION func_pu_obj(x int, t int) RETURNS setof v_pu AS
$$
BEGIN
	return query
    select * from public.v_pu where object_id = x and obj_type_id = t;
END
$$ LANGUAGE 'plpgsql';
CREATE OR REPLACE FUNCTION func_obj_lines_obj(x int, t int) RETURNS setof v_obj_lines AS
$$
DECLARE
s text;
BEGIN
	s:='select * from public.v_obj_lines where obj_id = '||x||' and obj_type_id = '||t;
    return query execute s;
END
$$ LANGUAGE 'plpgsql';
CREATE OR REPLACE FUNCTION func_obj_line_get(x int) RETURNS v_obj_lines AS
$$
DECLARE
ret v_obj_lines;
BEGIN
	select * from public.v_obj_lines where id = x into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
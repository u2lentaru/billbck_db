CREATE OR REPLACE FUNCTION func_obj_lines_obj_cnt(x int, t int) RETURNS int AS
$$
DECLARE
s text;
i int;
BEGIN
	s:='select count(*) from public.v_obj_lines where obj_id = '||x||' and obj_type_id = '||t;
    execute s into i;
	if ( i is null ) then
		return 0;
	end if;
return i;
END
$$ LANGUAGE 'plpgsql';
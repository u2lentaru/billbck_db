CREATE OR REPLACE FUNCTION func_obj_trans_pwr_getbyobj(x int, t int) RETURNS setof v_obj_trans_pwr AS
$$
DECLARE
s text;
BEGIN
	s:='select * from public.v_obj_trans_pwr where obj_id = '||x||' and obj_type_id = '||t||' and enddate is null ';
    s:=s||'order by startdate desc limit 1';
    return query execute s;
END
$$ LANGUAGE 'plpgsql';
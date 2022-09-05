CREATE OR REPLACE FUNCTION func_obj_trans_pwr_get(pg int, pgs int, o text, t text, ord int, dsc boolean) RETURNS setof v_obj_trans_pwr AS
$$
declare
s text;
BEGIN
    s:='select * from v_obj_trans_pwr';
    s:=s||' where object_name ilike '||''''||o||'%'||''''||' and';
    s:=s||' trans_pwr_name ilike '||''''||t||'%'||'''';	
    s:=s||' order by '||ord;
	if dsc
	then
	s:=s||' desc';
	end if;
	s:=s||' limit '||pgs||' offset '||(pg-1)*pgs;
	return query execute s;
END
$$ LANGUAGE 'plpgsql';
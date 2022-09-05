CREATE OR REPLACE FUNCTION func_obj_trans_volt_get(pg int, pgs int, o text, t text, ord int, dsc boolean) RETURNS setof v_obj_trans_volt AS
$$
declare
s text;
BEGIN
    s:='select * from v_obj_trans_volt';
    s:=s||' where object_name ilike '||''''||o||'%'||''''||' and';
    s:=s||' trans_volt_name ilike '||''''||t||'%'||'''';	
    s:=s||' order by '||ord;
	if dsc
	then
	s:=s||' desc';
	end if;
	s:=s||' limit '||pgs||' offset '||(pg-1)*pgs;
	return query execute s;
END
$$ LANGUAGE 'plpgsql';
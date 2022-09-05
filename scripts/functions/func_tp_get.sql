CREATE OR REPLACE FUNCTION func_tp_get(pg int, pgs int, n text, ord int, dsc boolean) RETURNS setof v_tp AS
$$
declare
s text;
BEGIN
	s:='select * from v_tp where upper(tp_name) like '||''''||n||'%'||'''';
	s:=s||'order by '||ord;
	if dsc
	then
	s:=s||' desc';
	end if;
	s:=s||' limit '||pgs||' offset '||(pg-1)*pgs;
	return query execute s;
END
$$ LANGUAGE 'plpgsql';
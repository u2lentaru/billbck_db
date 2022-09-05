CREATE OR REPLACE FUNCTION func_staff_get(pg int, pgs int, n text, ord int, dsc boolean) RETURNS setof v_staff AS
$$
declare
s text;
BEGIN
	s:='select * from v_staff where upper(staff_name) like '||''''||n||'%'||'''';
	s:=s||'order by '||ord;
	if dsc
	then
	s:=s||' desc';
	end if;
	s:=s||' limit '||pgs||' offset '||(pg-1)*pgs;
	return query execute s;
END
$$ LANGUAGE 'plpgsql';
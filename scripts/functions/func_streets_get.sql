CREATE OR REPLACE FUNCTION func_streets_get(pg int, pgs int, n text, c int, ord int, dsc boolean) RETURNS setof v_streets AS
$$
declare
s text;
BEGIN
    s:='select * from v_streets';
    s:=s||' where upper(street_name) like '||''''||n||'%'||''''||' and closed is null ';
    if ( c > 0 )
	then
		s:=s||'and cityid='||cast(c as text)||' ';
	end if;
	s:=s||'order by '||ord;
	if dsc
	then
	s:=s||' desc';
	end if;
	s:=s||' limit '||pgs||' offset '||(pg-1)*pgs;
	return query execute s;
END
$$ LANGUAGE 'plpgsql';
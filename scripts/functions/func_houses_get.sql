CREATE OR REPLACE FUNCTION func_houses_get(pg int, pgs int, n text, h text, x int, ord int, dsc boolean) RETURNS setof v_houses AS
$$
declare
s text;
BEGIN
	s:='select * from v_houses where upper(street_name) like '||''''||n||'%'||''''||' and upper(house_number) like '||''''||h||'%'||'''';
	if ( x > 0 )
	then
		s:=s||' and street_id='||cast(x as text);
	end if;
	s:=s||' order by '||ord;
	if dsc
	then
	s:=s||' desc';
	end if;
	s:=s||' limit '||pgs||' offset '||(pg-1)*pgs;
	return query execute s;
END
$$ LANGUAGE 'plpgsql';
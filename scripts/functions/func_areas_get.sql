CREATE OR REPLACE FUNCTION func_areas_get(pg int, pgs int, anb text, anm text, ord int, dsc boolean) RETURNS setof st_areas AS
$$
declare
s text;
BEGIN
	s:='select * from st_areas where upper(area_number) like '||''''||anb||'%'||''''||' and upper(area_name) like '||''''||anm||'%'||'''';
	s:=s||'order by '||ord;
	if dsc
	then
	s:=s||' desc';
	end if;
	s:=s||' limit '||pgs||' offset '||(pg-1)*pgs;
	return query execute s;
END
$$ LANGUAGE 'plpgsql';
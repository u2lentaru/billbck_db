CREATE OR REPLACE FUNCTION func_building_types_get(pg int, pgs int, btn text, ord int, dsc boolean) RETURNS setof st_building_types AS
$$
declare
s text;
BEGIN
    s:='select * from st_building_types';
    s:=s||' where upper(building_type_name) like '||''''||btn||'%'||'''';
	s:=s||'order by '||ord;
	if dsc
	then
	s:=s||' desc';
	end if;
	s:=s||' limit '||pgs||' offset '||(pg-1)*pgs;
	return query execute s;
END
$$ LANGUAGE 'plpgsql';
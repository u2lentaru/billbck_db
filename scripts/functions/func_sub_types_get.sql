CREATE OR REPLACE FUNCTION func_sub_types_get(pg int, pgs int, stns text, stds text, ord int, dsc boolean) RETURNS setof st_sub_types AS
$$
declare
s text;
BEGIN
	s:='select id, type_name, type_descr from st_sub_types where upper(type_name) like '||''''||stns||'%'||''''||' and upper(type_descr) like '||''''||stds||'%'||'''';
	s:=s||'order by '||ord;
	if dsc
	then
	s:=s||' desc';
	end if;
	s:=s||' limit '||pgs||' offset '||(pg-1)*pgs;
	return query execute s;
END
$$ LANGUAGE 'plpgsql';
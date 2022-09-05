CREATE OR REPLACE FUNCTION func_pu_value_types_get(pg int, pgs int, n text, ord int, dsc boolean) RETURNS setof st_pu_value_types AS
$$
declare
s text;
BEGIN
    s:='select * from st_pu_value_types';
    s:=s||' where pu_value_type_name ilike '||''''||n||'%'||'''';
	s:=s||'order by '||ord;
	if dsc
	then
	s:=s||' desc';
	end if;
	s:=s||' limit '||pgs||' offset '||(pg-1)*pgs;
	return query execute s;
END
$$ LANGUAGE 'plpgsql';
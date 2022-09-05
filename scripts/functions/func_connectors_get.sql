CREATE OR REPLACE FUNCTION func_connectors_get(pg int, pgs int, cn text, ord int, dsc boolean) RETURNS setof st_connectors AS
$$
declare
s text;
BEGIN
	s:='select * from st_connectors where upper(connector_name) like '||''''||cn||'%'||'''';
	s:=s||'order by '||ord;
	if dsc
	then
	s:=s||' desc';
	end if;
	s:=s||' limit '||pgs||' offset '||(pg-1)*pgs;
	return query execute s;
END
$$ LANGUAGE 'plpgsql';
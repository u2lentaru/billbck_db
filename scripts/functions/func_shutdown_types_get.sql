CREATE OR REPLACE FUNCTION func_shutdown_types_get(pg int, pgs int, n text, ord int, dsc boolean) RETURNS setof st_shutdown_types AS
$$
declare
s text;
BEGIN
    s:='select * from st_shutdown_types';
    s:=s||' where upper(shutdown_type_name) like '||''''||n||'%'||'''';
	s:=s||'order by '||ord;
	if dsc
	then
	s:=s||' desc';
	end if;
	s:=s||' limit '||pgs||' offset '||(pg-1)*pgs;
	return query execute s;
END
$$ LANGUAGE 'plpgsql';
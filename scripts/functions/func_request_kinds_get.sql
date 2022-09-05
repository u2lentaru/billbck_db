CREATE OR REPLACE FUNCTION func_request_kinds_get(pg int, pgs int, n text, ord int, dsc boolean) RETURNS setof st_request_kinds AS
$$
declare
s text;
BEGIN
    s:='select * from st_request_kinds';
    s:=s||' where request_kind_name ilike '||''''||n||'%'||'''';
	s:=s||'order by '||ord;
	if dsc
	then
	s:=s||' desc';
	end if;
	s:=s||' limit '||pgs||' offset '||(pg-1)*pgs;
	return query execute s;
END
$$ LANGUAGE 'plpgsql';
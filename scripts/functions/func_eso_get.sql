CREATE OR REPLACE FUNCTION func_eso_get(pg int, pgs int, en text, ord int, dsc boolean) RETURNS setof st_eso AS
$$
declare
s text;
BEGIN
	s:='select * from st_eso where upper(eso_name) like '||''''||en||'%'||'''';
	s:=s||'order by '||ord;
	if dsc
	then
	s:=s||' desc';
	end if;
	s:=s||' limit '||pgs||' offset '||(pg-1)*pgs;
	return query execute s;
END
$$ LANGUAGE 'plpgsql';
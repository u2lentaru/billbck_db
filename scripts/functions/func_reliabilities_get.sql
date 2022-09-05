CREATE OR REPLACE FUNCTION func_reliabilities_get(pg int, pgs int, rn text, ord int, dsc boolean) RETURNS setof st_reliabilities AS
$$
declare
s text;
BEGIN
	s:='select * from st_reliabilities where upper(reliability_name) like '||''''||rn||'%'||'''';
	s:=s||'order by '||ord;
	if dsc
	then
	s:=s||' desc';
	end if;
	s:=s||' limit '||pgs||' offset '||(pg-1)*pgs;
	return query execute s;
END
$$ LANGUAGE 'plpgsql';
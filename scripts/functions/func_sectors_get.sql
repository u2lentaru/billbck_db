CREATE OR REPLACE FUNCTION func_sectors_get(pg int, pgs int, sn text, ord int, dsc boolean) RETURNS setof st_sectors AS
$$
declare
s text;
BEGIN
	s:='select * from st_sectors where upper(sector_name) like '||''''||sn||'%'||'''';
	s:=s||'order by '||ord;
	if dsc
	then
	s:=s||' desc';
	end if;
	s:=s||' limit '||pgs||' offset '||(pg-1)*pgs;
	return query execute s;
END
$$ LANGUAGE 'plpgsql';
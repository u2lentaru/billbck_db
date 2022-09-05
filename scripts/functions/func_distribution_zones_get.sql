CREATE OR REPLACE FUNCTION func_distribution_zones_get(pg int, pgs int, n text, ord int, dsc boolean) RETURNS setof st_distribution_zones AS
$$
declare
s text;
BEGIN
    s:='select * from st_distribution_zones';
    s:=s||' where distribution_zone_name ilike '||''''||n||'%'||'''';
	s:=s||'order by '||ord;
	if dsc
	then
	s:=s||' desc';
	end if;
	s:=s||' limit '||pgs||' offset '||(pg-1)*pgs;
	return query execute s;
END
$$ LANGUAGE 'plpgsql';
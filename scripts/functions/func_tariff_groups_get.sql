CREATE OR REPLACE FUNCTION func_tariff_groups_get(pg int, pgs int, n text, ord int, dsc boolean) RETURNS setof st_tariff_groups AS
$$
declare
s text;
BEGIN
    s:='select * from st_tariff_groups';
    s:=s||' where upper(tariff_group_name) like '||''''||n||'%'||'''';
	s:=s||'order by '||ord;
	if dsc
	then
	s:=s||' desc';
	end if;
	s:=s||' limit '||pgs||' offset '||(pg-1)*pgs;
	return query execute s;
END
$$ LANGUAGE 'plpgsql';
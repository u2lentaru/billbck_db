CREATE OR REPLACE FUNCTION func_positions_get(pg int, pgs int, pns text, ord int, dsc boolean) RETURNS setof st_positions AS
$$
declare
s text;
BEGIN
    s:='select * from st_positions';
    s:=s||' where upper(position_name) like '||''''||pns||'%'||'''';
	s:=s||'order by '||ord;
	if dsc
	then
	s:=s||' desc';
	end if;
	s:=s||' limit '||pgs||' offset '||(pg-1)*pgs;
	return query execute s;
END
$$ LANGUAGE 'plpgsql';
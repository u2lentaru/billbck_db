CREATE OR REPLACE FUNCTION func_tgu_get(pg int, pgs int, n text, t text, ord int, dsc boolean) RETURNS setof v_tgu AS
$$
declare
s text;
BEGIN
    s:='select * from v_tgu';
    s:=s||' where upper(tgu_name) like '||''''||n||'%'||'''';
	s:=s||' and id > 1';
	if not (t is null) then
	s:=s||' and tgu_type_id='||t;
	end if;
	s:=s||' order by '||ord;
	if dsc then
	s:=s||' desc';
	end if;
	s:=s||' limit '||pgs||' offset '||(pg-1)*pgs;
	return query execute s;
END
$$ LANGUAGE 'plpgsql';
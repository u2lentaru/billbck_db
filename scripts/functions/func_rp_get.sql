CREATE OR REPLACE FUNCTION func_rp_get(pg int, pgs int, n text, v text, ord int, dsc boolean) RETURNS setof v_rp AS
$$
declare
s text;
BEGIN
	s:='select * from v_rp where upper(rp_name) like '||''''||n||'%'||''''||' and upper(inv_number) like '||''''||v||'%'||'''';
	s:=s||'order by '||ord;
	if dsc
	then
	s:=s||' desc';
	end if;
	s:=s||' limit '||pgs||' offset '||(pg-1)*pgs;
	return query execute s;
END
$$ LANGUAGE 'plpgsql';
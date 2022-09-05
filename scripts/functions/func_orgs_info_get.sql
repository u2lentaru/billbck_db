CREATE OR REPLACE FUNCTION func_orgs_info_get(pg int, pgs int, oin text, oif text, ord int, dsc boolean) RETURNS setof v_org_info AS
$$
declare
s text;
BEGIN
    s:='select * from v_org_info';
    s:=s||' where upper(name) like '||''''||oin||'%'||''''||' and upper(full_name) like '||''''||oif||'%'||'''';
	s:=s||'order by '||ord;
	if dsc
	then
	s:=s||' desc';
	end if;
	s:=s||' limit '||pgs||' offset '||(pg-1)*pgs;
	return query execute s;
END
$$ LANGUAGE 'plpgsql';
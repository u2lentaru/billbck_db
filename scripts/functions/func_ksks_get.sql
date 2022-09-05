CREATE OR REPLACE FUNCTION func_ksks_get(pg int, pgs int, kskn text, kska text, ord int, dsc boolean) RETURNS setof st_ksk AS
$$
declare
s text;
BEGIN
	s:='select * from st_ksk where upper(ksk_name) like '||''''||kskn||'%'||''''||' and upper(ksk_address) like '||''''||kska||'%'||'''';
	s:=s||'order by '||ord;
	if dsc
	then
	s:=s||' desc';
	end if;
	s:=s||' limit '||pgs||' offset '||(pg-1)*pgs;
	return query execute s;
END
$$ LANGUAGE 'plpgsql';
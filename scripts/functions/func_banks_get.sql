CREATE OR REPLACE FUNCTION func_banks_get(pg int, pgs int, bns text, bds text, ord int, dsc boolean) RETURNS setof st_banks AS
$$
declare
s text;
BEGIN
	s:='select id, bank_name, bank_descr, mfo from st_banks where upper(bank_name) like '||''''||bns||'%'||''''||' and upper(bank_descr) like '||''''||bds||'%'||'''';
	s:=s||'order by '||ord;
	if dsc
	then
	s:=s||' desc';
	end if;
	s:=s||' limit '||pgs||' offset '||(pg-1)*pgs;
	return query execute s;
END
$$ LANGUAGE 'plpgsql';
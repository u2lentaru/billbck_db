CREATE OR REPLACE FUNCTION func_sub_banks_get(pg int, pgs int, sn text, sx int, an text, ord int, dsc boolean) RETURNS setof v_sub_banks AS
$$
declare
s text;
BEGIN
    s:='select * from v_sub_banks';
    s:=s||' where sub_name ilike '||''''||sn||'%'||''''||' and account_number ilike '||''''||an||'%'||'''';
	if not (sx is null)	then
		s:=s||' and sub_id='||sx::text;
	end if;
	s:=s||'order by '||ord;
	if dsc
	then
	s:=s||' desc';
	end if;
	s:=s||' limit '||pgs||' offset '||(pg-1)*pgs;
	return query execute s;
END
$$ LANGUAGE 'plpgsql';
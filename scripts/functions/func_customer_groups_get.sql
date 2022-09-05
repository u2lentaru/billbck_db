CREATE OR REPLACE FUNCTION func_customer_groups_get(pg int, pgs int, cgn text, ord int, dsc boolean) RETURNS setof st_customer_groups AS
$$
declare
s text;
BEGIN
	s:='select * from st_customer_groups where upper(customer_group_name) like '||''''||cgn||'%'||'''';
	s:=s||'order by '||ord;
	if dsc
	then
	s:=s||' desc';
	end if;
	s:=s||' limit '||pgs||' offset '||(pg-1)*pgs;
	return query execute s;
END
$$ LANGUAGE 'plpgsql';
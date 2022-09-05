CREATE OR REPLACE FUNCTION func_contract_types_get(pg int, pgs int, n text, ord int, dsc boolean) RETURNS setof st_contract_types AS
$$
declare
s text;
BEGIN
    s:='select * from st_contract_types';
    s:=s||' where contract_type_name ilike '||''''||n||'%'||'''';
	s:=s||'order by '||ord;
	if dsc
	then
	s:=s||' desc';
	end if;
	s:=s||' limit '||pgs||' offset '||(pg-1)*pgs;
	return query execute s;
END
$$ LANGUAGE 'plpgsql';
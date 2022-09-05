CREATE OR REPLACE FUNCTION func_input_types_get(pg int, pgs int, itn text, ord int, dsc boolean) RETURNS setof st_input_types AS
$$
declare
s text;
BEGIN
	s:='select * from st_input_types where upper(input_type_name) like '||''''||itn||'%'||'''';
	s:=s||'order by '||ord;
	if dsc
	then
	s:=s||' desc';
	end if;
	s:=s||' limit '||pgs||' offset '||(pg-1)*pgs;
	return query execute s;
END
$$ LANGUAGE 'plpgsql';
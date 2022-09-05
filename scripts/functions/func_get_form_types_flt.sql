CREATE OR REPLACE FUNCTION func_get_form_types_flt(pg int, pgs int, ftns text, ftds text, ord int, dsc boolean) RETURNS setof st_form_types AS
$$
declare
s text;
BEGIN
	s:='select * from st_form_types where upper(form_type_name) like '||''''||ftns||'%'||''''||' and upper(form_type_descr) like '||''''||ftds||'%'||'''';
	s:=s||'order by '||ord;
	if dsc
	then
	s:=s||' desc';
	end if;
	s:=s||' limit '||pgs||' offset '||(pg-1)*pgs;
	return query execute s;
END
$$ LANGUAGE 'plpgsql';
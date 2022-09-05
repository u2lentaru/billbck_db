CREATE OR REPLACE FUNCTION func_sub_details_get(pg int, pgs int, sns text, sds text, hc boolean, ord int, dsc boolean) RETURNS setof v_sub_details AS
$$
declare
s text;
BEGIN
    s:='select * from v_sub_details';
    s:=s||' where upper(sub_name) like '||''''||sns||'%'||''''||' and upper(sub_descr) like '||''''||sds||'%'||'''';
	if hc
	then
	s:=s||' and sub_id in (select id from st_subjects where closed is null)';
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
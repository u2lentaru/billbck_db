CREATE OR REPLACE FUNCTION func_sub_pu_prl(pg int, pgs int, h int, x int, ord int, dsc boolean) RETURNS setof v_pu AS
$$
declare
s text;
BEGIN
	s:='select * from v_pu';
	s:=s||' where house_id = '||cast(h as text);
	s:=s||' and id not in (select subid from st_sub_pu) and not (id = '||cast(x as text)||')';
    s:=s||' order by '||ord;
	if dsc
	then
	s:=s||' desc';
	end if;
	s:=s||' limit '||pgs||' offset '||(pg-1)*pgs;
	return query execute s;
END
$$ LANGUAGE 'plpgsql';
CREATE OR REPLACE FUNCTION func_sub_pu_get(pg int, pgs int, x int, ord int, dsc boolean) RETURNS setof v_pu AS
$$
declare
s text;
BEGIN
	s:='select * from v_pu where id in (select subid from st_sub_pu where parid = '||cast(x as text)||') order by '||ord;
	if dsc
	then
	s:=s||' desc';
	end if;
	s:=s||' limit '||pgs||' offset '||(pg-1)*pgs;
	return query execute s;
END
$$ LANGUAGE 'plpgsql';
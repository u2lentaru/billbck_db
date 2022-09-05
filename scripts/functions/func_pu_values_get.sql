CREATE OR REPLACE FUNCTION func_pu_values_get(pg int, pgs int,x int, ord int, dsc boolean) RETURNS setof v_pu_values AS
$$
declare
s text;
BEGIN
    s:='select * from v_pu_values ';
	s:=s||'where pu_id='||cast(x as text)||' ';
	s:=s||'order by '||ord;
	if dsc
	then
	s:=s||' desc';
	end if;
	s:=s||' limit '||pgs||' offset '||(pg-1)*pgs;
	return query execute s;
END
$$ LANGUAGE 'plpgsql';
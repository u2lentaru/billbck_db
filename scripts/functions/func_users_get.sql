CREATE OR REPLACE FUNCTION func_users_get(pg int, pgs int, n text, ord int, dsc boolean) RETURNS setof v_users AS
$$
declare
s text;
BEGIN
	s:='select * from v_users where user_name ilike '||''''||n||'%'||'''';
	s:=s||'order by '||ord;
	if dsc
	then
	s:=s||' desc';
	end if;
	s:=s||' limit '||pgs||' offset '||(pg-1)*pgs;
	return query execute s;
END
$$ LANGUAGE 'plpgsql';
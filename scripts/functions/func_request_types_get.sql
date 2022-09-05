CREATE OR REPLACE FUNCTION func_request_types_get(pg int, pgs int, n text, ki text, ord int, dsc boolean) RETURNS setof v_request_types AS
$$
declare
s text;
BEGIN
    s:='select * from v_request_types';
    s:=s||' where request_type_name ilike '||''''||n||'%'||'''';
	if not (ki is null) then
		s:=s||' and request_kind_id='||ki;
	end if;
	s:=s||' order by '||ord;
	if dsc
	then
	s:=s||' desc';
	end if;
	s:=s||' limit '||pgs||' offset '||(pg-1)*pgs;
	return query execute s;
END
$$ LANGUAGE 'plpgsql';
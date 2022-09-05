CREATE OR REPLACE FUNCTION func_equipment_get(pg int, pgs int, n text, o int, ord int, dsc boolean) RETURNS setof v_equipment AS
$$
declare
s text;
BEGIN
	s:='select * from v_equipment where object_name ilike '||''''||n||'%'||'''';
	if not (o is null) then
	s:=s||' and obj_id='||o;
	end if;
    s:=s||' order by '||ord;
	if dsc then
	s:=s||' desc';
	end if;
	s:=s||' limit '||pgs||' offset '||(pg-1)*pgs;
	return query execute s;
END
$$ LANGUAGE 'plpgsql';
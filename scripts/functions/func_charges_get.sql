CREATE OR REPLACE FUNCTION func_charges_get(pg int, pgs int, n text, o text, ord int, dsc boolean) RETURNS setof v_charges AS
$$
declare
s text;
BEGIN
    s:='select * from v_charges';
    s:=s||' where contract_number ilike '||''''||n||'%'||'''';
	if not (o is null) and length(o)>0	then
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
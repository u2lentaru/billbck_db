CREATE OR REPLACE FUNCTION func_obj_contracts_get(pg int, pgs int, o int, t int, c int, active boolean, ord int, dsc boolean) RETURNS setof v_obj_contracts AS
$$
declare
s text;
BEGIN
	s:='select * from v_obj_contracts where true';
	if o is not null then
		s:=s||' and obj_id = '||o;
	end if;
	if t is not null then
		s:=s||' and type_id = '||t;
	end if;
	if c is not null then
		s:=s||' and contract_id = '||c;
	end if;
    if active is not null
    then
        if active then
            s:=s||' and enddate is null';
        else
            s:=s||' and enddate is not null';
        end if;
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
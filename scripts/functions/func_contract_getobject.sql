CREATE OR REPLACE FUNCTION func_contract_getobject(x int, active boolean) RETURNS setof v_obj_contracts AS
$$
DECLARE
s text;
BEGIN
	s:='select * from public.v_obj_contracts where contract_id = '||x||' ';
    if active is not null then
        if active
        then
            s:=s||'and enddate is null';
        else
            s:=s||'and enddate is not null';
        end if;
    end if;
    return query execute s;
END
$$ LANGUAGE 'plpgsql';
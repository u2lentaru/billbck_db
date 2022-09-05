CREATE OR REPLACE FUNCTION func_object_getcontract(x int, t int, active boolean) RETURNS setof v_obj_contracts AS
$$
DECLARE
s text;
BEGIN
	s:='select * from public.v_obj_contracts where obj_id = '||x||' and type_id = '||t||' ';
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
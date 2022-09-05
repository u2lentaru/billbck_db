CREATE OR REPLACE FUNCTION func_contract_getobject_cnt(x int, active boolean) RETURNS int AS
$$
DECLARE
s text;
i int;
BEGIN
	s:='select count(*) from public.v_obj_contracts where contract_id = '||x||' ';
    if active is not null 
    then
        if active
        then
            s:=s||'and enddate is null';
        else
            s:=s||'and enddate is not null';
        end if;
    end if;
    execute s into i;
	if ( i is null ) then
		return 0;
	end if;
return i;
END
$$ LANGUAGE 'plpgsql';
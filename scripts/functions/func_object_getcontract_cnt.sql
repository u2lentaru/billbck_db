CREATE OR REPLACE FUNCTION func_object_getcontract_cnt(x int, t int, active boolean) RETURNS int AS
$$
DECLARE
s text;
i int;
BEGIN
	s:='select count(*) from public.v_obj_contracts where obj_id = '||x||' and type_id = '||t||' ';
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
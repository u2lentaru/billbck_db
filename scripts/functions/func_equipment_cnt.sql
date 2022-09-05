CREATE OR REPLACE FUNCTION func_equipment_cnt(n text, o int) RETURNS int AS
$$
declare
s text;
i int;
BEGIN
	s:='select count(*) from v_equipment where object_name ilike '||''''||n||'%'||'''';
	if not (o is null) then
	s:=s||' and obj_id='||o;
	end if;
    execute s into i;
	if ( i is null ) then
		return 0;
	end if;
    return i;
END
$$ LANGUAGE 'plpgsql';
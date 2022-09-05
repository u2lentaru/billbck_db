CREATE OR REPLACE FUNCTION func_obj_lines_cnt(o text, t text) RETURNS int AS
$$
declare
s text;
i int;
BEGIN
    s:='select count(*) from v_obj_lines';
    s:=s||' where object_name ilike '||''''||o||'%'||''''||' and';
    s:=s||' cable_resistance_name ilike '||''''||t||'%'||'''';	
    execute s into i;
	if ( i is null )
	then
		return 0;
	end if;
return i;
END
$$ LANGUAGE 'plpgsql';
CREATE OR REPLACE FUNCTION func_obj_trans_pwr_cnt(o text, t text) RETURNS int AS
$$
declare
s text;
i int;
BEGIN
    s:='select count(*) from v_obj_trans_pwr';
    s:=s||' where object_name ilike '||''''||o||'%'||''''||' and';
    s:=s||' trans_pwr_name ilike '||''''||t||'%'||'''';	
    execute s into i;
	if ( i is null )
	then
		return 0;
	end if;
return i;
END
$$ LANGUAGE 'plpgsql';
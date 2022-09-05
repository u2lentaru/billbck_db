CREATE OR REPLACE FUNCTION func_areas_cnt(anb text, anm text) RETURNS int AS
$$
declare
s text;
i int;
BEGIN
	s:='select count(*) from st_areas where upper(area_number) like '||''''||anb||'%'||''''||' and upper(area_name) like '||''''||anm||'%'||'''';
    execute s into i;
	if ( i is null )
	then
		return 0;
	end if;
return i;
END
$$ LANGUAGE 'plpgsql';
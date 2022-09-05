CREATE OR REPLACE FUNCTION func_building_types_cnt(btn text) RETURNS int AS
$$
declare
s text;
i int;
BEGIN
    s:='select count(*) from st_building_types where upper(building_type_name) like '||''''||btn||'%'||'''';
	execute s into i;
    	if ( i is null )
	then
		return 0;
	end if;
    return i;
END
$$ LANGUAGE 'plpgsql';
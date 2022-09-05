CREATE OR REPLACE FUNCTION func_equipment_types_cnt(n text) RETURNS int AS
$$
declare
s text;
i int;
BEGIN
	s:='select count(*) from st_equipment_types where equipment_type_name ilike '||''''||n||'%'||'''';
    execute s into i;
	if ( i is null ) then
		return 0;
	end if;
return i;
END
$$ LANGUAGE 'plpgsql';
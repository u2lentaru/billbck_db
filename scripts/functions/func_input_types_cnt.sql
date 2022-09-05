CREATE OR REPLACE FUNCTION func_input_types_cnt(itn text) RETURNS int AS
$$
declare
s text;
i int;
BEGIN
	s:='select count(*) from st_input_types where upper(input_type_name) like '||''''||itn||'%'||'''';
    execute s into i;
	if ( i is null )
	then
		return 0;
	end if;
return i;
END
$$ LANGUAGE 'plpgsql';
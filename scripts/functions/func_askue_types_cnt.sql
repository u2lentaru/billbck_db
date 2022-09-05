CREATE OR REPLACE FUNCTION func_askue_types_cnt(n text) RETURNS int AS
$$
declare
s text;
i int;
BEGIN
	s:='select count(*) from st_askue_types where upper(askue_type_name) like '||''''||n||'%'||'''';
    execute s into i;
	if ( i is null )
	then
		return 0;
	end if;
return i;
END
$$ LANGUAGE 'plpgsql';
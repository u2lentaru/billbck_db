CREATE OR REPLACE FUNCTION func_conclusions_cnt(n text) RETURNS int AS
$$
declare
s text;
i int;
BEGIN
	s:='select count(*) from st_conclusions where upper(conclusion_name) like '||''''||n||'%'||'''';
    execute s into i;
	if ( i is null )
	then
		return 0;
	end if;
return i;
END
$$ LANGUAGE 'plpgsql';
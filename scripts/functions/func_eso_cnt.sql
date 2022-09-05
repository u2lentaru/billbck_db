CREATE OR REPLACE FUNCTION func_eso_cnt(en text) RETURNS int AS
$$
declare
s text;
i int;
BEGIN
	s:='select count(*) from st_eso where upper(eso_name) like '||''''||en||'%'||'''';
    execute s into i;
	if ( i is null )
	then
		return 0;
	end if;
return i;
END
$$ LANGUAGE 'plpgsql';
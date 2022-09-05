CREATE OR REPLACE FUNCTION func_reliabilities_cnt(rn text) RETURNS int AS
$$
declare
s text;
i int;
BEGIN
	s:='select count(*) from st_reliabilities where upper(reliability_name) like '||''''||rn||'%'||'''';
    execute s into i;
	if ( i is null )
	then
		return 0;
	end if;
return i;
END
$$ LANGUAGE 'plpgsql';
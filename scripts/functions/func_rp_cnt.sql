CREATE OR REPLACE FUNCTION func_rp_cnt(n text, v text) RETURNS int AS
$$
declare
s text;
i int;
BEGIN
	s:='select count(*) from st_rp where upper(rp_name) like '||''''||n||'%'||''''||' and upper(inv_number) like '||''''||v||'%'||'''';
    execute s into i;
	if ( i is null )
	then
		return 0;
	end if;
return i;
END
$$ LANGUAGE 'plpgsql';
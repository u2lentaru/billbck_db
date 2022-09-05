CREATE OR REPLACE FUNCTION func_sectors_cnt(sn text) RETURNS int AS
$$
declare
s text;
i int;
BEGIN
	s:='select count(*) from st_sectors where upper(sector_name) like '||''''||sn||'%'||'''';
    execute s into i;
	if ( i is null )
	then
		return 0;
	end if;
return i;
END
$$ LANGUAGE 'plpgsql';
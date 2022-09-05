CREATE OR REPLACE FUNCTION func_seal_statuses_cnt(n text) RETURNS int AS
$$
declare
s text;
i int;
BEGIN
	s:='select count(*) from st_seal_statuses where seal_status_name ilike '||''''||n||'%'||'''';
    execute s into i;
	if ( i is null ) then
		return 0;
	end if;
return i;
END
$$ LANGUAGE 'plpgsql';
CREATE OR REPLACE FUNCTION func_connectors_cnt(cn text) RETURNS int AS
$$
declare
s text;
i int;
BEGIN
	s:='select count(*) from st_connectors where upper(connector_name) like '||''''||cn||'%'||'''';
    execute s into i;
	if ( i is null )
	then
		return 0;
	end if;
return i;
END
$$ LANGUAGE 'plpgsql';
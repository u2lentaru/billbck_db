CREATE OR REPLACE FUNCTION func_positions_cnt(pns text) RETURNS int AS
$$
declare
s text;
i int;
BEGIN
    s:='select count(*) from st_positions where upper(position_name) like '||''''||pns||'%'||'''';
	execute s into i;
   	if ( i is null )
	then
		return 0;
	end if;
    return i;
END
$$ LANGUAGE 'plpgsql';
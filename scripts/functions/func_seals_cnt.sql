CREATE OR REPLACE FUNCTION func_seals_cnt(n text) RETURNS int AS
$$
declare
s text;
i int;
BEGIN
	s:='select count(*) from v_seals where packet_number ilike '||''''||n||'%'||'''';
    execute s into i;
	if ( i is null )
	then
		return 0;
	end if;
return i;
END
$$ LANGUAGE 'plpgsql';
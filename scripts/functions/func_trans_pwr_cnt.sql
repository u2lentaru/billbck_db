CREATE OR REPLACE FUNCTION func_trans_pwr_cnt(n text) RETURNS int AS
$$
declare
s text;
i int;
BEGIN
	s:='select count(*) from v_trans_pwr where trans_pwr_name ilike '||''''||n||'%'||'''';
    execute s into i;
	if ( i is null ) then
		return 0;
	end if;
return i;
END
$$ LANGUAGE 'plpgsql';
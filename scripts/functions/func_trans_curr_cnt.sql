CREATE OR REPLACE FUNCTION func_trans_curr_cnt(n text) RETURNS int AS
$$
declare
s text;
i int;
BEGIN
	s:='select count(*) from v_trans_curr where trans_curr_name ilike '||''''||n||'%'||'''';
    execute s into i;
	if ( i is null ) then
		return 0;
	end if;
return i;
END
$$ LANGUAGE 'plpgsql';
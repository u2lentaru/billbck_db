CREATE OR REPLACE FUNCTION func_tgu_cnt(n text, t text) RETURNS int AS
$$
declare
s text;
i int;
BEGIN
	s:='select count(*) from v_tgu where upper(tgu_name) like '||''''||n||'%'||'''';
	s:=s||' and id > 1';
	if not (t is null) then
	s:=s||' and tgu_type_id='||t;
	end if;
    execute s into i;
	if ( i is null )
	then
		return 0;
	end if;
return i;
END
$$ LANGUAGE 'plpgsql';
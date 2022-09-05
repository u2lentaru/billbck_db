CREATE OR REPLACE FUNCTION func_streets_cnt(n text, c int) RETURNS int AS
$$
declare
s text;
i int;
BEGIN
	s:='select count(*) from v_streets where upper(street_name) like '||''''||n||'%'||''''||' and closed is null ';
	if ( c > 0 )
	then
		s:=s||'and cityid='||cast(c as text);
	end if;
    execute s into i;
	if ( i is null )
	then
		return 0;
	end if;
return i;
END
$$ LANGUAGE 'plpgsql';
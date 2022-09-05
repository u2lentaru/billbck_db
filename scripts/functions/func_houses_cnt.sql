CREATE OR REPLACE FUNCTION func_houses_cnt(n text, h text, x int) RETURNS int AS
$$
declare
s text;
i int;
BEGIN
	s:='select count(*) from v_houses where upper(street_name) like '||''''||n||'%'||''''||' and upper(house_number) like '||''''||h||'%'||'''';
	if ( x > 0 )
	then
		s:=s||' and street_id='||cast(x as text);
	end if;
    execute s into i;
	if ( i is null )
	then
		return 0;
	end if;
return i;
END
$$ LANGUAGE 'plpgsql';
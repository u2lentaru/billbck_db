CREATE OR REPLACE FUNCTION func_acts_cnt(a text, o text, x int) RETURNS int AS
$$
declare
s text;
i int;
BEGIN
	s:='select count(*) from v_act_heads where upper(act_number) like '||''''||a||'%'||''''||' and upper(object_name) like '||''''||o||'%'||'''';
	if ( x > 0 )
	then
		s:=s||' and object_id='||cast(x as text);
	end if;
    execute s into i;
	if ( i is null )
	then
		return 0;
	end if;
return i;
END
$$ LANGUAGE 'plpgsql';
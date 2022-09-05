CREATE OR REPLACE FUNCTION func_sub_banks_cnt(sn text, sx int, an text) RETURNS int AS
$$
declare
s text;
i int;
BEGIN
    s:='select count(*) from v_sub_banks';
    s:=s||' where sub_name ilike '||''''||sn||'%'||''''||' and account_number ilike '||''''||an||'%'||'''';
	if not (sx is null)	then
		s:=s||' and sub_id='||sx::text;
	end if;
	execute s into i;
	if ( i is null )
	then
		return 0;
	end if;
return i;
END
$$ LANGUAGE 'plpgsql';
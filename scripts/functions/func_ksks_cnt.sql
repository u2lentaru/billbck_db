CREATE OR REPLACE FUNCTION func_ksks_cnt(kskn text, kska text) RETURNS int AS
$$
declare
s text;
i int;
BEGIN
	s:='select count(*) from st_ksk where upper(ksk_name) like '||''''||kskn||'%'||''''||' and upper(ksk_address) like '||''''||kska||'%'||'''';
    execute s into i;
	if ( i is null )
	then
		return 0;
	end if;
return i;
END
$$ LANGUAGE 'plpgsql';
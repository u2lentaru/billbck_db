CREATE OR REPLACE FUNCTION func_banks_cnt(bns text, bds text) RETURNS int AS
$$
declare
s text;
i int;
BEGIN
	s:='select count(*) from st_banks where upper(bank_name) like '||''''||bns||'%'||''''||' and upper(bank_descr) like '||''''||bds||'%'||'''';
    execute s into i;
	if ( i is null )
	then
		return 0;
	end if;
return i;
END
$$ LANGUAGE 'plpgsql';
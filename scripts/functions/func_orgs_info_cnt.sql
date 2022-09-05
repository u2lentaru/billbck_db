CREATE OR REPLACE FUNCTION func_orgs_info_cnt(oin text, oif text) RETURNS int AS
$$
declare
s text;
i int;
BEGIN
    s:='select count(*) from v_org_info where upper(name) like '||''''||oin||'%'||''''||' and upper(full_name) like '||''''||oif||'%'||'''';
	execute s into i;
	if ( i is null )
	then
		return 0;
	end if;
return i;
END
$$ LANGUAGE 'plpgsql';
CREATE OR REPLACE FUNCTION func_sub_details_cnt(sns text, sds text, hc boolean) RETURNS int AS
$$
declare
s text;
i int;
BEGIN
    s:='select count(*) from v_sub_details where upper(sub_name) like '||''''||sns||'%'||''''||' and upper(sub_descr) like '||''''||sds||'%'||'''';
	if hc
	then
	s:=s||' and sub_id in (select id from st_subjects where closed is null)';
	end if;
	execute s into i;
    	if ( i is null )
	then
		return 0;
	end if;
    return i;
END
$$ LANGUAGE 'plpgsql';
CREATE OR REPLACE FUNCTION func_customer_groups_cnt(cgn text) RETURNS int AS
$$
declare
s text;
i int;
BEGIN
	s:='select count(*) from st_customer_groups where upper(customer_group_name) like '||''''||cgn||'%'||'''';
    execute s into i;
	if ( i is null )
	then
		return 0;
	end if;
return i;
END
$$ LANGUAGE 'plpgsql';
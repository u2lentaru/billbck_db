CREATE OR REPLACE FUNCTION func_sub_types_cnt(stns text, stds text) RETURNS int AS
$$
declare
s text;
i int;
BEGIN
	s:='select count(*) from st_sub_types where upper(type_name) like '||''''||stns||'%'||''''||' and upper(type_descr) like '||''''||stds||'%'||'''';
	execute s into i;
	if ( i is null )
	then
		return 0;
	end if;
return i;
END
$$ LANGUAGE 'plpgsql';
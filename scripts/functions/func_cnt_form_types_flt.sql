CREATE OR REPLACE FUNCTION func_cnt_form_types_flt(ftns text, ftds text) RETURNS int AS
$$
declare
s text;
i int;
BEGIN
	s:='select count(*) from st_form_types where upper(form_type_name) like '||''''||ftns||'%'||''''||' and upper(form_type_descr) like '||''''||ftds||'%'||'''';
	execute s into i;
	if ( i is null )
	then
		return 0;
	end if;
return i;
END
$$ LANGUAGE 'plpgsql';
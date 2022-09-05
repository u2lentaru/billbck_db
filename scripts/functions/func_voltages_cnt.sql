CREATE OR REPLACE FUNCTION func_voltages_cnt(vn text) RETURNS int AS
$$
declare
s text;
i int;
BEGIN
	s:='select count(*) from st_voltage where upper(voltage_name) like '||''''||vn||'%'||'''';
    execute s into i;
	if ( i is null )
	then
		return 0;
	end if;
return i;
END
$$ LANGUAGE 'plpgsql';
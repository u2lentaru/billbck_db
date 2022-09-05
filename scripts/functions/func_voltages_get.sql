CREATE OR REPLACE FUNCTION func_voltages_get(pg int, pgs int, vn text, ord int, dsc boolean) RETURNS setof st_voltage AS
$$
declare
s text;
BEGIN
	s:='select * from st_voltage where upper(voltage_name) like '||''''||vn||'%'||'''';
	s:=s||'order by '||ord;
	if dsc
	then
	s:=s||' desc';
	end if;
	s:=s||' limit '||pgs||' offset '||(pg-1)*pgs;
	return query execute s;
END
$$ LANGUAGE 'plpgsql';
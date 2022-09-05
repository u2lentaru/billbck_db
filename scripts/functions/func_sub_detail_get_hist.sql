CREATE OR REPLACE FUNCTION func_sub_detail_get_hist(x int) RETURNS setof logs.sub_detail_log AS
$$
DECLARE
s text;
BEGIN
    s:= 'select * from logs.sub_detail_log where log_data->> ';
	s:=s||''''||'sub_id'||''''||' = '||''''||x::text||'''';
    return query execute s;
END
$$ LANGUAGE 'plpgsql';
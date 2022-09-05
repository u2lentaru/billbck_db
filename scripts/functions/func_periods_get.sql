CREATE OR REPLACE FUNCTION func_periods_get(pg int, pgs int, n text, ord int, dsc boolean) 
RETURNS table(i int, pn text, sd text, ed text) AS
$$
declare
s text;
BEGIN
    s:='select id, period_name, lower(drperiod)::text, (upper(drperiod)-1)::text from st_periods';
    s:=s||' where period_name ilike '||''''||n||'%'||'''';
    s:=s||'order by '||ord;
    if dsc
    then
        s:=s||' desc';
    end if;
    s:=s||' limit '||pgs||' offset '||(pg-1)*pgs;
    return query execute s;
END
$$ LANGUAGE 'plpgsql';
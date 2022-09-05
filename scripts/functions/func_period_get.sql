CREATE OR REPLACE FUNCTION func_period_get(x int) 
RETURNS table(i int, n text, sd text, ed text) AS
$$
BEGIN
    return query    
    select id, period_name, lower(drperiod)::text, (upper(drperiod)-1)::text from st_periods where id = x;
END
$$ LANGUAGE 'plpgsql';
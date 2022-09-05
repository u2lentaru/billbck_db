CREATE OR REPLACE FUNCTION func_contracts_hist(x int) RETURNS setof logs.contracts_log AS
$$
DECLARE
s text;
BEGIN
    s:= 'select * from logs.contracts_log where log_data->> ';
	s:=s||''''||'contract_id'||''''||' = '||''''||x::text||'''';
    return query execute s;
END
$$ LANGUAGE 'plpgsql';
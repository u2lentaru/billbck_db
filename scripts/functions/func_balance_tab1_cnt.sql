CREATE OR REPLACE FUNCTION func_balance_tab1_cnt(x int, t int) RETURNS int AS
$$
declare
i int;
BEGIN
    if t = 0 then
        return 0;
    end if;
    select count(*) from v_balance vb
    where vb.pid = x
    into i;
    if i is null then
        return 0;
    end if;
    return i; 
END
$$ LANGUAGE 'plpgsql';
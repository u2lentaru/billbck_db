CREATE OR REPLACE FUNCTION func_balance_cnt(x int, t int) RETURNS int AS
-- Don't remove func_balance_cnt(x int) !!! v_balance is correct!!!
$$
DECLARE
i int :=0;
BEGIN  
    if t = 0 then
        return 0;
    end if;
    select count(*) from v_balance
    where pid = x and not (id = 1 and tgu_type_id > 0) into i;
    if i is null 
    then
        i:=0;
    end if;
    return i;
END
$$ LANGUAGE 'plpgsql';
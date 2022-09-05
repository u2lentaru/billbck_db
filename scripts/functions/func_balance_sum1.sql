CREATE OR REPLACE FUNCTION func_balance_sum1(x int, t int, sd text, ed text) RETURNS numeric AS
$$
declare
sum numeric;
BEGIN
    if t = 0 then
        return func_balance_sum(x, t, sd, ed);
    else
        select sum(ec) from
        (select vb.id, vb.tgu_type_id, func_balance_sum(vb.id::int, vb.tgu_type_id::int, sd, ed) as ec
        from v_balance vb
        -- all pid's tgu_type_id>0 only!!!
        where vb.pid = x) as tec into sum;
        if sum is null then
            sum:=0;
        end if;
    end if;
return sum;
END
$$ LANGUAGE 'plpgsql';
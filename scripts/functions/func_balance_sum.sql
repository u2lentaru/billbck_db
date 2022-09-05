CREATE OR REPLACE FUNCTION func_balance_sum(x int, t int, sd text, ed text) RETURNS numeric AS
$$
declare
sum numeric;
BEGIN
    select sum(ec) from
    (select vp.object_id, vp.id, func_balance_pu_sum(vp.id::int,sd,ed) as ec
    -- from v_pu vp 
    from wt_pu vp 
    where vp.object_id = x and vp.obj_type_id = t) as tec into sum;
    if sum is null then
        sum:=0;
    end if;
return sum;
END
$$ LANGUAGE 'plpgsql';
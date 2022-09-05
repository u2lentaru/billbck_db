CREATE OR REPLACE FUNCTION func_balance_tab0_cnt(x int, t int) RETURNS int AS
$$
declare
i int;
BEGIN
    if t = 0 then
        return 1;
    else
    with recursive bts as (
        select vb.id::int, vb.pid::int, vb.tgu_name, vb.tgu_type_id::int, vb.tgu_type_name, vb.reqid 
        from v_balance vb
        where vb.id = x and vb.tgu_type_id>0 
        union all
        select b.id::int, b.pid::int, b.tgu_name, b.tgu_type_id::int, b.tgu_type_name, b.reqid
        from v_balance b, bts
        where '1:'||cast(b.pid as text) = bts.reqid and not (b.id = 1 and b.tgu_type_id>0)
    )
    select count(*) from bts
    where bts.tgu_type_id = 0 into i;
    return i;
    end if;
END
$$ LANGUAGE 'plpgsql';
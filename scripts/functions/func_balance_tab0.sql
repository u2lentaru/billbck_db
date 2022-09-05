CREATE OR REPLACE FUNCTION func_balance_tab0(pg int, pgs int, x int, t int, sd text, ed text) 
RETURNS table(id int, pid int, tgu_name text, tgu_type_id int, tgu_type_name text, bln numeric, reqid text) AS
$$
BEGIN
    if t = 0 then
        return query 
        select vb.id::int, vb.pid::int, vb.tgu_name, vb.tgu_type_id::int, vb.tgu_type_name, func_balance_sum(x, t, sd, ed) as bln, vb.reqid 
        from v_balance vb
        where vb.id = x and vb.tgu_type_id = t;
    else
    return query
    with recursive bts as (
        select vb.id::int, vb.pid::int, vb.tgu_name, vb.tgu_type_id::int, vb.tgu_type_name, func_balance_sum(x, t, sd, ed) as bln, vb.reqid 
        from v_balance vb
        where vb.id = x and vb.tgu_type_id>0 
        union all
        select b.id::int, b.pid::int, b.tgu_name, b.tgu_type_id::int, b.tgu_type_name, func_balance_sum(b.id::int, b.tgu_type_id::int, sd, ed) as bln, b.reqid
        from v_balance b, bts
        where '1:'||cast(b.pid as text) = bts.reqid and not (b.id = 1 and b.tgu_type_id>0)
    )
    select * from bts
    where bts.tgu_type_id = 0
    limit pgs offset (pg-1)*pgs;
    end if;
END
$$ LANGUAGE 'plpgsql';
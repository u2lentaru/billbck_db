CREATE OR REPLACE FUNCTION func_balance_getbranch(x int, t int) 
RETURNS table(id int, pid int, tgu_name text, tgu_type_id int, tgu_type_name text, bln numeric, reqid text) AS
$$
BEGIN
    return query
    with recursive bts as (
        select vb.id::int, vb.pid::int, vb.tgu_name, vb.tgu_type_id::int, vb.tgu_type_name, 0.0 as bln, vb.reqid 
        from v_balance vb
        where vb.id = x and vb.tgu_type_id = t 
        union all
        select b.id::int, b.pid::int, b.tgu_name, b.tgu_type_id::int, b.tgu_type_name, 0.0 as bln, b.reqid
        from v_balance b, bts
        where b.id = bts.pid and b.tgu_type_id > 0 and not (b.id = 1 and b.tgu_type_id>0)
    )
    select * from bts;
END
$$ LANGUAGE 'plpgsql';
CREATE OR REPLACE FUNCTION func_balance_tab1(pg int, pgs int, x int, t int, sd text, ed text) 
RETURNS table(id int, pid int, tgu_name text, tgu_type_id int, tgu_type_name text, bln numeric, reqid text) AS
$$
BEGIN
    if t = 0 
    then
        x = -1;
    end if;
    return query
    select vb.id::int, vb.pid::int, vb.tgu_name, vb.tgu_type_id::int, vb.tgu_type_name, 
    func_balance_sum(vb.id::int, vb.tgu_type_id::int, sd, ed) as bln, vb.reqid
    from v_balance vb
    -- all pid's tgu_type_id>0 only!!!
    where vb.pid = x
    limit pgs offset (pg-1)*pgs;
END
$$ LANGUAGE 'plpgsql';
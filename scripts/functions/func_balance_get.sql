CREATE OR REPLACE FUNCTION func_balance_get(pg int, pgs int, x int, t int) RETURNS setof v_balance AS
$$
BEGIN
    if t = 0 then
        x := -1;
    end if;
    return query
    select vb.id, vb.pid, vb.tgu_name, vb.tgu_type_id, vb.tgu_type_name, func_balance_cnt(vb.id::int, vb.tgu_type_id::int) as chldcnt, vb.reqid
    from v_balance vb
    where pid = x and not (id = 1 and tgu_type_id > 0)
    order by id
    limit pgs offset (pg-1)*pgs;
END
$$ LANGUAGE 'plpgsql';
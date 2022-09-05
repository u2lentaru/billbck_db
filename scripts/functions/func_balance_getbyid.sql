CREATE OR REPLACE FUNCTION func_balance_getbyid(x int, t int) RETURNS setof v_balance AS
$$
BEGIN  
    return query
    -- select * from v_balance
    select vb.id, vb.pid, vb.tgu_name, vb.tgu_type_id, vb.tgu_type_name, func_balance_cnt(vb.id::int, vb.tgu_type_id::int) as chldcnt, vb.reqid
    from v_balance vb
    where id = x and tgu_type_id = t;
END
$$ LANGUAGE 'plpgsql';
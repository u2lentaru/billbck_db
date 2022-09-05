CREATE OR REPLACE FUNCTION func_balance_sum0(x int, t int, sd text, ed text) RETURNS numeric AS
$$
declare
sbl numeric;
BEGIN
if t = 0 then
    return func_balance_sum(x, t, sd, ed);
end if;
with recursive bts as (
    select id, tgu_type_id, pid, tgu_name, func_balance_sum(x, t, sd, ed) as bln, reqid 
    from v_balance
    where id = x and tgu_type_id>0 
    union all
    select b.id, b.tgu_type_id, b.pid, b.tgu_name, func_balance_sum(b.id::int,b.tgu_type_id::int,sd, ed) as bln, b.reqid
    from v_balance b, bts
    where '1:'||cast(b.pid as text) = bts.reqid and not (b.id = 1 and b.tgu_type_id>0)
)
select sum(bln) from bts
where tgu_type_id = 0
into sbl;
if sbl is null 
then
    sbl:=0;
end if;
return sbl;
END
$$ LANGUAGE 'plpgsql';
with recursive bts as (
    select * from baltest
    where id = 1
    union all
    select b.id, b.pid, b.item_name, b.item_descr, b.value from baltest b, bts
    where b.pid = bts.id 
)
select *
from bts;
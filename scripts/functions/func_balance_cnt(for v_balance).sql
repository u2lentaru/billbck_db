CREATE OR REPLACE FUNCTION public.func_balance_cnt(x integer)
 RETURNS integer
 LANGUAGE plpgsql
AS $function$
DECLARE
i int :=0;
BEGIN
    select count(*) from 
    (select id from wt_tgu wt
    where wt.pid = x and id > 1
    union all
    select id from v_objects vo 
    where vo.rp_id = x) 
    as nltgu
    into i;
    return i;
END
$function$
;
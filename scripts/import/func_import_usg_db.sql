CREATE OR REPLACE FUNCTION import.func_import_usg_db() RETURNS int AS
$$
DECLARE 
maincur refcursor;
rec record;
puvt text;
idpu int;
t int:= 0; r int:= 0;
BEGIN
-- Показания

open maincur for select distinct to_date(period, 'YYYY-mm-dd') as dd, ПриборУчета as pu from import.Потребление
where to_date(period, 'YYYY-mm-dd')>'2019-06-01' and not ПриборУчета = '00000000-0000-0000-0000-000000000000'; 
loop
    fetch maincur into rec;    
    EXIT WHEN NOT FOUND;
    select newid from import."ПриборыУчета" where ref = rec.pu into idpu;
    continue when idpu is null;

    RAISE notice 'pu_id : % ', idpu;

    select ПоказанияКон from import.Потребление
    where ПриборУчета = rec.pu and to_date(period, 'YYYY-mm-dd') = rec.dd
    order by period desc limit 1 into puvt;

    INSERT INTO public.wt_pu_values (id, pu_id, value_date, pu_value) 
    VALUES (default, idpu, rec.dd, to_number(puvt, '99999999.9'));

    r=r+1;
end loop;
close maincur;

RAISE notice 'New pu values added : % ', r;

t=t+1;

RAISE notice 'Tables processed : % ', t;

RAISE notice 'Starttime, endtime, exectime : % % %', now(), clock_timestamp(), clock_timestamp() - now();

return t;
END;
$$ LANGUAGE 'plpgsql';
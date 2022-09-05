CREATE OR REPLACE FUNCTION import.func_import_links() RETURNS int AS
$$
DECLARE 
maincur refcursor;
wrcur refcursor; 
rec record;
tu text; old_ctr text; pu text;
idtu int; idctr int; oldidctr int; idpu int;
i int; r int := 0;
BEGIN
    
    --ТочкиУчетаДоговоры
    
    TRUNCATE public.wt_obj_contract RESTART IDENTITY;
    open maincur for select distinct ТочкаУчета from import."ТочкиУчетаДоговоры"; 
    loop
        fetch maincur into tu;
        EXIT WHEN NOT FOUND;
        select newid from import."ТочкиУчета" where ref = tu into idtu;
        RAISE notice 'New obj_id : % ', idtu;
        continue when idtu is null;
        old_ctr='';
        idctr=0;
        open wrcur for select ТочкаУчета, Договор, to_date(ДатаВвода, 'YYYY-mm-dd') as dt from import."ТочкиУчетаДоговоры" 
        where ТочкаУчета = tu order by ДатаВвода;
        loop
            fetch wrcur into rec;
            EXIT WHEN NOT FOUND;
            if length(old_ctr) = 0 or not (old_ctr = rec.Договор) then
                oldidctr=idctr;
                select newid from import."Договоры" where ref = rec.Договор into idctr;
                continue when idctr is null;

                insert into public.wt_obj_contract (id, contract_id, obj_id, startdate, enddate) 
                values (default, idctr, idtu, rec.dt, null) returning id into i;
                RAISE notice 'wt_obj_contract, contract_id, obj_id : % % ', idctr, idtu;
                r=r+1;

                if length(old_ctr) > 0 then
                    update public.wt_obj_contract set enddate = rec.dt where contract_id = oldidctr and obj_id = idtu;    
                end if;
                old_ctr = rec.Договор;
            end if;
  
        end loop;
        close wrcur;      
    end loop;
    close maincur;

    RAISE notice 'wt_obj_contract : % records', r;
    r=0;



    --ПриборыУчетаНаТочках
    
    open maincur for select ПриборУчета, ТочкаУчета, period from import."ПриборыУчетаНаТочках"; 
    loop
        fetch maincur into rec;
        EXIT WHEN NOT FOUND;
        select newid from import."ПриборыУчета" where ref = rec.ПриборУчета into idpu;
        continue when idpu is null;
        select newid from import."ТочкиУчета" where ref = rec.ТочкаУчета into idtu;
        continue when idpu is null;
        update public.wt_pu set (object_id, obj_type_id, install_date, startdate) = (idtu, 0, to_date(rec.period, 'YYYY-mm-dd'), to_date(rec.period, 'YYYY-mm-dd')) where id = idpu;    
        RAISE notice 'wt_pu, pu_id, obj_id : % % ', idpu, idtu;
        r=r+1;
    end loop;
    close maincur;

    RAISE notice 'wt_pu : % records', r;

RAISE notice 'Starttime, endtime, exectime : % % %', now(), clock_timestamp(), clock_timestamp() - now();

return r;
END;
$$ LANGUAGE 'plpgsql';
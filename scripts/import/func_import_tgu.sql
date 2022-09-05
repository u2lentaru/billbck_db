CREATE OR REPLACE FUNCTION import.func_import_tgu() RETURNS int AS
$$
DECLARE 
maincur refcursor;
rec record;
tu text; tu_name text; sp_tgu text;
idtu int; idtgu int; idlup int; idsptu int; idsptgu int;
t int:= 0; r int:= 0;
BEGIN
-- ТочкиУчетаГоловногоУчета

-- st_tgu_types
-- 1 - Нет данных, 2 - ТП, 3 - Подстанции, 4 - ПрочиеУзлыУчета, 5 - Подстанции_L2, 6 - ТП_L2, 7 - Импорт_ТГУ

DROP TABLE IF EXISTS import.obj2tgu; 
CREATE TABLE import.obj2tgu (
	obj_id bigint NOT NULL,
    tgu_id bigint NOT NULL,
    tgu_type_id bigint NOT NULL
);

DROP TABLE IF EXISTS import.wt_tgu_contract;
CREATE TABLE import.wt_tgu_contract (
    contract_id bigint NOT NULL,
    obj_id bigint NOT NULL,
    startdate date NOT NULL, 
    enddate date
);

open maincur for select distinct ТочкаУчета from import."ТочкиУчетаГоловногоУчета"; 
loop
    fetch maincur into tu;    
    EXIT WHEN NOT FOUND;
    select newid from import."ТочкиУчета" where ref = tu into idtu;
    RAISE notice 'object_id : % ', idtu;
    continue when idtu is null;

    select period as pr, ps.ref as ps, tp.ref as tp, tugu."ТочкаУчета"
    from "import".ТочкиУчетаГоловногоУчета tugu left join "import".Подстанции ps on tugu."ГоловнойУчет" = ps."ref" 
    left join "import".ТП tp on tugu."ГоловнойУчет" = tp."ref"
    where ТочкаУчета = tu
    order by pr desc limit 1 into rec;

    select description from import."ТочкиУчета" where ref = tu into tu_name;
    continue when tu_name is null;


    --ps
    if not rec.ps is null then
        select newid from import."Подстанции" where ref = rec.ps into idlup;
        continue when idlup is null;

        -- new wt_tgu
        insert into public.wt_tgu (id, pid, tgu_name, tgu_type_id, inv_number, input_voltage, output_voltage1, output_voltage2)
        values (default, idlup, tu_name, 5, 'Нет данных', null, null, null) returning id into idtgu;
        -- delete from public.wt_objects where id = idtu;
        RAISE notice 'add wt_tgu : % ', idtgu;
        r=r+1;

        -- add link old wt_objects - new public.wt_tgu
        insert into import.obj2tgu (obj_id, tgu_id, tgu_type_id)
        values (idtu, idtgu, 5);
        RAISE notice 'add obj2tgu: %, %, Подстанции_L2 ', idtu, idtgu;

        -- move wt_obj_contract to wt_tgu_contract
        insert into import.wt_tgu_contract (contract_id, obj_id, startdate, enddate)
        select contract_id, obj_id, startdate, enddate from public.wt_obj_contract where obj_id = idtu;
        delete from public.wt_obj_contract where obj_id = idtu;
        RAISE notice 'move contract: %, %', idtu, idtgu;

        -- set pu to new tgu id
        update public.wt_pu
        set (object_id, obj_type_id) = (idtgu, 5)
        where object_id = idtu and obj_type_id = 0;
        RAISE notice 'set new pu object_id: %, %', idtu, idtgu;

        -- delete old object_id
        delete from public.wt_objects where id = idtu;
        RAISE notice 'delete object_id : % ', idtu;
    end if;


    --tp
    if not rec.tp is null then
        select newid from import."ТП" where ref = rec.tp into idlup;
        continue when idlup is null;

        -- new wt_tgu
        insert into public.wt_tgu (id, pid, tgu_name, tgu_type_id, inv_number, input_voltage, output_voltage1, output_voltage2)
        values (default, idlup, tu_name, 6, 'Нет данных', null, null, null) returning id into idtgu;
        -- delete from public.wt_objects where id = idtu;
        RAISE notice 'add wt_tgu : % ', idtgu;
        r=r+1;

        -- add link old wt_objects - new public.wt_tgu
        insert into import.obj2tgu (obj_id, tgu_id, tgu_type_id)
        values (idtu, idtgu, 6);
        RAISE notice 'add obj2tgu: %, %, ТП_L2 ', idtu, idtgu;

        -- move wt_obj_contract to wt_tgu_contract
        insert into import.wt_tgu_contract (contract_id, obj_id, startdate, enddate)
        select contract_id, obj_id, startdate, enddate from public.wt_obj_contract where obj_id = idtu;
        delete from public.wt_obj_contract where obj_id = idtu;
        RAISE notice 'move contract: %, %', idtu, idtgu;

        -- set pu to new tgu id
        update public.wt_pu
        set (object_id, obj_type_id) = (idtgu, 6)
        where object_id = idtu and obj_type_id = 0;
        RAISE notice 'set new pu object_id: %, %', idtu, idtgu;

        -- delete old object_id
        delete from public.wt_objects where id = idtu;
        RAISE notice 'delete object_id : % ', idtu;

    end if;


    -- others
    if rec.tp is null and rec.ps is null then
        idlup = 1;

        -- new wt_tgu
        insert into public.wt_tgu (id, pid, tgu_name, tgu_type_id, inv_number, input_voltage, output_voltage1, output_voltage2)
        values (default, idlup, tu_name, 7, 'Нет данных', null, null, null) returning id into idtgu;
        -- delete from public.wt_objects where id = idtu;
        RAISE notice 'add wt_tgu : % ', idtgu;
        r=r+1;

        -- add link old wt_objects - new public.wt_tgu
        insert into import.obj2tgu (obj_id, tgu_id, tgu_type_id)
        values (idtu, idtgu, 7);
        RAISE notice 'add obj2tgu: %, %, Импорт_ТГУ ', idtu, idtgu;

        -- move wt_obj_contract to wt_tgu_contract
        insert into import.wt_tgu_contract (contract_id, obj_id, startdate, enddate)
        select contract_id, obj_id, startdate, enddate from public.wt_obj_contract where obj_id = idtu;
        delete from public.wt_obj_contract where obj_id = idtu;
        RAISE notice 'move contract: %, %', idtu, idtgu;

        -- set pu to new tgu id
        update public.wt_pu
        set (object_id, obj_type_id) = (idtgu, 7)
        where object_id = idtu and obj_type_id = 0;
        RAISE notice 'set new pu object_id: %, %', idtu, idtgu;

        -- delete old object_id
        delete from public.wt_objects where id = idtu;
        RAISE notice 'delete object_id : % ', idtu;
    end if;


end loop;
close maincur;
RAISE notice 'New tgu records added : % ', r;
t=t+1;
r=0;


-- СхемыПодключений


open maincur for select distinct ТочкаУчета from import."СхемыПодключений"; 
loop
    fetch maincur into tu;    
    EXIT WHEN NOT FOUND;

    --sp tu
    select ТочкаУчетаСхемыПодключения
    from "import".СхемыПодключений
    where ТочкаУчета = tu
    order by period desc limit 1 into sp_tgu;
    
    select newid from import."ТочкиУчета" where ref = sp_tgu into idsptu;
    continue when idsptu is null;
    select tgu_id from import.obj2tgu where obj_id = idsptu into idsptgu;
    continue when idsptgu is null;

    -- tu
    select newid from import."ТочкиУчета" where ref = tu into idtu;
    continue when idtu is null;
    RAISE notice 'object_id : % ', idtu;

    select object_name from public.wt_objects where id = idtu into tu_name;
    select tgu_id from import.obj2tgu where obj_id = idtu into idtgu;

    continue when tu_name is null and idtgu is null;

    -- Update wt_tgu or st_houses
    if tu_name is null then
        update public.wt_tgu set pid = idsptgu
        where id = idtgu;
        RAISE notice 'Updated link tgu_id, pid : %  %', idtgu, idsptgu;
    else
        update public.st_houses set rp_id = idsptgu
        where id = (select house_id from public.wt_objects where id = idtu);
        RAISE notice 'Updated link obj_id, rp_id : % % ', idtu, idsptgu;
    end if;
    r=r+1;

end loop;
close maincur;
RAISE notice 'Links updated : % ', r;
t=t+1;
r=0;


RAISE notice 'Tables processed : % ', t;

RAISE notice 'Starttime, endtime, exectime : % % %', now(), clock_timestamp(), clock_timestamp() - now();

return t;
END;
$$ LANGUAGE 'plpgsql';
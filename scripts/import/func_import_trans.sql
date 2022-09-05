CREATE OR REPLACE FUNCTION import.func_import_trans() RETURNS int AS
$$
DECLARE 
maincur refcursor;
rec record;
idt int; idtt int; idtu int; idtgu int; idttgu int; ar int;
t int:= 0; r int:= 0;
BEGIN

-- ТипыТрансформаторов
-- NULLIF(your_value, '')::int

open maincur for select ref, description, КоэффициентТрансформации, Класс, МаксимальныйТок, НоминальныйТок from import.ТипыТрансформаторов; 
loop
    fetch maincur into rec;    
    EXIT WHEN NOT FOUND;

    INSERT INTO public.st_trans_types (id, trans_type_name, ratio, class, maxcurr, nomcurr) 
    VALUES (default, rec.description, rec.КоэффициентТрансформации::int, rec.Класс::int, rec.МаксимальныйТок::int, rec.НоминальныйТок::int) 
    returning id into idt;

    update import.ТипыТрансформаторов set newid = idt where ref = rec.ref;

    RAISE notice 'trans_type_id : % ', idt;

    r=r+1;
end loop;
close maincur;

RAISE notice 'New trans_types added : % ', r;
r=0;

t=t+1;


-- ТрансформаторыТока

open maincur for select ref, description, ТипПрибора, ДатаПоверки, ДатаСледующейПоверки, ДатаИзготовления, ЗаводскойНомер1, ЗаводскойНомер2, ЗаводскойНомер3 
from import.ТрансформаторыТока;
loop
    fetch maincur into rec;    
    EXIT WHEN NOT FOUND;

    select newid from import.ТипыТрансформаторов where ref = rec.ТипПрибора into idtt;
    continue when idtt is null;

    INSERT INTO public.st_trans_curr (id, trans_curr_name, trans_type_id, checkdate, nextcheckdate, proddate, serial1, serial2, serial3) 
    VALUES (default, rec.description, idtt, to_date(rec.ДатаПоверки, 'YYYY-mm-dd'), to_date(rec.ДатаСледующейПоверки, 'YYYY-mm-dd'), 
    to_date(rec.ДатаИзготовления, 'YYYY-mm-dd'), rec.ЗаводскойНомер1, rec.ЗаводскойНомер2, rec.ЗаводскойНомер3) 
    returning id into idt;

    update import.ТрансформаторыТока set newid = idt where ref = rec.ref;

    RAISE notice 'trans_curr_id : % ', idt;

    r=r+1;
end loop;
close maincur;

RAISE notice 'New trans_curr added : % ', r;
r=0;

t=t+1;


-- ТрансформаторыНапряжения

open maincur for select ref, description, ТипПрибора, ДатаПоверки, ДатаСледующейПоверки, ДатаИзготовления, ЗаводскойНомер1, ЗаводскойНомер2, ЗаводскойНомер3 
from import.ТрансформаторыНапряжения;
loop
    fetch maincur into rec;    
    EXIT WHEN NOT FOUND;

    select newid from import.ТипыТрансформаторов where ref = rec.ТипПрибора into idtt;
    continue when idtt is null;

    INSERT INTO public.st_trans_volt (id, trans_volt_name, trans_type_id, checkdate, nextcheckdate, proddate, serial1, serial2, serial3) 
    VALUES (default, rec.description, idtt, to_date(rec.ДатаПоверки, 'YYYY-mm-dd'), to_date(rec.ДатаСледующейПоверки, 'YYYY-mm-dd'), 
    to_date(rec.ДатаИзготовления, 'YYYY-mm-dd'), rec.ЗаводскойНомер1, rec.ЗаводскойНомер2, rec.ЗаводскойНомер3) 
    returning id into idt;

    update import.ТрансформаторыНапряжения set newid = idt where ref = rec.ref;

    RAISE notice 'trans_volt_id : % ', idt;

    r=r+1;
end loop;
close maincur;

RAISE notice 'New trans_volt added : % ', r;
r=0;

t=t+1;


-- ТипыСиловыхТрансформаторов

open maincur for select ref, description, МощностьКороткогоЗамыкания, МощностьПотерьХолостогоХода, НоминальнаяМощность 
from import.ТипыСиловыхТрансформаторов; 
loop
    fetch maincur into rec;    
    EXIT WHEN NOT FOUND;

    INSERT INTO public.st_trans_pwr_types (id, trans_pwr_type_name, short_circuit_power, idling_loss_power, nominal_power) 
    VALUES (default, rec.description, to_number(rec.МощностьКороткогоЗамыкания, '9999999.99'), 
    to_number(rec.МощностьПотерьХолостогоХода, '9999999.99'), rec.НоминальнаяМощность::int) 
    returning id into idt;

    update import.ТипыСиловыхТрансформаторов set newid = idt where ref = rec.ref;

    RAISE notice 'trans_pwr_type_id : % ', idt;

    r=r+1;
end loop;
close maincur;

RAISE notice 'New trans_pwr_types added : % ', r;
r=0;

t=t+1;


-- СиловыеТрансформаторы

open maincur for select ref, description, ТипПрибора from import.СиловыеТрансформаторы;
loop
    fetch maincur into rec;    
    EXIT WHEN NOT FOUND;

    select newid from import.ТипыСиловыхТрансформаторов where ref = rec.ТипПрибора into idtt;
    continue when idtt is null;

    INSERT INTO public.st_trans_pwr (id, trans_pwr_name, trans_pwr_type_id) 
    VALUES (default, rec.description, idtt) 
    returning id into idt;

    update import.СиловыеТрансформаторы set newid = idt where ref = rec.ref;

    RAISE notice 'trans_pwr_id : % ', idt;

    r=r+1;
end loop;
close maincur;

RAISE notice 'New trans_pwr added : % ', r;
r=0;

t=t+1;


--ТрансформаторыТокаНаТочках

open maincur for select Period, ТочкаУчета, Трансформатор from import.ТрансформаторыТокаНаТочках order by ТочкаУчета, Period;
loop
    fetch maincur into rec;    
    EXIT WHEN NOT FOUND;

    select newid from import.ТрансформаторыТока where ref = rec.Трансформатор into idt;
    continue when idt is null;

    select newid from import.ТочкиУчета where ref = rec.ТочкаУчета into idtu;
    continue when idtu is null;

    select tgu_id from import.obj2tgu where obj_id = idtu into idtgu;

    if idtgu is null then
        select * from func_obj_trans_curr_add(idtu,0,idt,rec.Period) into ar;
        if ar > 0 then
            RAISE notice 'New obj_trans_curr : % % 0 %', ar, idtu, idt;
        end if;
    else
        select tgu_type_id from import.obj2tgu where tgu_id = idtgu limit 1 into idttgu;
        select * from func_obj_trans_curr_add(idtgu,idttgu,idt,rec.Period) into ar;
        if ar > 0 then
            RAISE notice 'New obj_trans_curr : % % % %', ar, idtgu, idttgu, idt;
        end if;

    end if;

    r=r+1;
end loop;
close maincur;

RAISE notice 'New obj_trans_curr added : % ', r;
r=0;

t=t+1;



--ТрансформаторыНапряженияНаТочках

open maincur for select Period, ТочкаУчета, Трансформатор from import.ТрансформаторыНапряженияНаТочках order by ТочкаУчета, Period;
loop
    fetch maincur into rec;    
    EXIT WHEN NOT FOUND;

    select newid from import.ТрансформаторыНапряжения where ref = rec.Трансформатор into idt;
    continue when idt is null;

    select newid from import.ТочкиУчета where ref = rec.ТочкаУчета into idtu;
    continue when idtu is null;

    select tgu_id from import.obj2tgu where obj_id = idtu into idtgu;

    if idtgu is null then
        select * from func_obj_trans_volt_add(idtu,0,idt,rec.Period) into ar;
        if ar > 0 then
            RAISE notice 'New obj_trans_volt : % % 0 %', ar, idtu, idt;
        end if;
    else
        select tgu_type_id from import.obj2tgu where tgu_id = idtgu limit 1 into idttgu;
        select * from func_obj_trans_volt_add(idtgu,idttgu,idt,rec.Period) into ar;
        if ar > 0 then
            RAISE notice 'New obj_trans_volt : % % % %', ar, idtgu, idttgu, idt;
        end if;

    end if;

    r=r+1;
end loop;
close maincur;

RAISE notice 'New obj_trans_volt added : % ', r;
r=0;

t=t+1;


--СиловыеТрансформаторыНаТочках

open maincur for select Period, ТочкаУчета, СиловойТрансформатор from import.СиловыеТрансформаторыНаТочках order by ТочкаУчета, Period;
loop
    fetch maincur into rec;    
    EXIT WHEN NOT FOUND;

    select newid from import.СиловыеТрансформаторы where ref = rec.СиловойТрансформатор into idt;
    continue when idt is null;

    select newid from import.ТочкиУчета where ref = rec.ТочкаУчета into idtu;
    continue when idtu is null;

    select tgu_id from import.obj2tgu where obj_id = idtu into idtgu;

    if idtgu is null then
        select * from func_obj_trans_pwr_add(idtu,0,idt,rec.Period) into ar;
        if ar > 0 then
            RAISE notice 'New obj_trans_pwr : % % 0 %', ar, idtu, idt;
        end if;
    else
        select tgu_type_id from import.obj2tgu where tgu_id = idtgu limit 1 into idttgu;
        select * from func_obj_trans_volt_add(idtgu,idttgu,idt,rec.Period) into ar;
        if ar > 0 then
            RAISE notice 'New obj_trans_pwr : % % % %', ar, idtgu, idttgu, idt;
        end if;

    end if;

    r=r+1;
end loop;
close maincur;

RAISE notice 'New obj_trans_pwr added : % ', r;
r=0;

t=t+1;




RAISE notice 'Tables processed : % ', t;

RAISE notice 'Starttime, endtime, exectime : % % %', now(), clock_timestamp(), clock_timestamp() - now();

return t;
END;
$$ LANGUAGE 'plpgsql';

--public.st_cable_resistances
--import.СопротивлениеКабелей
--
-- insert into st_cable_resistances (cable_resistance_name, resistance, material_type)
-- select description, to_number(Сопротивление, '999999.999'), ТипМатериала::boolean 
-- from "import".СопротивлениеКабелей
--
--public.wt_obj_lines
-- TRUNCATE TABLE public.wt_obj_lines RESTART IDENTITY;
-- insert into public.wt_obj_lines (obj_id, obj_type_id, cable_resistance_id, line_length, startdate, enddate)
-- select COALESCE(ot.tgu_id, tu.newid) as obj_id, COALESCE(ot.tgu_type_id, 0) as obj_type_id, 
-- sk.newid as cable_resistance_id, to_number(tu."ДлинаЛинии", '9999999.999') as line_length, 
-- to_date(tu."ДатаОткрытия", 'YYYY-mm-dd') as startdate, 
-- to_date(NULLIF(tu."ДатаЗакрытия", '0001-01-01T00:00:00'), 'YYYY-mm-dd') as enddate
-- from "import".ТочкиУчета tu join "import"."СопротивлениеКабелей" sk on tu."СопротивлениеЛинии" = sk."ref" 
-- left join "import".obj2tgu ot on tu.newid = ot.obj_id 
-- where not СопротивлениеЛинии='00000000-0000-0000-0000-000000000000'
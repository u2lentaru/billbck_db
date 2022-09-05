CREATE OR REPLACE FUNCTION import.func_import_db() RETURNS int AS
$$
DECLARE 
rcur refcursor; 
rec record;
strec record;
i int := 0;
r int := 0;
t int := 0;
id1 int; id2 int; id3 int; id4 int; id5 int; id6 int; id7 int; id8 int; id9 int; id10 int;
s1 text; s2 text; s3 text; s4 text; s5 text; s6 text; s7 text;
BEGIN

    TRUNCATE public.st_act_types RESTART IDENTITY CASCADE;
    open rcur for execute 'select * from import."ТипыАктовАттестации"'; 
    loop
        fetch rcur into rec;
        EXIT WHEN NOT FOUND;
        insert into public.st_act_types (id, act_type_name) values (default, rec.description) returning id into i;
        update import."ТипыАктовАттестации" set newid = i where ref = rec.ref;
        r=r+1;
        RAISE notice 'st_act_types.name, id : % % ', rec.description, i;
    end loop;
    close rcur; 
    RAISE notice 'st_act_types : % records', r;
    r=0;
    t=t+1;


    TRUNCATE public.st_areas RESTART IDENTITY CASCADE;
    -- 1 - 'Нет данных' 
    insert into public.st_areas (id, area_number, area_name) values (default, 'Нет данных', 'Нет данных');   
    open rcur for execute 'select * from import."РайоныГорода"'; 
    loop
        fetch rcur into rec;
        EXIT WHEN NOT FOUND;
        insert into public.st_areas (id, area_number, area_name) values (default, rec.Code, rec.description) returning id into i;
        update import."РайоныГорода" set newid = i where ref = rec.ref;
        r=r+1;
        RAISE notice 'st_areas.name, id : % % ', rec.description, i;
    end loop;
    close rcur; 
    RAISE notice 'st_areas : % records', r;
    r=0;
    t=t+1;


    TRUNCATE public.st_banks RESTART IDENTITY CASCADE;
    -- 1 - 'Нет данных' 
    insert into public.st_banks (id, bank_name, bank_descr, mfo) values (default, 'Нет данных', 'Нет данных', 'Нет данных');   
    open rcur for execute 'select * from import."Банки"'; 
    loop
        fetch rcur into rec;
        EXIT WHEN NOT FOUND;
        insert into public.st_banks (id, bank_name, bank_descr, mfo) values (default, rec.description, rec.description, rec.description) returning id into i;
        update import."Банки" set newid = i where ref = rec.ref;
        r=r+1;
        RAISE notice 'st_banks.name, id : % % ', rec.description, i;
    end loop;
    close rcur; 
    RAISE notice 'st_banks : % records', r;
    r=0;  
    t=t+1;


    TRUNCATE public.st_building_types RESTART IDENTITY CASCADE;
    -- 1 - 'Нет данных' 
    insert into public.st_building_types (id, building_type_name) values (default, 'Нет данных');
    open rcur for execute 'select * from import."ТипыЗастройки"'; 
    loop
        fetch rcur into rec;
        EXIT WHEN NOT FOUND;
        insert into public.st_building_types (id, building_type_name) values (default, rec.description) returning id into i;
        update import."ТипыЗастройки" set newid = i where ref = rec.ref;
        r=r+1;
        RAISE notice 'st_building_types.name, id : % % ', rec.description, i;
    end loop;
    close rcur; 
    RAISE notice 'st_building_types : % records', r;
    r=0;
    t=t+1;


    TRUNCATE public.st_calculation_types RESTART IDENTITY CASCADE;
        -- 1 - 'Нет данных' 
    insert into public.st_calculation_types (id, calculation_type_name) values (default, 'Нет данных');

    open rcur for execute 'select * from import."ТипыРасчета"'; 
    loop
        fetch rcur into rec;
        EXIT WHEN NOT FOUND;
        insert into public.st_calculation_types (id, calculation_type_name) values (default, rec.description) returning id into i;
        update import."ТипыРасчета" set newid = i where ref = rec.ref;
        r=r+1;
        RAISE notice 'st_calculation_types.name, id : % % ', rec.description, i;
    end loop;
    close rcur; 
    RAISE notice 'st_calculation_types : % records', r;
    r=0;
    t=t+1;


--st_cashdesks ?????????????????????????????????????????????????????



--st_charge_types ???????????????????????????????????????????????????
    TRUNCATE public.st_charge_types RESTART IDENTITY CASCADE;
    open rcur for execute 'select * from import."ТипыРасчета"'; 
    loop
        fetch rcur into rec;
        EXIT WHEN NOT FOUND;
        insert into public.st_charge_types (id, charge_type_name) values (default, rec.description) returning id into i;
        update import."ТипыРасчета" set newid = i where ref = rec.ref;
        r=r+1;
        RAISE notice 'st_charge_types.name, id : % % ', rec.description, i;
    end loop;
    close rcur; 
    RAISE notice 'st_charge_types : % records', r;
    r=0;
    t=t+1;


    TRUNCATE public.st_cities RESTART IDENTITY CASCADE;
    open rcur for execute 'select * from import."НаселенныеПункты"'; 
    loop
        fetch rcur into rec;
        EXIT WHEN NOT FOUND;
        insert into public.st_cities (id, city_name) values (default, rec.description) returning id into i;
        update import."НаселенныеПункты" set newid = i where ref = rec.ref;
        r=r+1;
        RAISE notice 'st_cities.name, id : % % ', rec.description, i;
    end loop;
    close rcur; 
    RAISE notice 'st_cities : % records', r;
    r=0;
    t=t+1;


    TRUNCATE public.st_claim_types RESTART IDENTITY CASCADE;
    open rcur for execute 'select * from import."ТипыОбращений"'; 
    loop
        fetch rcur into rec;
        EXIT WHEN NOT FOUND;
        insert into public.st_claim_types (id, claim_type_name) values (default, rec.description) returning id into i;
        update import."ТипыОбращений" set newid = i where ref = rec.ref;
        r=r+1;
        RAISE notice 'st_claim_types.name, id : % % ', rec.description, i;
    end loop;
    close rcur; 
    RAISE notice 'st_claim_types : % records', r;
    r=0;
    t=t+1;


    TRUNCATE public.st_conclusions RESTART IDENTITY CASCADE;
    open rcur for execute 'select * from import."ТипыЗаключенияАттестации"'; 
    loop
        fetch rcur into rec;
        EXIT WHEN NOT FOUND;
        insert into public.st_conclusions (id, conclusion_name) values (default, rec.description) returning id into i;
        update import."ТипыЗаключенияАттестации" set newid = i where ref = rec.ref;
        r=r+1;
        RAISE notice 'st_conclusions.name, id : % % ', rec.description, i;
    end loop;
    close rcur; 
    RAISE notice 'st_conclusions : % records', r;
    r=0;
    t=t+1;


    TRUNCATE public.st_connectors RESTART IDENTITY CASCADE;
    -- 1 - 'Нет данных' 
    insert into public.st_connectors (id, connector_name) values (default, 'Нет данных');
    open rcur for execute 'select * from import."ТипыУровнейПрисоединения"'; 
    loop
        fetch rcur into rec;
        EXIT WHEN NOT FOUND;
        insert into public.st_connectors (id, connector_name) values (default, rec.description) returning id into i;
        update import."ТипыУровнейПрисоединения" set newid = i where ref = rec.ref;
        r=r+1;
        RAISE notice 'st_connectors.name, id : % % ', rec.description, i;
    end loop;
    close rcur; 
    RAISE notice 'st_connectors : % records', r;
    r=0;
    t=t+1;


    TRUNCATE public.st_contract_mots RESTART IDENTITY CASCADE;
    open rcur for execute 'select * from import."ПричиныЗакрытияКарточек"'; 
    loop
        fetch rcur into rec;
        EXIT WHEN NOT FOUND;
        insert into public.st_contract_mots (id, contract_mot_name_ru, contract_mot_name_kz) values (default, rec.description, rec.description) returning id into i;
        update import."ПричиныЗакрытияКарточек" set newid = i where ref = rec.ref;
        r=r+1;
        RAISE notice 'st_contract_mots.name, id : % % ', rec.description, i;
    end loop;
    close rcur; 
    RAISE notice 'st_contract_mots : % records', r;
    r=0;
    t=t+1;


    TRUNCATE public.st_customer_groups RESTART IDENTITY CASCADE;
    -- 1 - 'Нет данных' 
    insert into public.st_customer_groups (id, customer_group_name) values (default, 'Нет данных');
    open rcur for execute 'select * from import."ГруппыПотребления"'; 
    loop
        fetch rcur into rec;
        EXIT WHEN NOT FOUND;
        insert into public.st_customer_groups (id, customer_group_name) values (default, rec.description) returning id into i;
        update import."ГруппыПотребления" set newid = i where ref = rec.ref;
        r=r+1;
        RAISE notice 'st_customer_groups.name, id : % % ', rec.description, i;
    end loop;
    close rcur; 
    RAISE notice 'st_customer_groups : % records', r;
    r=0;
    t=t+1;


    TRUNCATE public.st_equipment_types RESTART IDENTITY CASCADE;
    open rcur for execute 'select * from import."ТипыТокоприемников"'; 
    loop
        fetch rcur into rec;
        EXIT WHEN NOT FOUND;
        insert into public.st_equipment_types (id, equipment_type_name, equipment_type_power) values (default, rec.description, rec.Мощность::numeric) returning id into i;
        update import."ТипыТокоприемников" set newid = i where ref = rec.ref;
        r=r+1;
        RAISE notice 'st_equipment_types.name, id : % % ', rec.description, i;
    end loop;
    close rcur; 
    RAISE notice 'st_equipment_types : % records', r;
    r=0;
    t=t+1;


--st_equipment ???????????????????????????????????????????????????


    TRUNCATE public.st_eso RESTART IDENTITY CASCADE;
    -- 1 - 'Нет данных' 
    insert into public.st_eso (id, eso_name) values (default, 'Нет данных');
    open rcur for execute 'select * from import."Организации"'; 
    loop
        fetch rcur into rec;
        EXIT WHEN NOT FOUND;
        insert into public.st_eso (id, eso_name) values (default, rec.description) returning id into i;
        update import."Организации" set newid = i where ref = rec.ref;
        r=r+1;
        RAISE notice 'st_eso.name, id : % % ', rec.description, i;
    end loop;
    close rcur; 
    RAISE notice 'st_eso : % records', r;
    r=0;
    t=t+1;


    TRUNCATE public.st_input_types RESTART IDENTITY CASCADE;
    -- 1 - 'Нет данных' 
    insert into public.st_input_types (id, input_type_name) values (default, 'Нет данных');
    open rcur for execute 'select * from import."ТипыВходаОтпускаИзСетиТочекУчет"'; 
    loop
        fetch rcur into rec;
        EXIT WHEN NOT FOUND;
        insert into public.st_input_types (id, input_type_name) values (default, rec.description) returning id into i;
        update import."ТипыВходаОтпускаИзСетиТочекУчет" set newid = i where ref = rec.ref;
        r=r+1;
        RAISE notice 'st_input_types.name, id : % % ', rec.description, i;
    end loop;
    close rcur; 
    RAISE notice 'st_input_types : % records', r;
    r=0;
    t=t+1;


--st_ksk ???????????????????????????????????????????????????

    TRUNCATE public.st_ksk RESTART IDENTITY CASCADE;
    insert into public.st_ksk (id, ksk_name, ksk_address, ksk_head, ksk_phone) values (default, 'Нет данных', 'Нет данных', 'Нет данных', 'Нет данных');
    RAISE notice 'st_ksk : % records', 1;
    r=0;
    t=t+1;


    TRUNCATE public.st_langs RESTART IDENTITY CASCADE;
    open rcur for execute 'select * from import."Языки"'; 
    loop
        fetch rcur into rec;
        EXIT WHEN NOT FOUND;
        insert into public.st_langs (id, lang_name, lang_descr) values (default, rec.description, rec.description) returning id into i;
        update import."Языки" set newid = i where ref = rec.ref;
        r=r+1;
        RAISE notice 'st_langs.name, id : % % ', rec.description, i;
    end loop;
    close rcur; 
    RAISE notice 'st_langs : % records', r;
    r=0;
    t=t+1;


    TRUNCATE public.st_obj_statuses RESTART IDENTITY CASCADE;
    -- 1 - 'Нет данных'
    insert into public.st_obj_statuses (id, obj_status_name) values (default, 'Нет данных');
    RAISE notice 'st_obj_statuses : % records', 1;
    r=0;
    t=t+1;



    TRUNCATE public.st_obj_types RESTART IDENTITY CASCADE;
    -- 1 - 'Нет данных' 
    insert into public.st_obj_types (id, obj_type_name) values (default, 'Нет данных');

    open rcur for execute 'select * from import."ТипыОбъектов"'; 
    loop
        fetch rcur into rec;
        EXIT WHEN NOT FOUND;
        insert into public.st_obj_types (id, obj_type_name) values (default, rec.description) returning id into i;
        update import."ТипыОбъектов" set newid = i where ref = rec.ref;
        r=r+1;
        RAISE notice 'st_obj_types.name, id : % % ', rec.description, i;
    end loop;
    close rcur; 
    RAISE notice 'st_obj_types : % records', r;
    r=0;
    t=t+1;


    TRUNCATE public.st_org_info RESTART IDENTITY CASCADE;
    -- 1 - 'Нет данных' 
    insert into public.st_org_info (id, name, bin, address, bank_id, account_number, full_name) values (default, 'Нет данных', '123456789012', 'Нет данных', 1, 'Нет данных', 'Нет данных');
    open rcur for execute 'select * from import."Организации"'; 
    loop
        fetch rcur into rec;
        EXIT WHEN NOT FOUND;

        s1 = rec.Description; 
        if s1 is null then
            s1 = 'Нет данных';
        end if;

        s2 = rec.ЮридическийАдрес;
        if  s2 is null then
            s2 = 'Нет данных';
        end if;

        s3 = rec.НаименованиеПолное;
        if s3 is null then
            s3 = 'Нет данных';
        end if;

        insert into public.st_org_info (id, name, bin, address, bank_id, account_number, full_name) values (default, s1, '123456789012', s2, 1, 'Нет данных', s3) returning id into i;
        update import."Организации" set newid = i where ref = rec.ref;
        r=r+1;
        RAISE notice 'st_org_info.name, id : % % ', rec.description, i;
    end loop;
    close rcur; 
    RAISE notice 'st_org_info : % records', r;
    r=0;
    t=t+1;


--st_payment_types ???????????????????????????????????????????????????

    TRUNCATE public.st_payment_types RESTART IDENTITY CASCADE;
    insert into public.st_payment_types (id, payment_type_name) values (default, 'Нет данных');
    RAISE notice 'st_payment_types : % records', 1;
    r=0;
    t=t+1;


-- st_periods оставить как есть!


    TRUNCATE public.st_positions RESTART IDENTITY CASCADE;
    -- 1 - 'Нет данных' 
    insert into public.st_positions (id, position_name) values (default, 'Нет данных');
    open rcur for execute 'select * from import."Должности"'; 
    loop
        fetch rcur into rec;
        EXIT WHEN NOT FOUND;
        insert into public.st_positions (id, position_name) values (default, rec.description) returning id into i;
        update import."Должности" set newid = i where ref = rec.ref;
        r=r+1;
        RAISE notice 'st_positions.name, id : % % ', rec.description, i;
    end loop;
    close rcur; 
    RAISE notice 'st_positions : % records', r;
    r=0;
    t=t+1;


    TRUNCATE public.st_pu_types RESTART IDENTITY CASCADE;
    -- 1 - 'Нет данных' 
    insert into public.st_pu_types (id, pu_type_name) values (default, 'Нет данных');
    open rcur for execute 'select * from import."ТипыПриборовУчета"'; 
    loop
        fetch rcur into rec;
        EXIT WHEN NOT FOUND;
        insert into public.st_pu_types (id, pu_type_name) values (default, rec.description) returning id into i;
        update import."ТипыПриборовУчета" set newid = i where ref = rec.ref;
        r=r+1;
        RAISE notice 'st_pu_types.name, id : % % ', rec.description, i;
    end loop;
    close rcur; 
    RAISE notice 'st_pu_types : % records', r;
    r=0;
    t=t+1;


    TRUNCATE public.st_reasons RESTART IDENTITY CASCADE;
    -- 1 - 'Нет данных' 
    insert into public.st_reasons (id, reason_name) values (default, 'Нет данных');
    open rcur for execute 'select * from import."Основания"'; 
    loop
        fetch rcur into rec;
        EXIT WHEN NOT FOUND;
        insert into public.st_reasons (id, reason_name) values (default, rec.description) returning id into i;
        update import."Основания" set newid = i where ref = rec.ref;
        r=r+1;
        RAISE notice 'st_reasons.name, id : % % ', rec.description, i;
    end loop;
    close rcur; 
    RAISE notice 'st_reasons : % records', r;
    r=0;
    t=t+1;


    TRUNCATE public.st_reliabilities RESTART IDENTITY CASCADE;
    -- 1 - 'Нет данных' 
    insert into public.st_reliabilities (id, reliability_name) values (default, 'Нет данных');
    open rcur for execute 'select * from import."КатегорииНадежности"'; 
    loop
        fetch rcur into rec;
        EXIT WHEN NOT FOUND;
        insert into public.st_reliabilities (id, reliability_name) values (default, rec.Description) returning id into i;
        update import."КатегорииНадежности" set newid = i where ref = rec.ref;
        r=r+1;
        RAISE notice 'st_reliabilities.name, id : % % ', rec.Description, i;
    end loop;
    close rcur; 
    RAISE notice 'st_reliabilities : % records', r;
    r=0;
    t=t+1;


    TRUNCATE public.st_request_kinds RESTART IDENTITY CASCADE;
    insert into public.st_request_kinds (id, request_kind_name) values (default, 'Заявки');
    insert into public.st_request_kinds (id, request_kind_name) values (default, 'Обращения');
    insert into public.st_request_kinds (id, request_kind_name) values (default, 'Пожелания');
    RAISE notice 'st_request_kinds : % records', 3;
    r=0;
    t=t+1;


    TRUNCATE public.st_request_types RESTART IDENTITY CASCADE;
    -- 1 - 'Нет данных' 
    insert into public.st_request_types (id, request_kind_id, request_type_name) values (default, 1, 'Нет данных');
    open rcur for execute 'select * from import."ТипыОбращений"'; 
    loop
        fetch rcur into rec;
        EXIT WHEN NOT FOUND;
        insert into public.st_request_types (id, request_kind_id, request_type_name) values (default, 1, rec.Description) returning id into i;
        update import."ТипыОбращений" set newid = i where ref = rec.ref;
        r=r+1;
        RAISE notice 'st_request_types.name, id : % % ', rec.Description, i;
    end loop;
    close rcur; 
    RAISE notice 'st_request_types : % records', r;
    r=0;
    t=t+1;


    TRUNCATE public.st_results RESTART IDENTITY CASCADE;
    -- 1 - 'Нет данных' 
    insert into public.st_results (id, result_name) values (default, 'Нет данных');
    open rcur for execute 'select * from import."ТипыРезультата"'; 
    loop
        fetch rcur into rec;
        EXIT WHEN NOT FOUND;
        insert into public.st_results (id, result_name) values (default, rec.Description) returning id into i;
        update import."ТипыРезультата" set newid = i where ref = rec.ref;
        r=r+1;
        RAISE notice 'st_results.name, id : % % ', rec.Description, i;
    end loop;
    close rcur; 
    RAISE notice 'st_results : % records', r;
    r=0;
    t=t+1;


    TRUNCATE public.st_seal_colours RESTART IDENTITY CASCADE;
    -- 1 - 'Нет данных' 
    insert into public.st_seal_colours (id, seal_colour_name) values (default, 'Нет данных');
    open rcur for execute 'select * from import."ЦветаПломб"'; 
    loop
        fetch rcur into rec;
        EXIT WHEN NOT FOUND;
        insert into public.st_seal_colours (id, seal_colour_name) values (default, rec.Description) returning id into i;
        update import."ЦветаПломб" set newid = i where ref = rec.ref;
        r=r+1;
        RAISE notice 'st_seal_colours.name, id : % % ', rec.Description, i;
    end loop;
    close rcur; 
    RAISE notice 'st_seal_colours : % records', r;
    r=0;
    t=t+1;


    TRUNCATE public.st_seal_statuses RESTART IDENTITY CASCADE;
    insert into public.st_seal_statuses (id, seal_status_name) values (default, 'Нет данных');
    RAISE notice 'st_seal_statuses : % records', 1;
    r=0;
    t=t+1;


    TRUNCATE public.st_seal_types RESTART IDENTITY CASCADE;
    -- 1 - 'Нет данных' 
    insert into public.st_seal_types (id, seal_type_name) values (default, 'Нет данных');
    open rcur for execute 'select * from import."ТипыПломб"'; 
    loop
        fetch rcur into rec;
        EXIT WHEN NOT FOUND;
        insert into public.st_seal_types (id, seal_type_name) values (default, rec.Description) returning id into i;
        update import."ТипыПломб" set newid = i where ref = rec.ref;
        r=r+1;
        RAISE notice 'st_seal_types.name, id : % % ', rec.Description, i;
    end loop;
    close rcur; 
    RAISE notice 'st_seal_types : % records', r;
    r=0;
    t=t+1;


    TRUNCATE public.st_sectors RESTART IDENTITY CASCADE;
    -- 1 - 'Нет данных' 
    insert into public.st_sectors (id, sector_name) values (default, 'Нет данных');
    open rcur for execute 'select * from import."Сектора"'; 
    loop
        fetch rcur into rec;
        EXIT WHEN NOT FOUND;
        insert into public.st_sectors (id, sector_name) values (default, rec.Description) returning id into i;
        update import."Сектора" set newid = i where ref = rec.ref;
        r=r+1;
        RAISE notice 'st_sectors.name, id : % % ', rec.Description, i;
    end loop;
    close rcur; 
    RAISE notice 'st_sectors : % records', r;
    r=0;
    t=t+1;


    TRUNCATE public.st_service_types RESTART IDENTITY CASCADE;
    -- 1 - 'Нет данных' 
    insert into public.st_service_types (id, service_type_name) values (default, 'Нет данных');
    open rcur for execute 'select * from import."ТипыОбслуживания"'; 
    loop
        fetch rcur into rec;
        EXIT WHEN NOT FOUND;
        insert into public.st_service_types (id, service_type_name) values (default, rec.Description) returning id into i;
        update import."ТипыОбслуживания" set newid = i where ref = rec.ref;
        r=r+1;
        RAISE notice 'st_service_types.name, id : % % ', rec.Description, i;
    end loop;
    close rcur; 
    RAISE notice 'st_service_types : % records', r;
    r=0;
    t=t+1;


    TRUNCATE public.st_shutdown_types RESTART IDENTITY CASCADE;
    -- 1 - 'Нет данных' 
    insert into public.st_shutdown_types (id, shutdown_type_name) values (default, 'Нет данных');
    open rcur for execute 'select * from import."ТипыОтключений"'; 
    loop
        fetch rcur into rec;
        EXIT WHEN NOT FOUND;
        insert into public.st_shutdown_types (id, shutdown_type_name) values (default, rec.Description) returning id into i;
        update import."ТипыОтключений" set newid = i where ref = rec.ref;
        r=r+1;
        RAISE notice 'st_shutdown_types.name, id : % % ', rec.Description, i;
    end loop;
    close rcur; 
    RAISE notice 'st_shutdown_types : % records', r;
    r=0;
    t=t+1;


    TRUNCATE public.st_staff RESTART IDENTITY CASCADE;
    -- 1 - 'Нет данных' 
    insert into public.st_staff (id, staff_name, org_id, phone, notes) values (default, 'Нет данных', 1, null, null);
    open rcur for execute 'select * from import."Пользователи"'; 
    loop
        fetch rcur into rec;
        EXIT WHEN NOT FOUND;
        insert into public.st_staff (id, staff_name, org_id, phone, notes) values (default, rec.Description, 1, null, null) returning id into i;
        update import."Пользователи" set newid = i where ref = rec.ref;
        r=r+1;
        RAISE notice 'st_staff.name, id : % % ', rec.Description, i;
    end loop;
    close rcur; 
    RAISE notice 'st_staff : % records', r;
    r=0;
    t=t+1;


    TRUNCATE public.st_street_names RESTART IDENTITY CASCADE;
    TRUNCATE public.st_streets RESTART IDENTITY CASCADE;
    -- 1 - 'Нет данных' 
    select func_streets_add('Нет данных', 1, '2019-01-01') into i;

    open rcur for execute 'select * from import."Улицы"'; 
    loop
        fetch rcur into rec;
        EXIT WHEN NOT FOUND;
        select func_streets_add(rec.Description, 1, rec.ДатаВвода) into i;
        update import."Улицы" set newid = i where ref = rec.ref;
        r=r+1;
        RAISE notice 'st_streets.name, id : % % ', rec.Description, i;
    end loop;
    close rcur; 
    RAISE notice 'st_streets : % records', r;
    r=0;
    t=t+1;


    TRUNCATE public.st_sub_types RESTART IDENTITY CASCADE;
    -- 1 - 'Нет данных' 
    insert into public.st_sub_types (id, type_name, type_descr) values (default, 'Нет данных', 'Нет данных');
    open rcur for execute 'select * from import."ТипыАбонентов"'; 
    loop
        fetch rcur into rec;
        EXIT WHEN NOT FOUND;
        insert into public.st_sub_types (id, type_name, type_descr) values (default, rec.Description, rec.Description) returning id into i;
        update import."ТипыАбонентов" set newid = i where ref = rec.ref;
        r=r+1;
        RAISE notice 'st_sub_types.name, id : % % ', rec.Description, i;
    end loop;
    close rcur; 
    RAISE notice 'st_sub_types : % records', r;
    r=0;
    t=t+1;


    TRUNCATE public.st_tariff_groups RESTART IDENTITY CASCADE;
    -- 1 - 'Нет данных' 
    insert into public.st_tariff_groups (id, tariff_group_name) values (default, 'Нет данных');
    open rcur for execute 'select * from import."ТарифныеГруппы"'; 
    loop
        fetch rcur into rec;
        EXIT WHEN NOT FOUND;
        insert into public.st_tariff_groups (id, tariff_group_name) values (default, rec.Description) returning id into i;
        update import."ТарифныеГруппы" set newid = i where ref = rec.ref;
        r=r+1;
        RAISE notice 'st_tariff_groups.name, id : % % ', rec.Description, i;
    end loop;
    close rcur; 
    RAISE notice 'st_tariff_groups : % records', r;
    r=0;
    t=t+1;


    TRUNCATE public.st_tariffs RESTART IDENTITY CASCADE;
    -- 1 - 'Нет данных' 
    insert into public.st_tariffs (id, tariff_name, tariff_group_id, norma, tariff, startdate, enddate) 
    values (default, 'Нет данных', 1, 0.0 , 0.0, to_date('2019-01-01', 'YYYY-mm-dd'), null);
    open rcur for execute 'select * from import."Тарифы"'; 
    loop
        fetch rcur into rec;
        EXIT WHEN NOT FOUND;
        insert into public.st_tariffs (id, tariff_name, tariff_group_id, norma, tariff, startdate, enddate) 
        values (default, rec.Description, 1, 0.0 , 0.0, to_date('2019-01-01', 'YYYY-mm-dd'), null) returning id into i;
        update import."Тарифы" set newid = i where ref = rec.ref;
        r=r+1;
        RAISE notice 'st_tariffs.name, id : % % ', rec.Description, i;
    end loop;
    close rcur; 
    RAISE notice 'st_tariffs : % records', r;
    r=0;
    t=t+1;


    TRUNCATE public.st_tgu_types RESTART IDENTITY CASCADE;
    -- 1 - 'Нет данных' 
    insert into public.st_tgu_types (id, tgu_type_name) values (default, 'Нет данных');
    open rcur for execute 'select * from import."ТипыГоловногоУчета"'; 
    loop
        fetch rcur into rec;
        EXIT WHEN NOT FOUND;
        insert into public.st_tgu_types (id, tgu_type_name) values (default, rec.Description) returning id into i;
        update import."ТипыГоловногоУчета" set newid = i where ref = rec.ref;
        r=r+1;
        RAISE notice 'st_tgu_types.name, id : % % ', rec.Description, i;
    end loop;
    close rcur; 
    RAISE notice 'st_tgu_types : % records', r;
    r=0;
    t=t+1;


    TRUNCATE public.st_uzo RESTART IDENTITY CASCADE;
    -- 1 - 'Нет данных'
    insert into public.st_uzo (id, uzo_name, uzo_value) values (default, 'Нет данных', 0);
    RAISE notice 'st_uzo : % records', 1;
    r=0;
    t=t+1;


    TRUNCATE public.st_violations RESTART IDENTITY CASCADE;
    -- 1 - 'Нет данных' 
    insert into public.st_violations (id, violation_name) values (default, 'Нет данных');
    open rcur for execute 'select * from import."ТипыНарушений"'; 
    loop
        fetch rcur into rec;
        EXIT WHEN NOT FOUND;
        insert into public.st_violations (id, violation_name) values (default, rec.Description) returning id into i;
        update import."ТипыНарушений" set newid = i where ref = rec.ref;
        r=r+1;
        RAISE notice 'st_violations.name, id : % % ', rec.Description, i;
    end loop;
    close rcur; 
    RAISE notice 'st_violations : % records', r;
    r=0;
    t=t+1;


    TRUNCATE public.st_voltage RESTART IDENTITY CASCADE;
    -- 1 - 'Нет данных' 
    insert into public.st_voltage (id, voltage_name, voltage_value) values (default, 'Нет данных', 0);
    open rcur for execute 'select * from import."КлассыНапряжения"'; 
    loop
        fetch rcur into rec;
        EXIT WHEN NOT FOUND;
        insert into public.st_voltage (id, voltage_name, voltage_value) values (default, rec.Description, 0) returning id into i;
        update import."КлассыНапряжения" set newid = i where ref = rec.ref;
        r=r+1;
        RAISE notice 'st_voltage.name, id : % % ', rec.Description, i;
    end loop;
    close rcur; 
    RAISE notice 'st_voltage : % records', r;
    r=0;
    t=t+1;



------------------------------------------------------------------------------------------------------------
-- Рабочие таблицы. Очерёдность!
------------------------------------------------------------------------------------------------------------


--wt_tgu

    TRUNCATE public.wt_tgu RESTART IDENTITY CASCADE;
    -- 1 - 'root' 
    insert into public.wt_tgu (id, pid, tgu_name, tgu_type_id, inv_number, input_voltage, output_voltage1, output_voltage2) 
    values (default, 1, 'root', 1, null, null, null, null);

    -- pid bigint NOT NULL,
    -- tgu_name text NOT NULL,
    -- tgu_type_id bigint NOT NULL,
   	-- inv_number text,
	-- input_voltage bigint,
	-- output_voltage1 bigint,
	-- output_voltage2 bigint,


    open rcur for execute 'select * from import."Подстанции"'; 
    loop
        fetch rcur into rec;
        EXIT WHEN NOT FOUND;

        s1 = rec.ИнвентарныйНомер;
        if s1 is null then
            s1 = 'Нет данных';
        end if;

        select newid from import."КлассыНапряжения" where ref = rec.КлассНапряженияВход into id1;
        if id1 is null then
            id1 = 1; --'Нет данных'
        end if;

        select newid from import."КлассыНапряжения" where ref = rec.КлассНапряженияВыход1 into id2;
        if id2 is null then
            id2 = 1; --'Нет данных'
        end if;

        select newid from import."КлассыНапряжения" where ref = rec.КлассНапряженияВыход2 into id3;
        if id3 is null then
            id3 = 1; --'Нет данных'
        end if;
        
        insert into public.wt_tgu (id, pid, tgu_name, tgu_type_id, inv_number, input_voltage, output_voltage1, output_voltage2) 
        values (default, 1, rec.Description, 3, s1, id1, id2, id3) returning id into i;
        update import."Подстанции" set newid = i where ref = rec.ref;
        r=r+1;
        RAISE notice 'wt_tgu.name Подстанции, id : % % ', rec.description, i;
    end loop;
    close rcur; 
    RAISE notice 'wt_tgu Подстанции : % records', r;
    r=0;
    t=t+1;


    open rcur for execute 'select * from import."ТП"'; 
    loop
        fetch rcur into rec;
        EXIT WHEN NOT FOUND;

        s1 = rec.ИнвентарныйНомер;
        if s1 is null then
            s1 = 'Нет данных';
        end if;

        select newid from import."КлассыНапряжения" where ref = rec.КлассНапряженияВход into id1;
        if id1 is null then
            id1 = 1; --'Нет данных'
        end if;

        select newid from import."КлассыНапряжения" where ref = rec.КлассНапряженияВыход1 into id2;
        if id2 is null then
            id2 = 1; --'Нет данных'
        end if;

        select newid from import."КлассыНапряжения" where ref = rec.КлассНапряженияВыход2 into id3;
        if id3 is null then
            id3 = 1; --'Нет данных'
        end if;

        insert into public.wt_tgu (id, pid, tgu_name, tgu_type_id, inv_number, input_voltage, output_voltage1, output_voltage2) 
        values (default, 1, rec.Description, 2, s1, id1, id2, id3) returning id into i;
        update import."ТП" set newid = i where ref = rec.ref;
        r=r+1;
        RAISE notice 'wt_tgu.name ТП, id : % % ', rec.description, i;
    end loop;
    close rcur; 
    RAISE notice 'wt_tgu ТП : % records', r;
    r=0;
    t=t+1;


-- st_seals

    TRUNCATE public.st_seals RESTART IDENTITY CASCADE;
    -- 1 - 'Нет данных' 
    insert into public.st_seals (id, seal_number, packet_number, area_id, staff_id, seal_type_id, seal_colour_id, seal_status_id, issue_date, report_date) 
        values (default, 'Нет данных', 'Нет данных', 1, 1, 1, 1, 1, null, null);

    open rcur for execute 'select * from import."Пломбы"'; 
    loop
        fetch rcur into rec;
        EXIT WHEN NOT FOUND;

        s1 = rec.Description;
        if s1 is null then
            s1 = 'Нет данных';
        end if;

        select newid from import."Пользователи" where ref = rec.Автор into id1;
        if id1 is null then
            id1 = 1; --'Нет данных'
        end if;

        select newid from import."ТипыПломб" where ref = rec.ТипПломбы into id2;
        if id2 is null then
            id2 = 1; --'Нет данных'
        end if;

        select newid from import."ЦветаПломб" where ref = rec.ЦветПломбы into id3;
        if id3 is null then
            id3 = 1; --'Нет данных'
        end if;

        insert into public.st_seals (id, seal_number, packet_number, area_id, staff_id, seal_type_id, seal_colour_id, seal_status_id, issue_date, report_date) 
        values (default, s1, 'Нет данных', 1, id1, id2, id3, 1, to_date(rec.ДатаВыдачи, 'YYYY-mm-dd'), to_date(rec.ДатаУстановки, 'YYYY-mm-dd')) returning id into i;
        update import."Пломбы" set newid = i where ref = rec.ref;
        r=r+1;
        RAISE notice 'st_seals.name, id : % % ', rec.description, i;
    end loop;
    close rcur; 
    RAISE notice 'st_seals : % records', r;
    r=0;
    t=t+1;


-- st_subjects

    TRUNCATE public.st_subjects RESTART IDENTITY CASCADE;
    TRUNCATE public.st_sub_details RESTART IDENTITY CASCADE;
    -- 1 - 'Нет данных' 
    select func_sub_details_add(4, 'true', 'Нет данных', 'Нет данных', '123456789012', 1, 'Нет данных', 1, 'Нет данных', 'Нет данных', 'Нет данных', '2019-01-01', 'Нет данных') into i;

	-- sub_type bigint NOT NULL,
	-- sub_phys boolean NOT NULL,
	-- sub_descr text NOT NULL,
	-- sub_name text NOT NULL,
	-- bin char(12) NOT NULL,
	-- head_pos bigint NOT NULL,
	-- head_name text NOT NULL,
	-- acc_pos bigint NOT NULL,
	-- acc_name text NOT NULL,
	-- sub_address text NOT NULL,
	-- sub_phone text NOT NULL,
	-- created date NOT NULL,
	-- sub_account text NOT NULL

    -- sub_type 3 - Физическое лицо, 4 - Юридическое лицо
    -- ЮридическиеЛица

    open rcur for execute 'select * from import."ЮридическиеЛица"'; 
    loop
        fetch rcur into rec;
        EXIT WHEN NOT FOUND;

        s1 = rec.Телефоны;
        if s1 is null then
            s1 = 'Нет данных';
        end if;

        s2 = rec.ЮридическийАдрес;
        if s2 is null then
            s2 = 'Нет данных';
        end if;

        select func_sub_details_add(4, 'true', rec.Description, rec.Description, '123456789012', 1, 'Нет данных', 1, 'Нет данных', s2, s1, rec.ДатаВвода, 'Нет данных') into i;
        update import."ЮридическиеЛица" set newid = i where ref = rec.ref;
        r=r+1;
        RAISE notice 'st_subjects.name, id : % % ', rec.Description, i;
    end loop;
    close rcur; 
    RAISE notice 'st_subjects : % records', r;
    r=0;
    t=t+1;

    -- ФизическиеЛица
    open rcur for execute 'select * from import."ФизическиеЛица"'; 
    loop
        fetch rcur into rec;
        EXIT WHEN NOT FOUND;

        s1 = rec.ТелефонМобильный;
        if s1 is null then
            s1 = 'Нет данных';
        end if;

        s2 = rec.ЮридическийАдрес;
        if s2 is null then
            s2 = 'Нет данных';
        end if;

        select func_sub_details_add(3, 'true', rec.Description, rec.Description, '123456789012', 1, 'Нет данных', 1, 'Нет данных', s2, s1, rec.ДатаВвода, 'Нет данных') into i;
        update import."ФизическиеЛица" set newid = i where ref = rec.ref;
        r=r+1;
        RAISE notice 'st_subjects.name, id : % % ', rec.Description, i;
    end loop;
    close rcur; 
    RAISE notice 'st_subjects : % records', r;
    r=0;
    t=t+1;


-- st_houses

    TRUNCATE public.st_houses RESTART IDENTITY CASCADE;
    open rcur for execute 'select * from import."Здания"'; 
    loop
        fetch rcur into rec;
        EXIT WHEN NOT FOUND;

        -- ТочкаУчета.Адрес->Здания.ref
        -- building_types_id ТипЗастройки
        -- street_id Импорт
        -- house_number НомерДома
        -- building_number Литера
        -- rp_id ТочкаУчета.ТП/Подстанция
        -- area_id ТочкаУчета.СетевойУчасток
        -- ksk_id ????
        -- sector_id Сектор
        -- connector_id ТочкаУчета.УровеньПрисоединения ?????
        -- input_type_id ТочкаУчета.ТипВходаОтпускаИзСети
        -- reliability_id ТочкаУчета.КатегорияНадежности
        -- voltage_id ТочкаУчета.КлассНапряжения
        -- notes Description (Адрес) 
        
        select newid from import."ТипыЗастройки" where ref = rec.ТипЗастройки into id1;
        if id1 is null then
            id1 = 1; --'Нет данных'
        end if;
        
        s1 = rec.НомерДома;
        if s1 is null then
            s1 = 'Нет данных';
        end if;

        select * from import."ТочкиУчета" where Адрес = rec.ref and not ТП = '00000000-0000-0000-0000-000000000000' limit 1 into strec;

        select newid from import."Сектора" where ref = rec.Сектор into id2;
        if id2 is null then
            id2 = 1; --'Нет данных'
        end if;

        select newid from import."ТипыУровнейПрисоединения" where ref = strec.УровеньПрисоединения into id3;
        if id3 is null then
            id3 = 1; --'Нет данных'
        end if;

        select newid from import."ТипыВходаОтпускаИзСетиТочекУчета" where ref = strec.КатегорияНадежности into id4;
        if id4 is null then
            id4 = 1; --'Нет данных'
        end if;

        select newid from import."КатегорииНадежности" where ref = strec.ТипВходаОтпускаИзСети into id5;
        if id5 is null then
            id5 = 1; --'Нет данных'
        end if;

        select newid from import."КлассыНапряжения" where ref = strec.КлассНапряжения into id6;
        if id6 is null then
            id6 = 1; --'Нет данных'
        end if;

        -- select newid from import."СетевыеУчастки" where ref = strec.СетевойУчасток into id7;
        -- if id7 is null then
        --     id7 = 1; --'Нет данных'
        -- end if;

        insert into public.st_houses (id, building_types_id, street_id, house_number, building_number, rp_id, area_id, ksk_id, sector_id,
        connector_id, input_type_id, reliability_id, voltage_id, notes) 
        values (default, id1, 1, s1, rec.Литера, 1, 1, 1, id2, id3, id4, id5, id6, rec.description) returning id into i;
        update import."Здания" set newid = i where ref = rec.ref;
        r=r+1;
        RAISE notice 'st_houses.name, id : % % ', rec.description, i;
    end loop;
    close rcur; 
    RAISE notice 'st_houses : % records', r;
    r=0;
    t=t+1;


-- wt_contracts

    TRUNCATE public.wt_contract_details RESTART IDENTITY CASCADE;
    TRUNCATE public.wt_contracts RESTART IDENTITY CASCADE;
    open rcur for execute 'select * from import."Договоры"'; 
    loop
        fetch rcur into rec;
        EXIT WHEN NOT FOUND;

        select newid from
        (select ref, description, newid from "import".ФизическиеЛица
        union
        select ref, description, newid from "import".ЮридическиеЛица) as sub
        where ref = rec.Потребитель into id1;
        if id1 is null then
            id1 = 1; --'Нет данных'
        end if;

        s1 = rec.ДоговорЭСО;
        if  s1 is null then
            s1 = 'Нет данных';
        end if;

        select newid from import."Организации" where ref = rec.ЭСО into id3;
        if id3 is null then
            id3 = 1; --'Нет данных'
        end if;

        select newid from import."РайоныГорода" where ref = rec.РайонГорода into id4;
        if id4 is null then
            id4 = 1; --'Нет данных'
        end if;

        select newid from import."ГруппыПотребления" where ref = rec.ГруппаПотребления into id5;
        if id5 is null then
            id5 = 1; --'Нет данных'
        end if;

        select func_contracts_add(rec.Code::numeric, 'Нет данных', rec.Description, rec.ДатаОткрытия, id1, id1,
        s1, id3, id4, id5, rec.АдресПоДоговору) into i;
        update import."Договоры" set newid = i where ref = rec.ref;
        r=r+1;
        RAISE notice 'wt_contracts.name, id : % % ', rec.description, i;
    end loop;
    close rcur; 
    RAISE notice 'wt_contracts : % records', r;
    r=0;
    t=t+1;


-- wt_objects

    TRUNCATE public.wt_objects RESTART IDENTITY CASCADE;
    -- 1 - 'Нет данных' 
    insert into public.wt_objects (id, object_name, house_id, flat_number, obj_type_id, reg_qty, uzo_id, tariff_group_id, 
    calculation_type_id, obj_status_id, notes, mff_id) 
    values (default, 'Нет данных', 1, '0', 1, 0, 1, 1, 1, 1, null, null);

    open rcur for execute 'select * from import."ТочкиУчета"'; 
    loop
        fetch rcur into rec;
        EXIT WHEN NOT FOUND;

	-- object_name text NOT NULL, 
    -- house_id bigint NOT NULL,
    -- flat_number text,
    -- obj_type_id bigint NOT NULL, --fixed 1 - MFF, 2 -SubMFF ( 1 - 'Нет данных' )
    -- reg_qty int NOT NULL,
    -- uzo_id bigint NOT NULL,
    -- tariff_group_id bigint NOT NULL,
    -- calculation_type_id int NOT NULL,
    -- obj_status_id int NOT NULL,
    -- notes text,
    -- mff_id bigint, -- not null for SubMFF

        s1 = rec.Description;
        if  s1 is null then
            s1 = 'Нет данных';
        end if;

        select newid from import."Здания" where ref = rec.Адрес into id2;
        --if id2 is null then
        if id2 is null or id2 = 0 then
            id2 = 1; --'Нет данных'
        end if;

        s3 = rec.НомерКвартиры;
        if  s3 is null then
            s3 = 'Нет данных';
        end if;

        s4 = rec.ОписаниеОбъектов;
        if  s4 is null then
            s4 = 'Нет данных';
        end if;

        insert into public.wt_objects (id, object_name, house_id, flat_number, obj_type_id, reg_qty, uzo_id, tariff_group_id, 
        calculation_type_id, obj_status_id, notes, mff_id) 
        values (default, s1, id2, s3, 1, 0, 1, 1, 1, 1, s4, null) returning id into i;
        update import."ТочкиУчета" set newid = i where ref = rec.ref;
        r=r+1;
        RAISE notice 'wt_objects.name, id : % % ', rec.description, i;
    end loop;
    close rcur; 
    RAISE notice 'wt_objects : % records', r;
    r=0;
    t=t+1;


-- wt_pu

    TRUNCATE public.wt_pu RESTART IDENTITY CASCADE;
    -- 1 - 'Нет данных' 
    insert into public.wt_pu (id, object_id, obj_type_id, pu_type_id, pu_number, install_date, check_interval, initial_value, 
    dev_stopped, startdate, enddate, pid) 
    values (default, 1, 0, 1, 'Нет данных', to_date('2019-01-01', 'YYYY-mm-dd'), 0, 0, 'true', to_date('2019-01-01', 'YYYY-mm-dd'), null, null);

    open rcur for execute 'select * from import."ПриборыУчета"'; 
    loop
        fetch rcur into rec;
        EXIT WHEN NOT FOUND;

    -- object_id bigint NOT NULL,
    -- obj_type_id bigint NOT NULL,
    -- pu_type_id bigint NOT NULL,
    -- pu_number text NOT NULL,
    -- install_date date NOT NULL,
    -- check_interval int NOT NULL,
    -- initial_value numeric NOT NULL,
    -- dev_stopped boolean NOT NULL,
    -- startdate date NOT NULL,
    -- enddate date,
    -- pid bigint,

        select newid from import."ТипыПриборовУчета" where ref = rec.ТипПрибора into id1;
        if id1 is null then
            id1 = 1; --'Нет данных'
        end if;

        s2 = rec.Description;
        if  s2 is null then
            s2 = 'Нет данных';
        end if;

        insert into public.wt_pu (id, object_id, obj_type_id, pu_type_id, pu_number, install_date, check_interval, initial_value, 
        dev_stopped, startdate, enddate, pid) 
        values (default, 1, 1, id1, s2, to_date(rec.ДатаВвода, 'YYYY-mm-dd'), 3, 0, 'true', to_date(rec.ДатаВвода, 'YYYY-mm-dd'), null, null) returning id into i;
        update import."ПриборыУчета" set newid = i where ref = rec.ref;
        r=r+1;
        RAISE notice 'wt_pu.name, id : % % ', rec.description, i;
    end loop;
    close rcur; 
    RAISE notice 'wt_pu : % records', r;
    r=0;
    t=t+1;


RAISE notice 'Всего таблиц : %', t;
RAISE notice 'Starttime, endtime, exectime : % % %', now(), clock_timestamp(), clock_timestamp() - now();

return t;
END;
$$ LANGUAGE 'plpgsql';
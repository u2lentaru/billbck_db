CREATE OR REPLACE FUNCTION import_tgu() RETURNS int AS
$$
DECLARE
curao cursor for select * from all_obj;
recao record;
currl1 int :=1;
currl2 int :=1;
hid int :=0;
o_id int :=0;
cnt int;
hcnt int;
i int :=0;
BEGIN
    open curao;
    loop
        fetch curao into recao;
        EXIT WHEN NOT FOUND;
        RAISE notice 'recao.a3, recao.a5 : % %', recao.a3, recao.a5;
        -- null l2
        if recao.a3 is null and recao.a5 is null 
        then
            currl2:=currl1;
            RAISE notice 'currl1, currl2 : % %', currl1, currl2;
        else
            if recao.a3 is not null 
            then
                select count(*) from level_2 where a2 like trim(from recao.a3)||'%' into cnt;
                if cnt> 0 
                then
                    --level2 (voltage id posterc.kz 8, local 5)
                    select * from func_tgu_add(currl1, recao.a3 , 3, 'Импорт данных', 8, 8, 8) into currl2;
                    i=i+1;
                    RAISE notice 'level2 currl2, recao.a3 : % %', currl2, quote_literal(recao.a3);
                else
                    --level1         
                    select * from func_tgu_add(1, recao.a3, 1, 'Импорт данных', 8, 8, 8) into currl1;                 
                    i=i+1;
                    RAISE notice 'level1 currl1, recao.a3 : % %', currl1, recao.a3::text;
                end if;
            else
                --object
                select id from st_houses where recao.a11 = notes into hid;
                if hid is null then
                    --building_types_id local = 3, oti kz = 7
                    select * from func_houses_add(7, 1, '0', '0', currl2, 1, 1, 1, 1, 1, 1, 5, recao.a11) into hid;
                end if;    
                RAISE notice 'object currl2, hid : % %', currl2, hid;
                -- update st_houses set (notes) = (recao.a11||' '||recao.a13) where id = hid;
                select * from func_objects_add(recao.a9, hid, '0', 20, 0, 1, 1, recao.a11||'~'||recao.a13) into o_id;
                --oti local = 1, oti kz = 20
                -- select * from func_contracts_add(pa numeric(12), bc text, cn text, sd text, cti int, csi int, ecn text, ei int, ai int, cgi int);
                -- select * from func_sub_details_add(st int, sp boolean, sd text, sn text, sb text, shp int, shn text, sap int, san text, sad text, sph text, sst text, sac text);
                -- select * from func_obj_contracts_add(c int, o int, s text);
                i=i+1;
            end if;
        end if;
    end loop;
    close curao;  
	return i;
END
$$ LANGUAGE 'plpgsql';
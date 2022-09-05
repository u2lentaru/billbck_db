CREATE OR REPLACE FUNCTION import.func_import_trans_xml(ptf text) RETURNS int AS
$$
DECLARE 
myxml xml;
i int := 0;
t int := 0;
BEGIN
myxml := XMLPARSE(DOCUMENT convert_from(pg_read_binary_file(ptf), 'UTF8'));


--InformationRegisterRecordSet.ТрансформаторыТокаНаТочках
-- DROP TABLE IF EXISTS import.ТрансформаторыТокаНаТочках; 
CREATE TABLE import.ТрансформаторыТокаНаТочках AS 
-- INSERT INTO import.ТрансформаторыТокаНаТочках
SELECT 
    (xpath('//Recorder/text()', x))[1]::text AS Recorder
    ,(xpath('//Period/text()', x))[1]::text AS Period
    ,(xpath('//Active/text()', x))[1]::text AS Active
    ,(xpath('//ТочкаУчета/text()', x))[1]::text AS ТочкаУчета
    ,(xpath('//Трансформатор/text()', x))[1]::text AS Трансформатор
    ,(xpath('//Установлен/text()', x))[1]::text AS Установлен
    ,(xpath('//Сотрудник/text()', x))[1]::text AS Сотрудник
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
FROM unnest(xpath('//InformationRegisterRecordSet.ТрансформаторыТокаНаТочках/Records/Record', myxml)) x;
SELECT count(*) FROM import.ТрансформаторыТокаНаТочках into i;
RAISE notice 'ТрансформаторыТокаНаТочках : %', i;
t=t+1;


--InformationRegisterRecordSet.ТрансформаторыНапряженияНаТочках
-- DROP TABLE IF EXISTS import.ТрансформаторыНапряженияНаТочках; 
CREATE TABLE import.ТрансформаторыНапряженияНаТочках AS 
-- INSERT INTO import.ТрансформаторыНапряженияНаТочках
SELECT 
    (xpath('//Recorder/text()', x))[1]::text AS Recorder
    ,(xpath('//Period/text()', x))[1]::text AS Period
    ,(xpath('//Active/text()', x))[1]::text AS Active
    ,(xpath('//ТочкаУчета/text()', x))[1]::text AS ТочкаУчета
    ,(xpath('//Трансформатор/text()', x))[1]::text AS Трансформатор
    ,(xpath('//Установлен/text()', x))[1]::text AS Установлен
    ,(xpath('//Сотрудник/text()', x))[1]::text AS Сотрудник
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
FROM unnest(xpath('//InformationRegisterRecordSet.ТрансформаторыНапряженияНаТочках/Records/Record', myxml)) x;
SELECT count(*) FROM import.ТрансформаторыНапряженияНаТочках into i;
RAISE notice 'ТрансформаторыНапряженияНаТочках : %', i;
t=t+1;


--InformationRegisterRecordSet.СиловыеТрансформаторыНаТочках
-- DROP TABLE IF EXISTS import.СиловыеТрансформаторыНаТочках; 
CREATE TABLE import.СиловыеТрансформаторыНаТочках AS 
-- INSERT INTO import.СиловыеТрансформаторыНаТочках
SELECT 
    (xpath('//Recorder/text()', x))[1]::text AS Recorder
    ,(xpath('//Period/text()', x))[1]::text AS Period
    ,(xpath('//Active/text()', x))[1]::text AS Active
    ,(xpath('//ТочкаУчета/text()', x))[1]::text AS ТочкаУчета
    ,(xpath('//СиловойТрансформатор/text()', x))[1]::text AS СиловойТрансформатор
    ,(xpath('//Установлен/text()', x))[1]::text AS Установлен
    ,(xpath('//Сотрудник/text()', x))[1]::text AS Сотрудник
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
FROM unnest(xpath('//InformationRegisterRecordSet.СиловыеТрансформаторыНаТочках/Records/Record', myxml)) x;
SELECT count(*) FROM import.СиловыеТрансформаторыНаТочках into i;
RAISE notice 'СиловыеТрансформаторыНаТочках : %', i;
t=t+1;


return t;


END;
$$ LANGUAGE 'plpgsql';


-- //*[local-name() eq 'ГоловнойУчет']/@*[local-name() eq 'type']
-- select * from import.func_import_trans_xml('/workdir/rs_curr.xml')
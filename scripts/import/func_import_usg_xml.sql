CREATE OR REPLACE FUNCTION import.func_import_usg_xml(ptf text) RETURNS int AS
$$
DECLARE 
myxml xml;
i int := 0;
t int := 0;
BEGIN
myxml := XMLPARSE(DOCUMENT convert_from(pg_read_binary_file(ptf), 'UTF8'));


--InformationRegisterRecordSet.Потребление 2641711 records 2016-08-01T11:57:59-2019-07-31T23:59:59 2,2 G
-- DROP TABLE IF EXISTS import.Потребление; 
CREATE TABLE import.Потребление AS 
--INSERT INTO import.Потребление
SELECT 
    (xpath('//Recorder/text()', x))[1]::text AS Recorder
    ,(xpath('//Period/text()', x))[1]::text AS Period
    ,(xpath('//Active/text()', x))[1]::text AS Active 
    ,(xpath('//ТочкаУчета/text()', x))[1]::text AS ТочкаУчета
    ,(xpath('//Ставка/text()', x))[1]::text AS Ставка
    ,(xpath('//ТочкаУчетаСубАбонента/text()', x))[1]::text AS ТочкаУчетаСубАбонента
    ,(xpath('//Количество/text()', x))[1]::text AS Количество
    ,(xpath('//Договор/text()', x))[1]::text AS Договор  
    ,(xpath('//ДоговорПриемник/text()', x))[1]::text AS ДоговорПриемник
    ,(xpath('//ДатаОбхода/text()', x))[1]::text AS ДатаОбхода
    ,(xpath('//ТипРасчета/text()', x))[1]::text AS ТипРасчета  
    ,(xpath('//ДатаНач/text()', x))[1]::text AS ДатаНач
    ,(xpath('//ПоказанияНач/text()', x))[1]::text AS ПоказанияНач
    ,(xpath('//ДатаКон/text()', x))[1]::text AS ДатаКон
    ,(xpath('//ПоказанияКон/text()', x))[1]::text AS ПоказанияКон
    ,(xpath('//МетодСнятияПоказаний/text()', x))[1]::text AS МетодСнятияПоказаний
    ,(xpath('//ДатаПередачи/text()', x))[1]::text AS ДатаПередачи
    ,(xpath('//ДокументРегистратор/text()', x))[1]::text AS ДокументРегистратор
    ,(xpath('//Исполнен/text()', x))[1]::text AS Исполнен
    ,(xpath('//КоэфТН/text()', x))[1]::text AS КоэфТН
    ,(xpath('//КоэфТТ/text()', x))[1]::text AS КоэфТТ
    ,(xpath('//Круг/text()', x))[1]::text AS Круг
    ,(xpath('//НомерСтрокиДок/text()', x))[1]::text AS НомерСтрокиДок
    ,(xpath('//ПотериЛ/text()', x))[1]::text AS ПотериЛ
    ,(xpath('//ПотериТр/text()', x))[1]::text AS ПотериТр
    ,(xpath('//ТарифнаяГруппа/text()', x))[1]::text AS ТарифнаяГруппа
    ,(xpath('//Потребитель/text()', x))[1]::text AS Потребитель
    ,(xpath('//ПриборУчета/text()', x))[1]::text AS ПриборУчета
    ,(xpath('//ТрансформаторНапряжения/text()', x))[1]::text AS ТрансформаторНапряжения
    ,(xpath('//ТрансформаторТока/text()', x))[1]::text AS ТрансформаторТока
    ,(xpath('//ТочкаУчетаСхемыПодключения/text()', x))[1]::text AS ТочкаУчетаСхемыПодключения
    ,(xpath('//ОрганизацияИсточник/text()', x))[1]::text AS ОрганизацияИсточник
    ,(xpath('//ОрганизацияПриемник/text()', x))[1]::text AS ОрганизацияПриемник
    ,(xpath('//ПериодПерерасчета/text()', x))[1]::text AS ПериодПерерасчета
    ,(xpath('//СетевойУчасток/text()', x))[1]::text AS СетевойУчасток
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
FROM unnest(xpath('//InformationRegisterRecordSet.Потребление/Records/Record', myxml)) x;
SELECT count(*) FROM import.Потребление into i;
RAISE notice 'Потребление : %', i;
t=t+1;



--InformationRegisterRecordSet.СреднееПотребление
-- -- DROP TABLE IF EXISTS import.СреднееПотребление; 
-- CREATE TABLE import.СреднееПотребление AS 
-- -- INSERT INTO import.СреднееПотребление
-- SELECT 
--     ,(xpath('//Period/text()', x))[1]::text AS Period
--     ,(xpath('//ТочкаУчета/text()', x))[1]::text AS ТочкаУчета
--     ,(xpath('//Ставка/text()', x))[1]::text AS Ставка
--     ,(xpath('//ПриборУчета/text()', x))[1]::text AS ПриборУчета
--     ,(xpath('//Среднее/text()', x))[1]::text AS Среднее
--     ,(xpath('//Коэффициент/text()', x))[1]::text AS Коэффициент
--     ,(xpath('//СреднееСКоэффициентом/text()', x))[1]::text AS СреднееСКоэффициентом
--     ,(xpath('//КоличествоДней/text()', x))[1]::text AS КоличествоДней
--     ,(xpath('//Автор/text()', x))[1]::text AS Автор
--     ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
-- FROM unnest(xpath('//InformationRegisterRecordSet.СреднееПотребление/Records/Record', myxml)) x;
-- SELECT count(*) FROM import.СреднееПотребление into i;
-- RAISE notice 'СреднееПотребление : %', i;
-- t=t+1;



--InformationRegisterRecordSet.СреднееПотреблениеУсловно
-- -- DROP TABLE IF EXISTS import.СреднееПотреблениеУсловно; 
-- CREATE TABLE import.СреднееПотреблениеУсловно AS 
-- -- INSERT INTO import.СреднееПотреблениеУсловно
-- SELECT 
--     ,(xpath('//Period/text()', x))[1]::text AS Period
--     ,(xpath('//ТочкаУчета/text()', x))[1]::text AS ТочкаУчета
--     ,(xpath('//Ставка/text()', x))[1]::text AS Ставка
--     ,(xpath('//ПриборУчета/text()', x))[1]::text AS ПриборУчета
--     ,(xpath('//ПотреблениеПредыдущегоМесяца/text()', x))[1]::text AS ПотреблениеПредыдущегоМесяца
--     ,(xpath('//КоличествоДней/text()', x))[1]::text AS КоличествоДней
--     ,(xpath('//Автор/text()', x))[1]::text AS Автор
--     ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
-- FROM unnest(xpath('//InformationRegisterRecordSet.СреднееПотреблениеУсловно/Records/Record', myxml)) x;
-- SELECT count(*) FROM import.СреднееПотреблениеУсловно into i;
-- RAISE notice 'СреднееПотреблениеУсловно : %', i;
-- t=t+1;



--InformationRegisterRecordSet.СреднееПотреблениеПриСнятииПрибора
-- -- DROP TABLE IF EXISTS import.СреднееПотреблениеУсловно; 
-- CREATE TABLE import.СреднееПотреблениеУсловно AS 
-- -- INSERT INTO import.СреднееПотреблениеУсловно
-- SELECT 
--     ,(xpath('//ПриборУчета/text()', x))[1]::text AS ПриборУчета
--     
--
--     ,(xpath('//Автор/text()', x))[1]::text AS Автор
--     ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
-- FROM unnest(xpath('//InformationRegisterRecordSet.СреднееПотреблениеУсловно/Records/Record', myxml)) x;
-- SELECT count(*) FROM import.СреднееПотреблениеУсловно into i;
-- RAISE notice 'СреднееПотреблениеУсловно : %', i;
-- t=t+1;



return t;
END;
$$ LANGUAGE 'plpgsql';

-- //*[local-name() eq 'ГоловнойУчет']/@*[local-name() eq 'type']
-- select * from import.func_import_reg_xml('/workdir/Регистры сведений.xml')
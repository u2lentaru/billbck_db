CREATE OR REPLACE FUNCTION import.func_import_xml(ptf text) RETURNS int AS
$$
DECLARE 
myxml xml;
i int := 0;
t int := 0;
BEGIN
myxml := XMLPARSE(DOCUMENT convert_from(pg_read_binary_file(ptf), 'UTF8'));


-- АлгоритмРасчетаДолиПередачи
DROP TABLE IF EXISTS import.АлгоритмРасчетаДолиПередачи; 
CREATE TABLE import.АлгоритмРасчетаДолиПередачи AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.АлгоритмРасчетаДолиПередачи', myxml)) x;
SELECT count(*) FROM import.АлгоритмРасчетаДолиПередачи into i;
RAISE notice 'АлгоритмРасчетаДолиПередачи : %', i;
t=t+1;


-- Банки
DROP TABLE IF EXISTS import.Банки; 
CREATE TABLE import.Банки AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//IDБанка//text()', x))[1]::text AS IDБанка
    ,(xpath('//БИК/text()', x))[1]::text AS БИК
    ,(xpath('//КарточныйСчет/text()', x))[1]::text AS КарточныйСчет
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена
    ,(xpath('//КоррСчет/text()', x))[1]::text AS КоррСчет
    ,(xpath('//ЛитераДома/text()', x))[1]::text AS ЛитераДома
    ,(xpath('//НаименованиеКаз/text()', x))[1]::text AS НаименованиеКаз
    ,(xpath('//НаселенныйПункт/text()', x))[1]::text AS НаселенныйПункт
    ,(xpath('//НомерДома/text()', x))[1]::text AS НомерДома
    ,(xpath('//РНН/text()', x))[1]::text AS РНН
    ,(xpath('//Телефоны/text()', x))[1]::text AS Телефоны
    ,(xpath('//Улица/text()', x))[1]::text AS Улица
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.Банки', myxml)) x;
SELECT count(*) FROM import.Банки into i;
RAISE notice 'Банки : %', i;
t=t+1;


-- Валюты
DROP TABLE IF EXISTS import.Валюты; 
CREATE TABLE import.Валюты AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//НаименованиеПолное/text()', x))[1]::text AS НаименованиеПолное
    ,(xpath('//ПараметрыПрописиНаРусском/text()', x))[1]::text AS ПараметрыПрописиНаРусском
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.Валюты', myxml)) x;
SELECT count(*) FROM import.Валюты into i;
RAISE notice 'Валюты : %', i;
t=t+1;


-- ВидыДеятельности
DROP TABLE IF EXISTS import.ВидыДеятельности; 
CREATE TABLE import.ВидыДеятельности AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//IsFolder/text()', x))[1]::text AS IsFolder 
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Parent/text()', x))[1]::text AS Parent
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//ТипАбонента/text()', x))[1]::text AS ТипАбонента
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ВидыДеятельности', myxml)) x;
SELECT count(*) FROM import.ВидыДеятельности into i;
RAISE notice 'ВидыДеятельности : %', i;
t=t+1;


-- ВидыДохода
DROP TABLE IF EXISTS import.ВидыДохода; 
CREATE TABLE import.ВидыДохода AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//IsFolder/text()', x))[1]::text AS IsFolder 
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Parent/text()', x))[1]::text AS Parent
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ВидыДохода', myxml)) x;
SELECT count(*) FROM import.ВидыДохода into i;
RAISE notice 'ВидыДохода : %', i;
t=t+1;


-- ГрафикиРаботы
DROP TABLE IF EXISTS import.ГрафикиРаботы; 
CREATE TABLE import.ГрафикиРаботы AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//ВыходныеДни/text()', x))[1]::text AS ВыходныеДни
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,(xpath('//НерабочиеДни/text()', x))[1]::text AS НерабочиеДни
    ,(xpath('//РабочиеДни/text()', x))[1]::text AS РабочиеДни
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ГрафикиРаботы', myxml)) x;
SELECT count(*) FROM import.ГрафикиРаботы into i;
RAISE notice 'ГрафикиРаботы : %', i;
t=t+1;


-- ГруппыПотребления
DROP TABLE IF EXISTS import.ГруппыПотребления; 
CREATE TABLE import.ГруппыПотребления AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена
    ,(xpath('//ОсновнаяТарифнаяГруппа/text()', x))[1]::text AS ОсновнаяТарифнаяГруппа
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ГруппыПотребления', myxml)) x;
SELECT count(*) FROM import.ГруппыПотребления into i;
RAISE notice 'ГруппыПотребления : %', i;
t=t+1;


-- Договоры
DROP TABLE IF EXISTS import.Договоры; 
CREATE TABLE import.Договоры AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//АдресПоДоговору/text()', x))[1]::text AS АдресПоДоговору
    ,(xpath('//ГруппаПотребления/text()', x))[1]::text AS ГруппаПотребления
    ,(xpath('//ДатаЗакрытия/text()', x))[1]::text AS ДатаЗакрытия
    ,(xpath('//ДатаОткрытия/text()', x))[1]::text AS ДатаОткрытия
    ,(xpath('//ДоговорЭСО/text()', x))[1]::text AS ДоговорЭСО
    ,(xpath('//ДолжностьОтветственногоДоговора/text()', x))[1]::text AS ДолжностьОтветственногоДоговора
    ,(xpath('//ЗарегистрированВИнтернете/text()', x))[1]::text AS ЗарегистрированВИнтернете
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена
    ,(xpath('//КоличествоДомов/text()', x))[1]::text AS КоличествоДомов
    ,(xpath('//НаименованиеПоДоговору/text()', x))[1]::text AS НаименованиеПоДоговору
    ,(xpath('//НеВключатьВНаряд/text()', x))[1]::text AS НеВключатьВНаряд
    ,(xpath('//Опасность/text()', x))[1]::text AS Опасность
    ,(xpath('//Организация/text()', x))[1]::text AS Организация
    ,(xpath('//ОтветственныйДоговора/text()', x))[1]::text AS ОтветственныйДоговора
    ,(xpath('//Потребитель/text()', x))[1]::text AS Потребитель
    ,(xpath('//ПричинаЗакрытия/text()', x))[1]::text AS ПричинаЗакрытия
    ,(xpath('//РайонГорода/text()', x))[1]::text AS РайонГорода
    ,(xpath('//РасчетныйСчет/text()', x))[1]::text AS РасчетныйСчет
    ,(xpath('//СетевойУчасток/text()', x))[1]::text AS СетевойУчасток
    ,(xpath('//СигнальноеСообщение/text()', x))[1]::text AS СигнальноеСообщение
    ,(xpath('//ТипДоговора/text()', x))[1]::text AS ТипДоговора
    ,(xpath('//ЭСО/text()', x))[1]::text AS ЭСО
    ,(xpath('//Комментарий/text()', x))[1]::text AS Комментарий
    ,(xpath('//КоличествоКвартир/text()', x))[1]::text AS КоличествоКвартир
    ,(xpath('//ДатаРегистрации/text()', x))[1]::text AS ДатаРегистрации
    ,(xpath('//ДатаДеактивации/text()', x))[1]::text AS ДатаДеактивации
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.Договоры', myxml)) x;
SELECT count(*) FROM import.Договоры into i;
RAISE notice 'Договоры : %', i;
t=t+1;


-- Должности
DROP TABLE IF EXISTS import.Должности; 
CREATE TABLE import.Должности AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена
    ,(xpath('//ПолучаетНаряды/text()', x))[1]::text AS ПолучаетНаряды
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.Должности', myxml)) x;
SELECT count(*) FROM import.Должности into i;
RAISE notice 'Должности : %', i;
t=t+1;


-- ДолжностиКонтактныхЛиц
DROP TABLE IF EXISTS import.ДолжностиКонтактныхЛиц; 
CREATE TABLE import.ДолжностиКонтактныхЛиц AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ДолжностиКонтактныхЛиц', myxml)) x;
SELECT count(*) FROM import.ДолжностиКонтактныхЛиц into i;
RAISE notice 'ДолжностиКонтактныхЛиц : %', i;
t=t+1;


-- ЕдиницыИзмерения
DROP TABLE IF EXISTS import.ЕдиницыИзмерения; 
CREATE TABLE import.ЕдиницыИзмерения AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ЕдиницыИзмерения', myxml)) x;
SELECT count(*) FROM import.ЕдиницыИзмерения into i;
RAISE notice 'ЕдиницыИзмерения : %', i;
t=t+1;


-- Здания
DROP TABLE IF EXISTS import.Здания; 
CREATE TABLE import.Здания AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Owner/text()', x))[1]::text AS Owner
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//ДатаПриемаНаБаланс/text()', x))[1]::text AS ДатаПриемаНаБаланс
    ,(xpath('//ДатаСнятияСБаланса/text()', x))[1]::text AS ДатаСнятияСБаланса
    ,(xpath('//ЕстьТабличкаНаДоме/text()', x))[1]::text AS ЕстьТабличкаНаДоме
    ,(xpath('//ЖилойФонд/text()', x))[1]::text AS ЖилойФонд
    ,(xpath('//Индекс/text()', x))[1]::text AS Индекс
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена
    ,(xpath('//Литера/text()', x))[1]::text AS Литера
    ,(xpath('//НомерДома/text()', x))[1]::text AS НомерДома
    ,(xpath('//ПорядковыйНомер/text()', x))[1]::text AS ПорядковыйНомер
    ,(xpath('//Сектор/text()', x))[1]::text AS Сектор
    ,(xpath('//ТипЗастройки/text()', x))[1]::text AS ТипЗастройки
    ,(xpath('//ТипОтопления/text()', x))[1]::text AS ТипОтопления
    ,(xpath('//ТипРазбивки/text()', x))[1]::text AS ТипРазбивки
    ,(xpath('//Этажность/text()', x))[1]::text AS Этажность
    ,(xpath('//Контролер/text()', x))[1]::text AS Контролер
    ,(xpath('//СекторЮЛ/text()', x))[1]::text AS СекторЮЛ
    ,(xpath('//ПрежнийАдрес/text()', x))[1]::text AS ПрежнийАдрес
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.Здания', myxml)) x;
SELECT count(*) FROM import.Здания into i;
RAISE notice 'Здания : %', i;
t=t+1;


-- ЗначенияСвойствОбъектов
DROP TABLE IF EXISTS import.ЗначенияСвойствОбъектов; 
CREATE TABLE import.ЗначенияСвойствОбъектов AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ЗначенияСвойствОбъектов', myxml)) x;
SELECT count(*) FROM import.ЗначенияСвойствОбъектов into i;
RAISE notice 'ЗначенияСвойствОбъектов : %', i;
t=t+1;


-- КатегорииНадежности
DROP TABLE IF EXISTS import.КатегорииНадежности; 
CREATE TABLE import.КатегорииНадежности AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.КатегорииНадежности', myxml)) x;
SELECT count(*) FROM import.КатегорииНадежности into i;
RAISE notice 'КатегорииНадежности : %', i;
t=t+1;


-- КлассыНапряжения
DROP TABLE IF EXISTS import.КлассыНапряжения; 
CREATE TABLE import.КлассыНапряжения AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.КлассыНапряжения', myxml)) x;
SELECT count(*) FROM import.КлассыНапряжения into i;
RAISE notice 'КлассыНапряжения : %', i;
t=t+1;


-- КодыДляОбмена
DROP TABLE IF EXISTS import.КодыДляОбмена; 
CREATE TABLE import.КодыДляОбмена AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбменаНовый/text()', x))[1]::text AS КодДляОбменаНовый
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.КодыДляОбмена', myxml)) x;
SELECT count(*) FROM import.КодыДляОбмена into i;
RAISE notice 'КодыДляОбмена : %', i;
t=t+1;


-- Комментарии
DROP TABLE IF EXISTS import.Комментарии; 
CREATE TABLE import.Комментарии AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена
    ,(xpath('//ОбязательнаяФотофиксация/text()', x))[1]::text AS ОбязательнаяФотофиксация
    ,(xpath('//НеТребуетсяВводПоказаний/text()', x))[1]::text AS НеТребуетсяВводПоказаний
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.Комментарии', myxml)) x;
SELECT count(*) FROM import.Комментарии into i;
RAISE notice 'Комментарии : %', i;
t=t+1;


-- КонтактныеЛица
DROP TABLE IF EXISTS import.КонтактныеЛица; 
CREATE TABLE import.КонтактныеЛица AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//ДатаРождения/text()', x))[1]::text AS ДатаРождения
    ,(xpath('//Должность/text()', x))[1]::text AS Должность
    ,(xpath('//ДополнительнаяИнформация/text()', x))[1]::text AS ДополнительнаяИнформация
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена
    ,(xpath('//ПредпочтительноеОбращение/text()', x))[1]::text AS ПредпочтительноеОбращение
    ,(xpath('//ТелефонДомашний/text()', x))[1]::text AS ТелефонДомашний
    ,(xpath('//ТелефонМобильный/text()', x))[1]::text AS ТелефонМобильный
    ,(xpath('//ТелефонПриемной/text()', x))[1]::text AS ТелефонПриемной
    ,(xpath('//Телефоны/text()', x))[1]::text AS Телефоны
    ,(xpath('//Факс/text()', x))[1]::text AS Факс
    ,(xpath('//ЭлектроннаяПочта/text()', x))[1]::text AS ЭлектроннаяПочта
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.КонтактныеЛица', myxml)) x;
SELECT count(*) FROM import.КонтактныеЛица into i;
RAISE notice 'КонтактныеЛица : %', i;
t=t+1;


-- КПК
DROP TABLE IF EXISTS import.КПК; 
CREATE TABLE import.КПК AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//НомерТелефона/text()', x))[1]::text AS НомерТелефона
    ,(xpath('//IMEI/text()', x))[1]::text AS IMEI
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.КПК', myxml)) x;
SELECT count(*) FROM import.КПК into i;
RAISE notice 'КПК : %', i;
t=t+1;


-- МестаРаботы
DROP TABLE IF EXISTS import.МестаРаботы; 
CREATE TABLE import.МестаРаботы AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.МестаРаботы', myxml)) x;
SELECT count(*) FROM import.МестаРаботы into i;
RAISE notice 'МестаРаботы : %', i;
t=t+1;


-- МестаУстановкиПломб
DROP TABLE IF EXISTS import.МестаУстановкиПломб; 
CREATE TABLE import.МестаУстановкиПломб AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена
    ,(xpath('//НаПрибореУчета/text()', x))[1]::text AS НаПрибореУчета
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.МестаУстановкиПломб', myxml)) x;
SELECT count(*) FROM import.МестаУстановкиПломб into i;
RAISE notice 'МестаУстановкиПломб : %', i;
t=t+1;


-- МестаУстановкиПриборов
DROP TABLE IF EXISTS import.МестаУстановкиПриборов; 
CREATE TABLE import.МестаУстановкиПриборов AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена
    ,(xpath('//КраткоеНаименование/text()', x))[1]::text AS КраткоеНаименование
    ,(xpath('//НормаОбхода/text()', x))[1]::text AS НормаОбхода
    ,(xpath('//НормаОбходаБазовая/text()', x))[1]::text AS НормаОбходаБазовая
    ,(xpath('//НетПроверятьНормы/text()', x))[1]::text AS НетПроверятьНормы
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.МестаУстановкиПриборов', myxml)) x;
SELECT count(*) FROM import.МестаУстановкиПриборов into i;
RAISE notice 'МестаУстановкиПриборов : %', i;
t=t+1;


-- МетодыРасчетаПотерьПоЗонамСуток
DROP TABLE IF EXISTS import.МетодыРасчетаПотерьПоЗонамСуток; 
CREATE TABLE import.МетодыРасчетаПотерьПоЗонамСуток AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.МетодыРасчетаПотерьПоЗонамСуток', myxml)) x;
SELECT count(*) FROM import.МетодыРасчетаПотерьПоЗонамСуток into i;
RAISE notice 'МетодыРасчетаПотерьПоЗонамСуток : %', i;
t=t+1;


-- МетодыСменыТарифа
DROP TABLE IF EXISTS import.МетодыСменыТарифа; 
CREATE TABLE import.МетодыСменыТарифа AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.МетодыСменыТарифа', myxml)) x;
SELECT count(*) FROM import.МетодыСменыТарифа into i;
RAISE notice 'МетодыСменыТарифа : %', i;
t=t+1;


-- МетодыСнятияПоказанийИПотребления
DROP TABLE IF EXISTS import.МетодыСнятияПоказанийИПотреблен; 
CREATE TABLE import.МетодыСнятияПоказанийИПотреблен AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//ДляПотребления/text()', x))[1]::text AS ДляПотребления
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена
    ,(xpath('//ТипРасчетаПоУмолчанию/text()', x))[1]::text AS ТипРасчетаПоУмолчанию
    ,(xpath('//РегистрОтключений/text()', x))[1]::text AS РегистрОтключений
    ,(xpath('//ФактическоеПоказание/text()', x))[1]::text AS ФактическоеПоказание
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.МетодыСнятияПоказанийИПотреблен', myxml)) x;
SELECT count(*) FROM import.МетодыСнятияПоказанийИПотреблен into i;
RAISE notice 'МетодыСнятияПоказанийИПотреблен : %', i;
t=t+1;


-- НаименованияОбъектовУчетаДляОтчетаФактическийБалансПоставкиПотребленияЭЭ
DROP TABLE IF EXISTS import.НаименованияОбъектовУчетаДляОтч; 
CREATE TABLE import.НаименованияОбъектовУчетаДляОтч AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.НаименованияОбъектовУчетаДляОтч', myxml)) x;
SELECT count(*) FROM import.НаименованияОбъектовУчетаДляОтч into i;
RAISE notice 'НаименованияОбъектовУчетаДляОтч : %', i;
t=t+1;


-- НаименованияПоказателейФактическийБалансПоставкиПотребленияЭлектроэнергии
DROP TABLE IF EXISTS import.НаименованияПоказателейФактичес; 
CREATE TABLE import.НаименованияПоказателейФактичес AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена
    ,(xpath('//НомерРаздела/text()', x))[1]::text AS НомерРаздела
    ,(xpath('//Раздел/text()', x))[1]::text AS Раздел
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.НаименованияПоказателейФактичес', myxml)) x;
SELECT count(*) FROM import.НаименованияПоказателейФактичес into i;
RAISE notice 'НаименованияПоказателейФактичес : %', i;
t=t+1;


-- НаселенныеПункты
DROP TABLE IF EXISTS import.НаселенныеПункты; 
CREATE TABLE import.НаселенныеПункты AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//Казакша/text()', x))[1]::text AS Казакша
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена
    ,(xpath('//МеждународныйТелефонныйКод/text()', x))[1]::text AS МеждународныйТелефонныйКод
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.НаселенныеПункты', myxml)) x;
SELECT count(*) FROM import.НаселенныеПункты into i;
RAISE notice 'НаселенныеПункты : %', i;
t=t+1;


-- Организации
DROP TABLE IF EXISTS import.Организации; 
CREATE TABLE import.Организации AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//БИН/text()', x))[1]::text AS БИН
    ,(xpath('//ГоловнаяОрганизация/text()', x))[1]::text AS ГоловнаяОрганизация
    ,(xpath('//ДатаСвидетельстваПоНДС/text()', x))[1]::text AS ДатаСвидетельстваПоНДС
    ,(xpath('//ИспользоватьВАвансовыхПлатежах/text()', x))[1]::text AS ИспользоватьВАвансовыхПлатежах
    ,(xpath('//КБЕ/text()', x))[1]::text AS КБЕ
    ,(xpath('//КНП/text()', x))[1]::text AS КНП
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена
    ,(xpath('//КодПоОКПО/text()', x))[1]::text AS КодПоОКПО
    ,(xpath('//Логотип/text()', x))[1]::text AS Логотип
    ,(xpath('//НаименованиеДляБанка/text()', x))[1]::text AS НаименованиеДляБанка
    ,(xpath('//НаименованиеПолное/text()', x))[1]::text AS НаименованиеПолное
    ,(xpath('//НаименованиеПолноеKz/text()', x))[1]::text AS НаименованиеПолноеKz
    ,(xpath('//НомерСвидетельстваПоНДС/text()', x))[1]::text AS НомерСвидетельстваПоНДС
    ,(xpath('//ОсновнойРасчетныйСчет/text()', x))[1]::text AS ОсновнойРасчетныйСчет
    ,(xpath('//ОсновнойТипДоговора/text()', x))[1]::text AS ОсновнойТипДоговора
    ,(xpath('//ПочтовыйИндекс/text()', x))[1]::text AS ПочтовыйИндекс
    ,(xpath('//Префикс/text()', x))[1]::text AS Префикс
    ,(xpath('//РНН/text()', x))[1]::text AS РНН
    ,(xpath('//СерияСвидетельстваПоНДС/text()', x))[1]::text AS СерияСвидетельстваПоНДС
    ,(xpath('//Сторонняя/text()', x))[1]::text AS Сторонняя
    ,(xpath('//СчетЗакрытияДтКт/text()', x))[1]::text AS СчетЗакрытияДтКт
    ,(xpath('//ШапкаБланка/text()', x))[1]::text AS ШапкаБланка
    ,(xpath('//ЮридическийАдрес/text()', x))[1]::text AS ЮридическийАдрес
    ,(xpath('//ЮридическийАдресKz/text()', x))[1]::text AS ЮридическийАдресKz
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.Организации', myxml)) x;
SELECT count(*) FROM import.Организации into i;
RAISE notice 'Организации : %', i;
t=t+1;


-- Основания
DROP TABLE IF EXISTS import.Основания; 
CREATE TABLE import.Основания AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.Основания', myxml)) x;
SELECT count(*) FROM import.Основания into i;
RAISE notice 'Основания : %', i;
t=t+1;


-- ОтветственныеЛицаОрганизаций
DROP TABLE IF EXISTS import.ОтветственныеЛицаОрганизаций; 
CREATE TABLE import.ОтветственныеЛицаОрганизаций AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ОтветственныеЛицаОрганизаций', myxml)) x;
SELECT count(*) FROM import.ОтветственныеЛицаОрганизаций into i;
RAISE notice 'ОтветственныеЛицаОрганизаций : %', i;
t=t+1;


-- Отделения
DROP TABLE IF EXISTS import.Отделения; 
CREATE TABLE import.Отделения AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//Адрес/text()', x))[1]::text AS Адрес
    ,(xpath('//Индекс/text()', x))[1]::text AS Индекс
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена
    ,(xpath('//Область/text()', x))[1]::text AS Область
    ,(xpath('//Организация/text()', x))[1]::text AS Организация
    ,(xpath('//Телефон/text()', x))[1]::text AS КодДлТелефоняОбмена
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.Отделения', myxml)) x;
SELECT count(*) FROM import.Отделения into i;
RAISE notice 'Отделения : %', i;
t=t+1;


-- Отделы
DROP TABLE IF EXISTS import.Отделы; 
CREATE TABLE import.Отделы AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена
    ,(xpath('//Организация/text()', x))[1]::text AS Организация
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.Отделы', myxml)) x;
SELECT count(*) FROM import.Отделы into i;
RAISE notice 'Отделы : %', i;
t=t+1;


-- ПеременныеОтчета
DROP TABLE IF EXISTS import.ПеременныеОтчета; 
CREATE TABLE import.ПеременныеОтчета AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,(xpath('//Языки/text()', x))[1]::text AS Языки
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ПеременныеОтчета', myxml)) x;
SELECT count(*) FROM import.ПеременныеОтчета into i;
RAISE notice 'ПеременныеОтчета : %', i;
t=t+1;


-- Пломбы
DROP TABLE IF EXISTS import.Пломбы; 
CREATE TABLE import.Пломбы AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//ДатаВыдачи/text()', x))[1]::text AS ДатаВыдачи
    ,(xpath('//ДатаУстановки/text()', x))[1]::text AS ДатаУстановки
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена
    ,(xpath('//Комментарий/text()', x))[1]::text AS Комментарий
    ,(xpath('//МестоУстановкиПломбы/text()', x))[1]::text AS МестоУстановкиПломбы
    ,(xpath('//Основание/text()', x))[1]::text AS Основание
    ,(xpath('//Пачка/text()', x))[1]::text AS Пачка
    ,(xpath('//ТипПломбы/text()', x))[1]::text AS ТипПломбы
    ,(xpath('//ЦветПломбы/text()', x))[1]::text AS ЦветПломбы 
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.Пломбы', myxml)) x;
SELECT count(*) FROM import.Пломбы into i;
RAISE notice 'Пломбы : %', i;
t=t+1;


-- Подстанции
DROP TABLE IF EXISTS import.Подстанции; 
-- CREATE TEMP TABLE import.pds AS 
CREATE TABLE import.Подстанции AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//ИнвентарныйНомер/text()', x))[1]::text AS ИнвентарныйНомер
    ,(xpath('//КлассНапряженияВход/text()', x))[1]::text AS КлассНапряженияВход
    ,(xpath('//КлассНапряженияВыход1/text()', x))[1]::text AS КлассНапряженияВыход1
    ,(xpath('//КлассНапряженияВыход2/text()', x))[1]::text AS КлассНапряженияВыход2
    ,(xpath('//КлассНапряженияВыход3/text()', x))[1]::text AS КлассНапряженияВыход3
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена
    ,(xpath('//ТипПрисоединенияПС/text()', x))[1]::text AS ТипПрисоединенияПС
    ,(xpath('//СторонняяПС/text()', x))[1]::text AS СторонняяПС
    ,(xpath('//РасчетДолиПередачиВнеш/text()', x))[1]::text AS РасчетДолиПередачиВнеш
    ,(xpath('//ПроцентВнеш/text()', x))[1]::text AS ПроцентВнеш
    ,(xpath('//ПрименятьПроцентВнеш/text()', x))[1]::text AS ПрименятьПроцентВнеш
    ,(xpath('//РасчетДолиПередачиВнутр/text()', x))[1]::text AS РасчетДолиПередачиВнутр
    ,(xpath('//ПроцентВнутр/text()', x))[1]::text AS ПроцентВнутр
    ,(xpath('//ПрименятьПроцентВнутр/text()', x))[1]::text AS ПрименятьПроцентВнутр
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.Подстанции', myxml)) x;
SELECT count(*) FROM import.Подстанции into i;
RAISE notice 'Подстанции : %', i;
t=t+1;


-- Пользователи
DROP TABLE IF EXISTS import.Пользователи; 
CREATE TABLE import.Пользователи AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//ДополнительныеПрава/text()', x))[1]::text AS ДополнительныеПрава
    ,(xpath('//ЗвуковоеУведомлениеПриПолучении/text()', x))[1]::text AS ЗвуковоеУведомлениеПриПолучении
    ,(xpath('//Кабинет/text()', x))[1]::text AS Кабинет
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена
    ,(xpath('//КомментироватьДействия/text()', x))[1]::text AS КомментироватьДействия
    ,(xpath('//ОткрыватьПриЗапускеРабочийСтол/text()', x))[1]::text AS СторонняяПС
    ,(xpath('//ПредопределенныйТипОбслуживания/text()', x))[1]::text AS ПредопределенныйТипОбслуживания
    ,(xpath('//ПредопределенныйТипУслуги/text()', x))[1]::text AS ПредопределенныйТипУслуги
    ,(xpath('//СообщатьОПредписании/text()', x))[1]::text AS СообщатьОПредписании
    ,(xpath('//Сотрудник/text()', x))[1]::text AS Сотрудник
    ,(xpath('//Телефон/text()', x))[1]::text AS Телефон
    ,(xpath('//УчитыватьСетевойУчасток/text()', x))[1]::text AS УчитыватьСетевойУчасток
    ,(xpath('//УчитыватьТипУслуги/text()', x))[1]::text AS УчитыватьТипУслуги
    ,(xpath('//ЭлектронныйАдрес/text()', x))[1]::text AS ЭлектронныйАдрес
    ,(xpath('//Количество/text()', x))[1]::text AS Количество
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.Пользователи', myxml)) x;
SELECT count(*) FROM import.Пользователи into i;
RAISE notice 'Пользователи : %', i;
t=t+1;


-- ПриборыУчета
DROP TABLE IF EXISTS import.ПриборыУчета; 
CREATE TABLE import.ПриборыУчета AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//ГосПломба/text()', x))[1]::text AS ГосПломба
    ,(xpath('//ГосПломба2/text()', x))[1]::text AS ГосПломба2
    ,(xpath('//ГосПломба3/text()', x))[1]::text AS ГосПломба3
    ,(xpath('//ДатаПоверки/text()', x))[1]::text AS ДатаПоверки
    ,(xpath('//ДатаИзготовления/text()', x))[1]::text AS ДатаИзготовления
    ,(xpath('//ДатаСледующейПоверки/text()', x))[1]::text AS ДатаСледующейПоверки
    ,(xpath('//Завод/text()', x))[1]::text AS Завод
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена
    ,(xpath('//ТипГосПломбы/text()', x))[1]::text AS ТипГосПломбы
    ,(xpath('//ТипПрибора/text()', x))[1]::text AS ТипПрибора
    ,(xpath('//ТехническийУчет/text()', x))[1]::text AS ТехническийУчет
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ПриборыУчета', myxml)) x;
SELECT count(*) FROM import.ПриборыУчета into i;
RAISE notice 'ПриборыУчета : %', i;
t=t+1;


-- ПрименятьПроцент
DROP TABLE IF EXISTS import.ПрименятьПроцент; 
CREATE TABLE import.ПрименятьПроцент AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ПрименятьПроцент', myxml)) x;
SELECT count(*) FROM import.ПрименятьПроцент into i;
RAISE notice 'ПрименятьПроцент : %', i;
t=t+1;


-- ПримечанияКПотреблению
DROP TABLE IF EXISTS import.ПримечанияКПотреблению; 
CREATE TABLE import.ПримечанияКПотреблению AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ПримечанияКПотреблению', myxml)) x;
SELECT count(*) FROM import.ПримечанияКПотреблению into i;
RAISE notice 'ПримечанияКПотреблению : %', i;
t=t+1;


-- ПричинаВыдачиТУ
DROP TABLE IF EXISTS import.ПричинаВыдачиТУ; 
CREATE TABLE import.ПричинаВыдачиТУ AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ПричинаВыдачиТУ', myxml)) x;
SELECT count(*) FROM import.ПричинаВыдачиТУ into i;
RAISE notice 'ПричинаВыдачиТУ : %', i;
t=t+1;


-- ПричиныЗакрытияКарточек
DROP TABLE IF EXISTS import.ПричиныЗакрытияКарточек; 
CREATE TABLE import.ПричиныЗакрытияКарточек AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ПричиныЗакрытияКарточек', myxml)) x;
SELECT count(*) FROM import.ПричиныЗакрытияКарточек into i;
RAISE notice 'ПричиныЗакрытияКарточек : %', i;
t=t+1;


-- ПричиныСписанияПриборовУчета
DROP TABLE IF EXISTS import.ПричиныСписанияПриборовУчета; 
CREATE TABLE import.ПричиныСписанияПриборовУчета AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ПричиныСписанияПриборовУчета', myxml)) x;
SELECT count(*) FROM import.ПричиныСписанияПриборовУчета into i;
RAISE notice 'ПричиныСписанияПриборовУчета : %', i;
t=t+1;


-- РазделыПоказателей
DROP TABLE IF EXISTS import.РазделыПоказателей; 
CREATE TABLE import.РазделыПоказателей AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.РазделыПоказателей', myxml)) x;
SELECT count(*) FROM import.РазделыПоказателей into i;
RAISE notice 'РазделыПоказателей : %', i;
t=t+1;


-- РайоныГорода
DROP TABLE IF EXISTS import.РайоныГорода; 
CREATE TABLE import.РайоныГорода AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//ДниЗаявок/text()', x))[1]::text AS ДниЗаявок 
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена
    ,(xpath('//МаксимальноеКоличествоЗаявокНаД/text()', x))[1]::text AS МаксимальноеКоличествоЗаявокНаД
    ,(xpath('//НаименованиеБригады/text()', x))[1]::text AS НаименованиеБригады
    ,(xpath('//НаселенныйПункт/text()', x))[1]::text AS НаселенныйПункт
    ,(xpath('//ПрефиксДоговораФЛ/text()', x))[1]::text AS ПрефиксДоговораФЛ
    ,(xpath('//ПрефиксДоговораЮЛ/text()', x))[1]::text AS ПрефиксДоговораЮЛ
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.РайоныГорода', myxml)) x;
SELECT count(*) FROM import.РайоныГорода into i;
RAISE notice 'РайоныГорода : %', i;
t=t+1;


-- РасчетПроцентаПС
DROP TABLE IF EXISTS import.РасчетПроцентаПС; 
CREATE TABLE import.РасчетПроцентаПС AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.РасчетПроцентаПС', myxml)) x;
SELECT count(*) FROM import.РасчетПроцентаПС into i;
RAISE notice 'РасчетПроцентаПС : %', i;
t=t+1;


-- Сектора
DROP TABLE IF EXISTS import.Сектора; 
CREATE TABLE import.Сектора AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//ТипРазбивки/text()', x))[1]::text AS ТипРазбивки 
    ,(xpath('//ДниЗаявок/text()', x))[1]::text AS ДниЗаявок 
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена
    ,(xpath('//МаксимальноеКоличествоЗаявокНаД/text()', x))[1]::text AS МаксимальноеКоличествоЗаявокНаД
    ,(xpath('//РабочийДень/text()', x))[1]::text AS РабочийДень
    ,(xpath('//РайонГорода/text()', x))[1]::text AS РайонГорода
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.Сектора', myxml)) x;
SELECT count(*) FROM import.Сектора into i;
RAISE notice 'Сектора : %', i;
t=t+1;


-- СетевыеУчастки
DROP TABLE IF EXISTS import.СетевыеУчастки; 
CREATE TABLE import.СетевыеУчастки AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//АдресЭПО/text()', x))[1]::text AS АдресЭПО 
    ,(xpath('//АдресЭСО/text()', x))[1]::text AS АдресЭСО 
    ,(xpath('//БратьБезучетниковВНарядПоПУ/text()', x))[1]::text AS БратьБезучетниковВНарядПоПУ 
    ,(xpath('//ГлавныйИнженер/text()', x))[1]::text AS ДниЗаяГлавныйИнженервок 
    ,(xpath('//ДниЗаявок/text()', x))[1]::text AS ДниЗаявок 
    ,(xpath('//ДоговораЧастногоСектора/text()', x))[1]::text AS ДоговораЧастногоСектора 
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена
    ,(xpath('//КодУчастка/text()', x))[1]::text AS КодУчастка
    ,(xpath('//КонтролерыИУчастки/text()', x))[1]::text AS КонтролерыИУчастки
    ,(xpath('//МаксимальноеКоличествоЗаявокНаД/text()', x))[1]::text AS МаксимальноеКоличествоЗаявокНаД
    ,(xpath('//МестоРасположения/text()', x))[1]::text AS МестоРасположения
    ,(xpath('//НеВыводитьНаселенныйПункт/text()', x))[1]::text AS НеВыводитьНаселенныйПункт
    ,(xpath('//НомерДоговораЧастногоСектора/text()', x))[1]::text AS НомерДоговораЧастногоСектора
    ,(xpath('//Отделение/text()', x))[1]::text AS Отделение
    ,(xpath('//ПрефиксДоговораФЛ/text()', x))[1]::text AS ПрефиксДоговораФЛ
    ,(xpath('//ПрефиксДоговораЮЛ/text()', x))[1]::text AS ПрефиксДоговораЮЛ
    ,(xpath('//ПрефиксСчетФактуры/text()', x))[1]::text AS ПрефиксСчетФактуры
    ,(xpath('//РазбиватьПоТП/text()', x))[1]::text AS РазбиватьПоТП
    ,(xpath('//РежимРаботыЭСО/text()', x))[1]::text AS РежимРаботыЭСО
    ,(xpath('//Руководитель/text()', x))[1]::text AS Руководитель
    ,(xpath('//СтаршийБухгалтер/text()', x))[1]::text AS СтаршийБухгалтер
    ,(xpath('//СтаршийДиспетчер/text()', x))[1]::text AS СтаршийДиспетчер
    ,(xpath('//ТелефонЭПО/text()', x))[1]::text AS ТелефонЭПО
    ,(xpath('//ТелефонЭСО/text()', x))[1]::text AS ТелефонЭСО
    ,(xpath('//ФормироватьЕдиныйНарядПоЗаявкам/text()', x))[1]::text AS ФормироватьЕдиныйНарядПоЗаявкам
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,(xpath('//ТелефоныДляАвтодозвона/text()', x))[1]::text AS ТелефоныДляАвтодозвона
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.СетевыеУчастки', myxml)) x;
SELECT count(*) FROM import.СетевыеУчастки into i;
RAISE notice 'СетевыеУчастки : %', i;
t=t+1;


-- СиловыеТрансформаторы
DROP TABLE IF EXISTS import.СиловыеТрансформаторы; 
CREATE TABLE import.СиловыеТрансформаторы AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//ТипПрибора/text()', x))[1]::text AS ТипПрибора  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.СиловыеТрансформаторы', myxml)) x;
SELECT count(*) FROM import.СиловыеТрансформаторы into i;
RAISE notice 'СиловыеТрансформаторы : %', i;
t=t+1;


-- Соискатели
DROP TABLE IF EXISTS import.Соискатели; 
CREATE TABLE import.Соискатели AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//РНН/text()', x))[1]::text AS РНН  
    ,(xpath('//ЭтоФизЛицо/text()', x))[1]::text AS ЭтоФизЛицо  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.Соискатели', myxml)) x;
SELECT count(*) FROM import.Соискатели into i;
RAISE notice 'Соискатели : %', i;
t=t+1;


-- СопротивлениеКабелей
DROP TABLE IF EXISTS import.СопротивлениеКабелей; 
CREATE TABLE import.СопротивлениеКабелей AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//ТипМатериала/text()', x))[1]::text AS ТипМатериала  
    ,(xpath('//Сопротивление/text()', x))[1]::text AS Сопротивление  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.СопротивлениеКабелей', myxml)) x;
SELECT count(*) FROM import.СопротивлениеКабелей into i;
RAISE notice 'СопротивлениеКабелей : %', i;
t=t+1;


-- Сотрудники
DROP TABLE IF EXISTS import.Сотрудники; 
CREATE TABLE import.Сотрудники AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//ДатаПриемаНаРаботу/text()', x))[1]::text AS ДатаПриемаНаРаботу  
    ,(xpath('//ДатаРождения/text()', x))[1]::text AS ДатаРождения  
    ,(xpath('//ДатаУвольнения/text()', x))[1]::text AS ДатаУвольнения  
    ,(xpath('//Должность/text()', x))[1]::text AS Должность  
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//НаселенныйПункт/text()', x))[1]::text AS НаселенныйПункт  
    ,(xpath('//Организация/text()', x))[1]::text AS Организация  
    ,(xpath('//СетевойУчасток/text()', x))[1]::text AS СетевойУчасток  
    ,(xpath('//ТабельныйНомер/text()', x))[1]::text AS ТабельныйНомер  
    ,(xpath('//ТелефонРабочий/text()', x))[1]::text AS ТелефонРабочий  
    ,(xpath('//ФизическоеЛицо/text()', x))[1]::text AS ФизическоеЛицо  
    ,(xpath('//Отдел/text()', x))[1]::text AS Отдел  
    ,(xpath('//ПремироватьПоФЛ/text()', x))[1]::text AS ПремироватьПоФЛ  
    ,(xpath('//ПремироватьПоЮЛ/text()', x))[1]::text AS ПремироватьПоЮЛ  
    ,(xpath('//Службы/text()', x))[1]::text AS Службы  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.Сотрудники', myxml)) x;
SELECT count(*) FROM import.Сотрудники into i;
RAISE notice 'Сотрудники : %', i;
t=t+1;


-- СтавкиПриборовУчета
DROP TABLE IF EXISTS import.СтавкиПриборовУчета; 
CREATE TABLE import.СтавкиПриборовУчета AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//ВремяНачало/text()', x))[1]::text AS ВремяНачало  
    ,(xpath('//ВремяОкончание/text()', x))[1]::text AS ВремяОкончание  
    ,(xpath('//КоличествоЧасов/text()', x))[1]::text AS КоличествоЧасов  
    ,(xpath('//Реактив/text()', x))[1]::text AS Реактив  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.СтавкиПриборовУчета', myxml)) x;
SELECT count(*) FROM import.СтавкиПриборовУчета into i;
RAISE notice 'СтавкиПриборовУчета : %', i;
t=t+1;


-- СтадииАкта
DROP TABLE IF EXISTS import.СтадииАкта; 
CREATE TABLE import.СтадииАкта AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//ГотовДляПередачиВЭСО/text()', x))[1]::text AS ГотовДляПередачиВЭСО  
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//ОтражатьВСчете/text()', x))[1]::text AS ОтражатьВСчете  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.СтадииАкта', myxml)) x;
SELECT count(*) FROM import.СтадииАкта into i;
RAISE notice 'СтадииАкта : %', i;
t=t+1;


-- СтраницыРабочегоСтола
DROP TABLE IF EXISTS import.СтраницыРабочегоСтола; 
CREATE TABLE import.СтраницыРабочегоСтола AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.СтраницыРабочегоСтола', myxml)) x;
SELECT count(*) FROM import.СтраницыРабочегоСтола into i;
RAISE notice 'СтраницыРабочегоСтола : %', i;
t=t+1;


-- ТарифныеГруппы
DROP TABLE IF EXISTS import.ТарифныеГруппы; 
CREATE TABLE import.ТарифныеГруппы AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//ТипАбонента/text()', x))[1]::text AS ТипАбонента  
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//ФЛ/text()', x))[1]::text AS ФЛ 
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ТарифныеГруппы', myxml)) x;
SELECT count(*) FROM import.ТарифныеГруппы into i;
RAISE notice 'ТарифныеГруппы : %', i;
t=t+1;


-- ТарифныеПодгруппы
DROP TABLE IF EXISTS import.ТарифныеПодгруппы; 
CREATE TABLE import.ТарифныеПодгруппы AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ТарифныеПодгруппы', myxml)) x;
SELECT count(*) FROM import.ТарифныеПодгруппы into i;
RAISE notice 'ТарифныеПодгруппы : %', i;
t=t+1;


-- Тарифы
DROP TABLE IF EXISTS import.Тарифы; 
CREATE TABLE import.Тарифы AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//ДатаНачала/text()', x))[1]::text AS ДатаНачала  
    ,(xpath('//ДатаОкончания/text()', x))[1]::text AS ДатаОкончания  
    ,(xpath('//ЕдиницаИзмерения/text()', x))[1]::text AS ЕдиницаИзмерения  
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//НаличЭлектроПлиты/text()', x))[1]::text AS НаличЭлектроПлиты  
    ,(xpath('//Организация/text()', x))[1]::text AS Организация  
    ,(xpath('//Ставка/text()', x))[1]::text AS Ставка  
    ,(xpath('//Сумма/text()', x))[1]::text AS Сумма  
    ,(xpath('//ТарифнаяГруппа/text()', x))[1]::text AS ТарифнаяГруппа  
    ,(xpath('//ВключаяНДС/text()', x))[1]::text AS ВключаяНДС  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.Тарифы', myxml)) x;
SELECT count(*) FROM import.Тарифы into i;
RAISE notice 'Тарифы : %', i;
t=t+1;


-- ТипыАбонентов
DROP TABLE IF EXISTS import.ТипыАбонентов; 
CREATE TABLE import.ТипыАбонентов AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ТипыАбонентов', myxml)) x;
SELECT count(*) FROM import.ТипыАбонентов into i;
RAISE notice 'ТипыАбонентов : %', i;
t=t+1;


-- ТипыАвтоматическихВыключателей
DROP TABLE IF EXISTS import.ТипыАвтоматическихВыключателей; 
CREATE TABLE import.ТипыАвтоматическихВыключателей AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//НоминальныйТок/text()', x))[1]::text AS НоминальныйТок  
    ,(xpath('//ТокВыключения/text()', x))[1]::text AS ТокВыключения  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ТипыАвтоматическихВыключателей', myxml)) x;
SELECT count(*) FROM import.ТипыАвтоматическихВыключателей into i;
RAISE notice 'ТипыАвтоматическихВыключателей : %', i;
t=t+1;


-- ТипыАктовАттестации
DROP TABLE IF EXISTS import.ТипыАктовАттестации; 
CREATE TABLE import.ТипыАктовАттестации AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ТипыАктовАттестации', myxml)) x;
SELECT count(*) FROM import.ТипыАктовАттестации into i;
RAISE notice 'ТипыАктовАттестации : %', i;
t=t+1;


-- ТипыВедомостей
DROP TABLE IF EXISTS import.ТипыВедомостей; 
CREATE TABLE import.ТипыВедомостей AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ТипыВедомостей', myxml)) x;
SELECT count(*) FROM import.ТипыВедомостей into i;
RAISE notice 'ТипыВедомостей : %', i;
t=t+1;


-- ТипыВидовЮридическихДокументов
DROP TABLE IF EXISTS import.ТипыВидовЮридическихДокументов; 
CREATE TABLE import.ТипыВидовЮридическихДокументов AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//IsFolder/text()', x))[1]::text AS IsFolder 
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Parent/text()', x))[1]::text AS Parent 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ТипыВидовЮридическихДокументов', myxml)) x;
SELECT count(*) FROM import.ТипыВидовЮридическихДокументов into i;
RAISE notice 'ТипыВидовЮридическихДокументов : %', i;
t=t+1;


-- ТипыВходаОтпускаИзСетиТочекУчета
DROP TABLE IF EXISTS import.ТипыВходаОтпускаИзСетиТочекУчет; 
CREATE TABLE import.ТипыВходаОтпускаИзСетиТочекУчет AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ТипыВходаОтпускаИзСетиТочекУчет', myxml)) x;
SELECT count(*) FROM import.ТипыВходаОтпускаИзСетиТочекУчет into i;
RAISE notice 'ТипыВходаОтпускаИзСетиТочекУчет : %', i;
t=t+1;


-- ТипыГоловногоУчета
DROP TABLE IF EXISTS import.ТипыГоловногоУчета; 
CREATE TABLE import.ТипыГоловногоУчета AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ТипыГоловногоУчета', myxml)) x;
SELECT count(*) FROM import.ТипыГоловногоУчета into i;
RAISE notice 'ТипыГоловногоУчета : %', i;
t=t+1;


-- ТипыДоговоров
DROP TABLE IF EXISTS import.ТипыДоговоров; 
CREATE TABLE import.ТипыДоговоров AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ТипыДоговоров', myxml)) x;
SELECT count(*) FROM import.ТипыДоговоров into i;
RAISE notice 'ТипыДоговоров : %', i;
t=t+1;


-- ТипыДокументовУдостоверяющиеСтатусПотребителя
DROP TABLE IF EXISTS import.ТипыДокументовУдостоверяющиеСта; 
CREATE TABLE import.ТипыДокументовУдостоверяющиеСта AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ТипыДокументовУдостоверяющиеСта', myxml)) x;
SELECT count(*) FROM import.ТипыДокументовУдостоверяющиеСта into i;
RAISE notice 'ТипыДокументовУдостоверяющиеСта : %', i;
t=t+1;


-- ТипыЗаключенияАттестации
DROP TABLE IF EXISTS import.ТипыЗаключенияАттестации; 
CREATE TABLE import.ТипыЗаключенияАттестации AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ТипыЗаключенияАттестации', myxml)) x;
SELECT count(*) FROM import.ТипыЗаключенияАттестации into i;
RAISE notice 'ТипыЗаключенияАттестации : %', i;
t=t+1;


-- ТипыЗаключенияДоговоров
DROP TABLE IF EXISTS import.ТипыЗаключенияДоговоров; 
CREATE TABLE import.ТипыЗаключенияДоговоров AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ТипыЗаключенияДоговоров', myxml)) x;
SELECT count(*) FROM import.ТипыЗаключенияДоговоров into i;
RAISE notice 'ТипыЗаключенияДоговоров : %', i;
t=t+1;


-- ТипыЗастройки
DROP TABLE IF EXISTS import.ТипыЗастройки; 
CREATE TABLE import.ТипыЗастройки AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//ТипРазбивки/text()', x))[1]::text AS ТипРазбивки  
    ,(xpath('//ЕстьКвартиры/text()', x))[1]::text AS ЕстьКвартиры  
    ,(xpath('//ЕстьПодъезды/text()', x))[1]::text AS ЕстьПодъезды  
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ТипыЗастройки', myxml)) x;
SELECT count(*) FROM import.ТипыЗастройки into i;
RAISE notice 'ТипыЗастройки : %', i;
t=t+1;


-- ТипыНарушений
DROP TABLE IF EXISTS import.ТипыНарушений; 
CREATE TABLE import.ТипыНарушений AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ТипыНарушений', myxml)) x;
SELECT count(*) FROM import.ТипыНарушений into i;
RAISE notice 'ТипыНарушений : %', i;
t=t+1;


-- ТипыНаряда
DROP TABLE IF EXISTS import.ТипыНаряда; 
CREATE TABLE import.ТипыНаряда AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ТипыНаряда', myxml)) x;
SELECT count(*) FROM import.ТипыНаряда into i;
RAISE notice 'ТипыНаряда : %', i;
t=t+1;


-- ТипыОбращений
DROP TABLE IF EXISTS import.ТипыОбращений; 
CREATE TABLE import.ТипыОбращений AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//IsFolder/text()', x))[1]::text AS IsFolder 
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Parent/text()', x))[1]::text AS Parent 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//МаксимальноеКоличествоЗаявокНаД/text()', x))[1]::text AS МаксимальноеКоличествоЗаявокНаД  
    ,(xpath('//МерыБезопасности/text()', x))[1]::text AS МерыБезопасности  
    ,(xpath('//МетодСнятияПоказанийПоУмолчанию/text()', x))[1]::text AS МетодСнятияПоказанийПоУмолчанию  
    ,(xpath('//ОтображатьВЛК/text()', x))[1]::text AS ОтображатьВЛК  
    ,(xpath('//ТипНаряда/text()', x))[1]::text AS ТипНаряда  
    ,(xpath('//ФормироватьОтдельно/text()', x))[1]::text AS ФормироватьОтдельно  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ТипыОбращений', myxml)) x;
SELECT count(*) FROM import.ТипыОбращений into i;
RAISE notice 'ТипыОбращений : %', i;
t=t+1;


-- ТипыОбслуживания
DROP TABLE IF EXISTS import.ТипыОбслуживания; 
CREATE TABLE import.ТипыОбслуживания AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ТипыОбслуживания', myxml)) x;
SELECT count(*) FROM import.ТипыОбслуживания into i;
RAISE notice 'ТипыОбслуживания : %', i;
t=t+1;


-- ТипыОбъектов
DROP TABLE IF EXISTS import.ТипыОбъектов; 
CREATE TABLE import.ТипыОбъектов AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ТипыОбъектов', myxml)) x;
SELECT count(*) FROM import.ТипыОбъектов into i;
RAISE notice 'ТипыОбъектов : %', i;
t=t+1;


-- ТипыОтключений
DROP TABLE IF EXISTS import.ТипыОтключений; 
CREATE TABLE import.ТипыОтключений AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ТипыОтключений', myxml)) x;
SELECT count(*) FROM import.ТипыОтключений into i;
RAISE notice 'ТипыОтключений : %', i;
t=t+1;


-- ТипыОтопления
DROP TABLE IF EXISTS import.ТипыОтопления; 
CREATE TABLE import.ТипыОтопления AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ТипыОтопления', myxml)) x;
SELECT count(*) FROM import.ТипыОтопления into i;
RAISE notice 'ТипыОтопления : %', i;
t=t+1;


-- ТипыПломб
DROP TABLE IF EXISTS import.ТипыПломб; 
CREATE TABLE import.ТипыПломб AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ТипыПломб', myxml)) x;
SELECT count(*) FROM import.ТипыПломб into i;
RAISE notice 'ТипыПломб : %', i;
t=t+1;


-- ТипыПодписавшегоЛица
DROP TABLE IF EXISTS import.ТипыПодписавшегоЛица; 
CREATE TABLE import.ТипыПодписавшегоЛица AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ТипыПодписавшегоЛица', myxml)) x;
SELECT count(*) FROM import.ТипыПодписавшегоЛица into i;
RAISE notice 'ТипыПодписавшегоЛица : %', i;
t=t+1;


-- ТипыПодписанияАкта
DROP TABLE IF EXISTS import.ТипыПодписанияАкта; 
CREATE TABLE import.ТипыПодписанияАкта AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ТипыПодписанияАкта', myxml)) x;
SELECT count(*) FROM import.ТипыПодписанияАкта into i;
RAISE notice 'ТипыПодписанияАкта : %', i;
t=t+1;


-- ТипыПомещений
DROP TABLE IF EXISTS import.ТипыПомещений; 
CREATE TABLE import.ТипыПомещений AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ТипыПомещений', myxml)) x;
SELECT count(*) FROM import.ТипыПомещений into i;
RAISE notice 'ТипыПомещений : %', i;
t=t+1;


-- ТипыПредписаний
DROP TABLE IF EXISTS import.ТипыПредписаний; 
CREATE TABLE import.ТипыПредписаний AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ТипыПредписаний', myxml)) x;
SELECT count(*) FROM import.ТипыПредписаний into i;
RAISE notice 'ТипыПредписаний : %', i;
t=t+1;


-- ТипыПриборовУчета
DROP TABLE IF EXISTS import.ТипыПриборовУчета; 
CREATE TABLE import.ТипыПриборовУчета AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КлассТочности/text()', x))[1]::text AS КлассТочности  
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//ЛетДоПоверки/text()', x))[1]::text AS ЛетДоПоверки  
    ,(xpath('//МаксимальныйНоминальныйТок/text()', x))[1]::text AS МаксимальныйНоминальныйТок  
    ,(xpath('//МинимальныйНоминальныйТок/text()', x))[1]::text AS МинимальныйНоминальныйТок  
    ,(xpath('//ОборотовНаКвтЧас/text()', x))[1]::text AS ОборотовНаКвтЧас  
    ,(xpath('//Разрядность/text()', x))[1]::text AS Разрядность  
    ,(xpath('//ТипСистемыПрибораУчета/text()', x))[1]::text AS ТипСистемыПрибораУчета  
    ,(xpath('//Фазность/text()', x))[1]::text AS Фазность  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ТипыПриборовУчета', myxml)) x;
SELECT count(*) FROM import.ТипыПриборовУчета into i;
RAISE notice 'ТипыПриборовУчета : %', i;
t=t+1;


-- ТипыПрисоединенияПС
DROP TABLE IF EXISTS import.ТипыПрисоединенияПС; 
CREATE TABLE import.ТипыПрисоединенияПС AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//Описание/text()', x))[1]::text AS Описание 
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ТипыПрисоединенияПС', myxml)) x;
SELECT count(*) FROM import.ТипыПрисоединенияПС into i;
RAISE notice 'ТипыПрисоединенияПС : %', i;
t=t+1;


-- ТипыПрочихУслуг
DROP TABLE IF EXISTS import.ТипыПрочихУслуг; 
CREATE TABLE import.ТипыПрочихУслуг AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//НаименованиеПолное/text()', x))[1]::text AS НаименованиеПолное 
    ,(xpath('//ВидДохода/text()', x))[1]::text AS ВидДохода 
    ,(xpath('//ЕдиницаИзмерения/text()', x))[1]::text AS ЕдиницаИзмерения 
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ТипыПрочихУслуг', myxml)) x;
SELECT count(*) FROM import.ТипыПрочихУслуг into i;
RAISE notice 'ТипыПрочихУслуг : %', i;
t=t+1;


-- ТипыРазбивок
DROP TABLE IF EXISTS import.ТипыРазбивок; 
CREATE TABLE import.ТипыРазбивок AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ТипыРазбивок', myxml)) x;
SELECT count(*) FROM import.ТипыРазбивок into i;
RAISE notice 'ТипыРазбивок : %', i;
t=t+1;


-- ТипыРазмеровФайла
DROP TABLE IF EXISTS import.ТипыРазмеровФайла; 
CREATE TABLE import.ТипыРазмеровФайла AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ТипыРазмеровФайла', myxml)) x;
SELECT count(*) FROM import.ТипыРазмеровФайла into i;
RAISE notice 'ТипыРазмеровФайла : %', i;
t=t+1;


-- ТипыРасчета
DROP TABLE IF EXISTS import.ТипыРасчета; 
CREATE TABLE import.ТипыРасчета AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//Приоритет/text()', x))[1]::text AS Приоритет  
    ,(xpath('//Дифтариф/text()', x))[1]::text AS Дифтариф  
    ,(xpath('//НаименованиеДляСчетФактуры/text()', x))[1]::text AS НаименованиеДляСчетФактуры  
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//Счет/text()', x))[1]::text AS Счет  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ТипыРасчета', myxml)) x;
SELECT count(*) FROM import.ТипыРасчета into i;
RAISE notice 'ТипыРасчета : %', i;
t=t+1;


-- ТипыРасчетаУслуг
DROP TABLE IF EXISTS import.ТипыРасчетаУслуг; 
CREATE TABLE import.ТипыРасчетаУслуг AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ТипыРасчетаУслуг', myxml)) x;
SELECT count(*) FROM import.ТипыРасчетаУслуг into i;
RAISE notice 'ТипыРасчетаУслуг : %', i;
t=t+1;


-- ТипыРезультата
DROP TABLE IF EXISTS import.ТипыРезультата; 
CREATE TABLE import.ТипыРезультата AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ТипыРезультата', myxml)) x;
SELECT count(*) FROM import.ТипыРезультата into i;
RAISE notice 'ТипыРезультата : %', i;
t=t+1;


-- ТипыРодаДеятельности
DROP TABLE IF EXISTS import.ТипыРодаДеятельности; 
CREATE TABLE import.ТипыРодаДеятельности AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ТипыРодаДеятельности', myxml)) x;
SELECT count(*) FROM import.ТипыРодаДеятельности into i;
RAISE notice 'ТипыРодаДеятельности : %', i;
t=t+1;


-- ТипыСезонов
DROP TABLE IF EXISTS import.ТипыСезонов; 
CREATE TABLE import.ТипыСезонов AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ТипыСезонов', myxml)) x;
SELECT count(*) FROM import.ТипыСезонов into i;
RAISE notice 'ТипыСезонов : %', i;
t=t+1;


-- ТипыСиловыхТрансформаторов
DROP TABLE IF EXISTS import.ТипыСиловыхТрансформаторов; 
CREATE TABLE import.ТипыСиловыхТрансформаторов AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//МощностьКороткогоЗамыкания/text()', x))[1]::text AS МощностьКороткогоЗамыкания  
    ,(xpath('//МощностьПотерьХолостогоХода/text()', x))[1]::text AS МощностьПотерьХолостогоХода  
    ,(xpath('//НоминальнаяМощность/text()', x))[1]::text AS НоминальнаяМощность  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ТипыСиловыхТрансформаторов', myxml)) x;
SELECT count(*) FROM import.ТипыСиловыхТрансформаторов into i;
RAISE notice 'ТипыСиловыхТрансформаторов : %', i;
t=t+1;


-- ТипыСистемыПриборовУчета
DROP TABLE IF EXISTS import.ТипыСистемыПриборовУчета; 
CREATE TABLE import.ТипыСистемыПриборовУчета AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ТипыСистемыПриборовУчета', myxml)) x;
SELECT count(*) FROM import.ТипыСистемыПриборовУчета into i;
RAISE notice 'ТипыСистемыПриборовУчета : %', i;
t=t+1;


-- ТипыТокоприемников
DROP TABLE IF EXISTS import.ТипыТокоприемников; 
CREATE TABLE import.ТипыТокоприемников AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//Сезон/text()', x))[1]::text AS Сезон  
    ,(xpath('//Часы01/text()', x))[1]::text AS Часы01  
    ,(xpath('//Часы02/text()', x))[1]::text AS Часы02  
    ,(xpath('//Часы03/text()', x))[1]::text AS Часы03  
    ,(xpath('//Часы04/text()', x))[1]::text AS Часы04  
    ,(xpath('//Часы05/text()', x))[1]::text AS Часы05  
    ,(xpath('//Часы06/text()', x))[1]::text AS Часы06  
    ,(xpath('//Часы07/text()', x))[1]::text AS Часы07  
    ,(xpath('//Часы08/text()', x))[1]::text AS Часы08  
    ,(xpath('//Часы09/text()', x))[1]::text AS Часы09  
    ,(xpath('//Часы10/text()', x))[1]::text AS Часы10  
    ,(xpath('//Часы11/text()', x))[1]::text AS Часы11  
    ,(xpath('//Часы12/text()', x))[1]::text AS Часы12  
    ,(xpath('//Мощность/text()', x))[1]::text AS Мощность  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ТипыТокоприемников', myxml)) x;
SELECT count(*) FROM import.ТипыТокоприемников into i;
RAISE notice 'ТипыТокоприемников : %', i;
t=t+1;


-- ТипыТочекУчета
DROP TABLE IF EXISTS import.ТипыТочекУчета; 
CREATE TABLE import.ТипыТочекУчета AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//ТипАбонента/text()', x))[1]::text AS ТипАбонента  
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ТипыТочекУчета', myxml)) x;
SELECT count(*) FROM import.ТипыТочекУчета into i;
RAISE notice 'ТипыТочекУчета : %', i;
t=t+1;


-- ТипыТрансформаторов
DROP TABLE IF EXISTS import.ТипыТрансформаторов; 
CREATE TABLE import.ТипыТрансформаторов AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//Класс/text()', x))[1]::text AS Класс  
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//КоэффициентТрансформации/text()', x))[1]::text AS КоэффициентТрансформации  
    ,(xpath('//ЛетДоПоверки/text()', x))[1]::text AS ЛетДоПоверки  
    ,(xpath('//МаксимальныйТок/text()', x))[1]::text AS МаксимальныйТок  
    ,(xpath('//НоминальныйТок/text()', x))[1]::text AS НоминальныйТок  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ТипыТрансформаторов', myxml)) x;
SELECT count(*) FROM import.ТипыТрансформаторов into i;
RAISE notice 'ТипыТрансформаторов : %', i;
t=t+1;


-- ТипыУведомлений
DROP TABLE IF EXISTS import.ТипыУведомлений; 
CREATE TABLE import.ТипыУведомлений AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ТипыУведомлений', myxml)) x;
SELECT count(*) FROM import.ТипыУведомлений into i;
RAISE notice 'ТипыУведомлений : %', i;
t=t+1;


-- ТипыУровнейБалансаЭЭ
DROP TABLE IF EXISTS import.ТипыУровнейБалансаЭЭ; 
CREATE TABLE import.ТипыУровнейБалансаЭЭ AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ТипыУровнейБалансаЭЭ', myxml)) x;
SELECT count(*) FROM import.ТипыУровнейБалансаЭЭ into i;
RAISE notice 'ТипыУровнейБалансаЭЭ : %', i;
t=t+1;


-- ТипыУровнейПрисоединения
DROP TABLE IF EXISTS import.ТипыУровнейПрисоединения; 
CREATE TABLE import.ТипыУровнейПрисоединения AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ТипыУровнейПрисоединения', myxml)) x;
SELECT count(*) FROM import.ТипыУровнейПрисоединения into i;
RAISE notice 'ТипыУровнейПрисоединения : %', i;
t=t+1;


-- ТипыУслуг
DROP TABLE IF EXISTS import.ТипыУслуг; 
CREATE TABLE import.ТипыУслуг AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//ВидДохода/text()', x))[1]::text AS ВидДохода  
    ,(xpath('//ДоставкаУслуги/text()', x))[1]::text AS ДоставкаУслуги  
    ,(xpath('//ЕдиницаИзмерения/text()', x))[1]::text AS ЕдиницаИзмерения  
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//НаименованиеПолное/text()', x))[1]::text AS НаименованиеПолное  
    ,(xpath('//Организация/text()', x))[1]::text AS Организация  
    ,(xpath('//РеализацияУслуги/text()', x))[1]::text AS РеализацияУслуги  
    ,(xpath('//Счет/text()', x))[1]::text AS Счет  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ТипыУслуг', myxml)) x;
SELECT count(*) FROM import.ТипыУслуг into i;
RAISE notice 'ТипыУслуг : %', i;
t=t+1;


-- ТипыФазностиПриборовУчета
DROP TABLE IF EXISTS import.ТипыФазностиПриборовУчета; 
CREATE TABLE import.ТипыФазностиПриборовУчета AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ТипыФазностиПриборовУчета', myxml)) x;
SELECT count(*) FROM import.ТипыФазностиПриборовУчета into i;
RAISE notice 'ТипыФазностиПриборовУчета : %', i;
t=t+1;


-- ТипыЮридическихДокументов
DROP TABLE IF EXISTS import.ТипыЮридическихДокументов; 
CREATE TABLE import.ТипыЮридическихДокументов AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//СчетДт/text()', x))[1]::text AS СчетДт  
    ,(xpath('//СчетКт/text()', x))[1]::text AS СчетКт  
    ,(xpath('//НДСвТомЧисле/text()', x))[1]::text AS НДСвТомЧисле  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ТипыЮридическихДокументов', myxml)) x;
SELECT count(*) FROM import.ТипыЮридическихДокументов into i;
RAISE notice 'ТипыЮридическихДокументов : %', i;
t=t+1;


-- ТочкиУчета
DROP TABLE IF EXISTS import.ТочкиУчета; 
CREATE TABLE import.ТочкиУчета AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//Адрес/text()', x))[1]::text AS Адрес
    ,(xpath('//Ведомственная/text()', x))[1]::text AS Ведомственная
    ,(xpath('//ВидДеятельности/text()', x))[1]::text AS ВидДеятельности
    ,(xpath('//ГраницаРаздела/text()', x))[1]::text AS ГраницаРаздела
    ,(xpath('//ДатаЗакрытия/text()', x))[1]::text AS ДатаЗакрытия
    ,(xpath('//ДатаОткрытия/text()', x))[1]::text AS ДатаОткрытия
    ,(xpath('//ДлинаЛинии/text()', x))[1]::text AS ДлинаЛинии
    ,(xpath('//ЗаявлениеОбязательства/text()', x))[1]::text AS ЗаявлениеОбязательства
    ,(xpath('//КатегорияНадежности/text()', x))[1]::text AS КатегорияНадежности
    ,(xpath('//КлассНапряжения/text()', x))[1]::text AS КлассНапряжения
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена
    ,(xpath('//Корпус/text()', x))[1]::text AS Корпус
    ,(xpath('//ЛитераКвартиры/text()', x))[1]::text AS ЛитераКвартиры
    ,(xpath('//МощностьОбъекта/text()', x))[1]::text AS МощностьОбъекта
    ,(xpath('//МощностьПоТехусловиям/text()', x))[1]::text AS МощностьПоТехусловиям
    ,(xpath('//НаБалансеГраницыРаздела/text()', x))[1]::text AS НаБалансеГраницыРаздела
    ,(xpath('//Номер/text()', x))[1]::text AS Номер
    ,(xpath('//НомерКвартиры/text()', x))[1]::text AS НомерКвартиры
    ,(xpath('//НомерРазбивки/text()', x))[1]::text AS НомерРазбивки
    ,(xpath('//ОписаниеОбъектов/text()', x))[1]::text AS ОписаниеОбъектов
    ,(xpath('//Организация/text()', x))[1]::text AS Организация
    ,(xpath('//ОтходящаяЛиния/text()', x))[1]::text AS ОтходящаяЛиния
    ,(xpath('//ПереченьКвартир/text()', x))[1]::text AS ПереченьКвартир
    ,(xpath('//Подстанция/text()', x))[1]::text AS Подстанция
    ,(xpath('//Подъезд/text()', x))[1]::text AS Подъезд
    ,(xpath('//ПотериВЛиниях/text()', x))[1]::text AS ПотериВЛиниях
    ,(xpath('//ПотериВСиловомТрансформаторе/text()', x))[1]::text AS ПотериВСиловомТрансформаторе
    ,(xpath('//ПрежнийЛС/text()', x))[1]::text AS ПрежнийЛС
    ,(xpath('//Примечание/text()', x))[1]::text AS Примечание
    ,(xpath('//ПрочийУзелУчета/text()', x))[1]::text AS ПрочийУзелУчета
    ,(xpath('//СетевойУчасток/text()', x))[1]::text AS СетевойУчасток
    ,(xpath('//СопротивлениеЛинии/text()', x))[1]::text AS СопротивлениеЛинии
    ,(xpath('//СрокДействия/text()', x))[1]::text AS СрокДействия
    ,(xpath('//ТипВходаОтпускаИзСети/text()', x))[1]::text AS ТипВходаОтпускаИзСети
    ,(xpath('//ТипТочкиУчета/text()', x))[1]::text AS ТипТочкиУчета
    ,(xpath('//ТипУслуги/text()', x))[1]::text AS ТипУслуги
    ,(xpath('//ТП/text()', x))[1]::text AS ТП
    ,(xpath('//ТУВладелец/text()', x))[1]::text AS ТУВладелец
    ,(xpath('//УровеньБалансаЭЭ/text()', x))[1]::text AS УровеньБалансаЭЭ
    ,(xpath('//УровеньПрисоединения/text()', x))[1]::text AS УровеньПрисоединения
    ,(xpath('//ЭталонныйДом/text()', x))[1]::text AS ЭталонныйДом
    ,(xpath('//АСКУЭ/text()', x))[1]::text AS АСКУЭ
    ,(xpath('//ЛЭППара/text()', x))[1]::text AS ЛЭППара
    ,(xpath('//ТУДляРасчетаБаланса/text()', x))[1]::text AS ТУДляРасчетаБаланса
    ,(xpath('//ФактическоеОписание/text()', x))[1]::text AS ФактическоеОписание
    ,(xpath('//ФактическийАдрес/text()', x))[1]::text AS ФактическийАдрес
    ,(xpath('//Квадрат/text()', x))[1]::text AS Квадрат
    ,(xpath('//СреднийУровеньРП/text()', x))[1]::text AS СреднийУровеньРП
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ТочкиУчета', myxml)) x;
SELECT count(*) FROM import.ТочкиУчета into i;
RAISE notice 'ТочкиУчета : %', i;
t=t+1;


-- ТП
DROP TABLE IF EXISTS import.ТП; 
CREATE TABLE import.ТП AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//Ведомственная/text()', x))[1]::text AS Ведомственная  
    ,(xpath('//ДатаКон/text()', x))[1]::text AS ДатаКон  
    ,(xpath('//ДатаНач/text()', x))[1]::text AS ДатаНач  
    ,(xpath('//ИнвентарныйНомер/text()', x))[1]::text AS ИнвентарныйНомер  
    ,(xpath('//КлассНапряженияВход/text()', x))[1]::text AS КлассНапряженияВход  
    ,(xpath('//КлассНапряженияВыход1/text()', x))[1]::text AS КлассНапряженияВыход1  
    ,(xpath('//КлассНапряженияВыход2/text()', x))[1]::text AS КлассНапряженияВыход2  
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//КонтролерФЛ/text()', x))[1]::text AS КонтролерФЛ  
    ,(xpath('//КонтролерЮЛ/text()', x))[1]::text AS КонтролерЮЛ  
    ,(xpath('//ПорядковыйНомер/text()', x))[1]::text AS ПорядковыйНомер  
    ,(xpath('//ПорядковыйНомерЮЛ/text()', x))[1]::text AS ПорядковыйНомерЮЛ  
    ,(xpath('//Сектор/text()', x))[1]::text AS Сектор  
    ,(xpath('//ТекстКаз/text()', x))[1]::text AS ТекстКаз  
    ,(xpath('//ТекстРус/text()', x))[1]::text AS ТекстРус  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ТП', myxml)) x;
SELECT count(*) FROM import.ТП into i;
RAISE notice 'ТП : %', i;
t=t+1;


-- ТрансформаторыНапряжения
DROP TABLE IF EXISTS import.ТрансформаторыНапряжения; 
CREATE TABLE import.ТрансформаторыНапряжения AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//ДатаПоверки/text()', x))[1]::text AS ДатаПоверки  
    ,(xpath('//ДатаИзготовления/text()', x))[1]::text AS ДатаИзготовления  
    ,(xpath('//ДатаСледующейПоверки/text()', x))[1]::text AS ДатаСледующейПоверки  
    ,(xpath('//Завод/text()', x))[1]::text AS Завод  
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//ТипПрибора/text()', x))[1]::text AS ТипПрибора  
    ,(xpath('//ЗаводскойНомер1/text()', x))[1]::text AS ЗаводскойНомер1  
    ,(xpath('//ЗаводскойНомер2/text()', x))[1]::text AS ЗаводскойНомер2  
    ,(xpath('//ЗаводскойНомер3/text()', x))[1]::text AS ЗаводскойНомер3  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ТрансформаторыНапряжения', myxml)) x;
SELECT count(*) FROM import.ТрансформаторыНапряжения into i;
RAISE notice 'ТрансформаторыНапряжения : %', i;
t=t+1;


-- ТрансформаторыТока
DROP TABLE IF EXISTS import.ТрансформаторыТока; 
CREATE TABLE import.ТрансформаторыТока AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//ДатаПоверки/text()', x))[1]::text AS ДатаПоверки  
    ,(xpath('//ДатаИзготовления/text()', x))[1]::text AS ДатаИзготовления  
    ,(xpath('//ДатаСледующейПоверки/text()', x))[1]::text AS ДатаСледующейПоверки  
    ,(xpath('//Завод/text()', x))[1]::text AS Завод  
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//ТипПрибора/text()', x))[1]::text AS ТипПрибора  
    ,(xpath('//ЗаводскойНомер1/text()', x))[1]::text AS ЗаводскойНомер1  
    ,(xpath('//ЗаводскойНомер2/text()', x))[1]::text AS ЗаводскойНомер2  
    ,(xpath('//ЗаводскойНомер3/text()', x))[1]::text AS ЗаводскойНомер3  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ТрансформаторыТока', myxml)) x;
SELECT count(*) FROM import.ТрансформаторыТока into i;
RAISE notice 'ТрансформаторыТока : %', i;
t=t+1;


-- Улицы
DROP TABLE IF EXISTS import.Улицы; 
CREATE TABLE import.Улицы AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Owner/text()', x))[1]::text AS Owner 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//Казакша/text()', x))[1]::text AS Казакша  
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//ПолностьюВключатьВРазбивку/text()', x))[1]::text AS ПолностьюВключатьВРазбивку  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.Улицы', myxml)) x;
SELECT count(*) FROM import.Улицы into i;
RAISE notice 'Улицы : %', i;
t=t+1;


-- ФизическиеЛица
DROP TABLE IF EXISTS import.ФизическиеЛица; 
CREATE TABLE import.ФизическиеЛица AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//ДополнительнаяИнформация/text()', x))[1]::text AS ДополнительнаяИнформация  
    ,(xpath('//ИИН/text()', x))[1]::text AS ИИН  
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//МестоРаботы/text()', x))[1]::text AS МестоРаботы  
    ,(xpath('//Опасность/text()', x))[1]::text AS Опасность  
    ,(xpath('//ПредпочтительноеОбращение/text()', x))[1]::text AS ПредпочтительноеОбращение  
    ,(xpath('//РНН/text()', x))[1]::text AS РНН  
    ,(xpath('//Телефон/text()', x))[1]::text AS Телефон  
    ,(xpath('//Телефон2/text()', x))[1]::text AS Телефон2  
    ,(xpath('//ТелефонМобильный/text()', x))[1]::text AS ТелефонМобильный  
    ,(xpath('//ЮридическийАдрес/text()', x))[1]::text AS ЮридическийАдрес  
    ,(xpath('//ЭлектронныйАдрес/text()', x))[1]::text AS ЭлектронныйАдрес  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ФизическиеЛица', myxml)) x;
SELECT count(*) FROM import.ФизическиеЛица into i;
RAISE notice 'ФизическиеЛица : %', i;
t=t+1;


-- ФормыСобственностиЮридическихЛиц
DROP TABLE IF EXISTS import.ФормыСобственностиЮридическихЛи; 
CREATE TABLE import.ФормыСобственностиЮридическихЛи AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description  
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена
    ,(xpath('//НаименованиеПолное/text()', x))[1]::text AS НаименованиеПолное
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ФормыСобственностиЮридическихЛи', myxml)) x;
SELECT count(*) FROM import.ФормыСобственностиЮридическихЛи into i;
RAISE notice 'ФормыСобственностиЮридическихЛи : %', i;
t=t+1;


-- ХарактерПотребления
DROP TABLE IF EXISTS import.ХарактерПотребления; 
CREATE TABLE import.ХарактерПотребления AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ХарактерПотребления', myxml)) x;
SELECT count(*) FROM import.ХарактерПотребления into i;
RAISE notice 'ХарактерПотребления : %', i;
t=t+1;


-- ЦветаПломб
DROP TABLE IF EXISTS import.ЦветаПломб; 
CREATE TABLE import.ЦветаПломб AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ЦветаПломб', myxml)) x;
SELECT count(*) FROM import.ЦветаПломб into i;
RAISE notice 'ЦветаПломб : %', i;
t=t+1;


-- ЮридическиеЛица
DROP TABLE IF EXISTS import.ЮридическиеЛица; 
CREATE TABLE import.ЮридическиеЛица AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//БИН/text()', x))[1]::text AS БИН  
    ,(xpath('//ВидДеятельности/text()', x))[1]::text AS ВидДеятельности  
    ,(xpath('//ДатаЗакрытия/text()', x))[1]::text AS ДатаЗакрытия  
    ,(xpath('//ДатаНДС/text()', x))[1]::text AS ДатаНДС  
    ,(xpath('//ДатаОткрытия/text()', x))[1]::text AS ДатаОткрытия  
    ,(xpath('//ДополнительнаяИнформация/text()', x))[1]::text AS ДополнительнаяИнформация  
    ,(xpath('//КБЕ/text()', x))[1]::text AS КБЕ  
    ,(xpath('//КНП/text()', x))[1]::text AS КНП  
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//КодПоОКПО/text()', x))[1]::text AS КодПоОКПО  
    ,(xpath('//КодРезиденства/text()', x))[1]::text AS КодРезиденства  
    ,(xpath('//КодСектораЭкономики/text()', x))[1]::text AS КодСектораЭкономики  
    ,(xpath('//ЛитераДома/text()', x))[1]::text AS ЛитераДома  
    ,(xpath('//ЛитераОфис/text()', x))[1]::text AS ЛитераОфис  
    ,(xpath('//НаименованиеПолное/text()', x))[1]::text AS НаименованиеПолное  
    ,(xpath('//НаселенныйПункт/text()', x))[1]::text AS НаселенныйПункт  
    ,(xpath('//НомерДома/text()', x))[1]::text AS НомерДома  
    ,(xpath('//НомерНДС/text()', x))[1]::text AS НомерНДС  
    ,(xpath('//Офис/text()', x))[1]::text AS Офис  
    ,(xpath('//ПочтовыйИндекс/text()', x))[1]::text AS ПочтовыйИндекс  
    ,(xpath('//ПричинаЗакрытия/text()', x))[1]::text AS ПричинаЗакрытия  
    ,(xpath('//РасписаниеРаботыСтрокой/text()', x))[1]::text AS РасписаниеРаботыСтрокой  
    ,(xpath('//РНН/text()', x))[1]::text AS РНН  
    ,(xpath('//СерияНДС/text()', x))[1]::text AS СерияНДС  
    ,(xpath('//СигнальноеСообщение/text()', x))[1]::text AS СигнальноеСообщение  
    ,(xpath('//ТарифнаяПодгруппа/text()', x))[1]::text AS ТарифнаяПодгруппа  
    ,(xpath('//Телефоны/text()', x))[1]::text AS Телефоны  
    ,(xpath('//ТелефоныСтрокой/text()', x))[1]::text AS ТелефоныСтрокой  
    ,(xpath('//Улица/text()', x))[1]::text AS Улица  
    ,(xpath('//Факс/text()', x))[1]::text AS Факс  
    ,(xpath('//ФормаСобственности/text()', x))[1]::text AS ФормаСобственности  
    ,(xpath('//ЮридическийАдрес/text()', x))[1]::text AS ЮридическийАдрес  
    ,(xpath('//ЭлектронныйАдрес/text()', x))[1]::text AS ЭлектронныйАдрес  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.ЮридическиеЛица', myxml)) x;
SELECT count(*) FROM import.ЮридическиеЛица into i;
RAISE notice 'ЮридическиеЛица : %', i;
t=t+1;


-- Языки
DROP TABLE IF EXISTS import.Языки; 
CREATE TABLE import.Языки AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//КодДляОбмена/text()', x))[1]::text AS КодДляОбмена  
    ,(xpath('//Приоритет/text()', x))[1]::text AS Приоритет  
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.Языки', myxml)) x;
SELECT count(*) FROM import.Языки into i;
RAISE notice 'Языки : %', i;
t=t+1;


-- Квадраты
DROP TABLE IF EXISTS import.Квадраты; 
CREATE TABLE import.Квадраты AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.Квадраты', myxml)) x;
SELECT count(*) FROM import.Квадраты into i;
RAISE notice 'Квадраты : %', i;
t=t+1;


-- Службы
DROP TABLE IF EXISTS import.Службы; 
CREATE TABLE import.Службы AS 
SELECT 
     (xpath('//Ref/text()', x))[1]::text AS Ref
    ,(xpath('//DeletionMark/text()', x))[1]::text AS DeletionMark 
    ,(xpath('//Code/text()', x))[1]::text AS Code
    ,(xpath('//Description/text()', x))[1]::text AS Description
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
    ,0 AS NewID
FROM unnest(xpath('//CatalogObject.Службы', myxml)) x;
SELECT count(*) FROM import.Службы into i;
RAISE notice 'Службы : %', i;
t=t+1;


return t;
END;
$$ LANGUAGE 'plpgsql';


-- select * from func_import_xml('/workdir/202001.xml')
-- <?xml version="1.0" encoding="UTF8"?> </V8Exch:Data> </V8Exch:_1CV8DtUD>
-- http://xml-copy-editor.sourceforge.net
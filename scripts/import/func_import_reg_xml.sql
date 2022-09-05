CREATE OR REPLACE FUNCTION import.func_import_reg_xml(ptf text) RETURNS int AS
$$
DECLARE 
myxml xml;
i int := 0;
t int := 0;
BEGIN
myxml := XMLPARSE(DOCUMENT convert_from(pg_read_binary_file(ptf), 'UTF8'));

-- InformationRegisterRecordSet.ПриборыУчетаНаТочках
DROP TABLE IF EXISTS import.ПриборыУчетаНаТочках; 
CREATE TABLE import.ПриборыУчетаНаТочках AS 
SELECT 
     (xpath('//Period/text()', x))[1]::text AS Period
    ,(xpath('//Active/text()', x))[1]::text AS Active 
    ,(xpath('//ТочкаУчета/text()', x))[1]::text AS ТочкаУчета
    ,(xpath('//ПриборУчета/text()', x))[1]::text AS ПриборУчета
    ,(xpath('//Установлен/text()', x))[1]::text AS Установлен 
    ,(xpath('//МестоУстановки/text()', x))[1]::text AS МестоУстановки
    ,(xpath('//Сотрудник/text()', x))[1]::text AS Сотрудник
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
FROM unnest(xpath('//InformationRegisterRecordSet.ПриборыУчетаНаТочках/Records/Record', myxml)) x;
SELECT count(*) FROM import.ПриборыУчетаНаТочках into i;
RAISE notice 'ПриборыУчетаНаТочках : %', i;
t=t+1;



-- InformationRegisterRecordSet.ТочкиУчетаДоговоры
DROP TABLE IF EXISTS import.ТочкиУчетаДоговоры; 
CREATE TABLE import.ТочкиУчетаДоговоры AS 
SELECT 
     (xpath('//Period/text()', x))[1]::text AS Period
    ,(xpath('//Active/text()', x))[1]::text AS Active 
    ,(xpath('//ТочкаУчета/text()', x))[1]::text AS ТочкаУчета
    ,(xpath('//Организация/text()', x))[1]::text AS Организация
    ,(xpath('//Договор/text()', x))[1]::text AS Договор 
    ,(xpath('//Статус/text()', x))[1]::text AS Статус
    ,(xpath('//ПричинаЗакрытия/text()', x))[1]::text AS ПричинаЗакрытия
    ,(xpath('//НомерДоговора/text()', x))[1]::text AS НомерДоговора 
    ,(xpath('//Ответственный/text()', x))[1]::text AS Ответственный
    ,(xpath('//КолочествоПроживающих/text()', x))[1]::text AS КолочествоПроживающих
    ,(xpath('//НаличиеЭлектроПлиты/text()', x))[1]::text AS НаличиеЭлектроПлиты 
    ,(xpath('//ТарифнаяГруппа/text()', x))[1]::text AS ТарифнаяГруппа
    ,(xpath('//ПрименятьТарифПоЗонамСуток/text()', x))[1]::text AS ПрименятьТарифПоЗонамСуток
    ,(xpath('//ПрименятьСредневзвешенныйТариф/text()', x))[1]::text AS ПрименятьСредневзвешенныйТариф 
    ,(xpath('//ПрименятьТарифПоОбъемамПотребления/text()', x))[1]::text AS ПрименятьТарифПоОбъемамПотребления
    ,(xpath('//ДоговорЭСО/text()', x))[1]::text AS ДоговорЭСО
    ,(xpath('//ТипЗаключенияДоговора/text()', x))[1]::text AS ТипЗаключенияДоговора
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
FROM unnest(xpath('//InformationRegisterRecordSet.ТочкиУчетаДоговоры/Records/Record', myxml)) x;
SELECT count(*) FROM import.ТочкиУчетаДоговоры into i;
RAISE notice 'ТочкиУчетаДоговоры : %', i;
t=t+1;



-- InformationRegisterRecordSet.ТочкиУчетаГоловногоУчета
DROP VIEW IF EXISTS import.V_TUGU; 
DROP TABLE IF EXISTS import.ТочкиУчетаГоловногоУчета; 
CREATE TABLE import.ТочкиУчетаГоловногоУчета AS 
SELECT 
    (xpath('//Recorder/text()', x))[1]::text AS Recorder
    ,(xpath('//Period/text()', x))[1]::text AS Period
    ,(xpath('//Active/text()', x))[1]::text AS Active 
    ,(xpath('//ТочкаУчета/text()', x))[1]::text AS ТочкаУчета
    ,(xpath('//ГоловнойУчет/text()', x))[1]::text AS ГоловнойУчет
    ,(xpath('//Статус/text()', x))[1]::text AS Статус 
    ,(xpath('//ТипГоловногоУчета/text()', x))[1]::text AS ТипГоловногоУчета
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
FROM unnest(xpath('//InformationRegisterRecordSet.ТочкиУчетаГоловногоУчета/Records/Record', myxml)) x;
SELECT count(*) FROM import.ТочкиУчетаГоловногоУчета into i;
RAISE notice 'ТочкиУчетаГоловногоУчета : %', i;
t=t+1;



-- VIEW import.V_TUGU
CREATE OR REPLACE VIEW import.V_TUGU AS
select to_date(tugu."period", 'YYYY-mm-dd') as pr, tugu.active, tugu.Статус, tugu.ТипГоловногоУчета , tu.description as ds ,ps.description as ps, tp.description as tp
from "import".ТочкиУчетаГоловногоУчета tugu left join "import".Подстанции ps on tugu."ГоловнойУчет" = ps."ref" 
left join "import".ТП tp on tugu."ГоловнойУчет" = tp."ref"
left join "import".ТочкиУчета tu on tugu."ТочкаУчета" = tu."ref"
-- where tugu.Статус = 'true' and tugu.active = 'true'
group by to_date(tugu."period", 'YYYY-mm-dd'), tugu.active, tugu.Статус, tugu.ТипГоловногоУчета , tu.description ,ps.description, tp.description
order by ps, tp, ds, pr;
RAISE notice 'V_TUGU : %', i;
t=t+1;



-- InformationRegisterRecordSet.СхемыПодключений
DROP TABLE IF EXISTS import.СхемыПодключений; 
CREATE TABLE import.СхемыПодключений AS 
SELECT 
    (xpath('//Recorder/text()', x))[1]::text AS Recorder
    ,(xpath('//Period/text()', x))[1]::text AS Period
    ,(xpath('//Active/text()', x))[1]::text AS Active 
    ,(xpath('//ТочкаУчета/text()', x))[1]::text AS ТочкаУчета
    ,(xpath('//ТочкаУчетаСхемыПодключения1/text()', x))[1]::text AS ТочкаУчетаСхемыПодключения1
    ,(xpath('//ТочкаУчетаСхемыПодключения/text()', x))[1]::text AS ТочкаУчетаСхемыПодключения 
    ,(xpath('//Автор/text()', x))[1]::text AS Автор
    ,(xpath('//ДатаВвода/text()', x))[1]::text AS ДатаВвода
FROM unnest(xpath('//InformationRegisterRecordSet.СхемыПодключений/Records/Record', myxml)) x;
SELECT count(*) FROM import.СхемыПодключений into i;
RAISE notice 'СхемыПодключений : %', i;
t=t+1;



return t;
END;
$$ LANGUAGE 'plpgsql';

-- //*[local-name() eq 'ГоловнойУчет']/@*[local-name() eq 'type']
-- select * from import.func_import_reg_xml('/workdir/Регистры сведений.xml')
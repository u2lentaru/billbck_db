CREATE OR REPLACE VIEW import.V_TUGU AS
select to_date(tugu."period", 'YYYY-mm-dd') as pr, tugu.active, tugu.Статус, tugu.ТипГоловногоУчета , tu.description as ds ,ps.description as ps, tp.description as tp
from "import".ТочкиУчетаГоловногоУчета tugu left join "import".Подстанции ps on tugu."ГоловнойУчет" = ps."ref" 
left join "import".ТП tp on tugu."ГоловнойУчет" = tp."ref"
left join "import".ТочкиУчета tu on tugu."ТочкаУчета" = tu."ref"
where tugu.Статус = 'true' and tugu.active = 'true'
group by to_date(tugu."period", 'YYYY-mm-dd'), tugu.active, tugu.Статус, tugu.ТипГоловногоУчета , tu.description ,ps.description, tp.description
order by ps, tp, ds, pr;
CREATE OR REPLACE FUNCTION func_import_test(ptf text) RETURNS int AS
$$
DECLARE 
rec record;
id1 int:=10; id2 int; id3 int; id4 int; id5 int; id6 int; id7 int; id8 int; id9 int; id10 int;
BEGIN
select * from import."ТочкиУчета" where Адрес = ptf limit 1 into rec;
RAISE notice 'ref, code, description, Адрес, НомерКвартиры: % % % % %', rec.ref, rec.code, rec.description, rec.Адрес, rec.НомерКвартиры;
return id1;
END;
$$ LANGUAGE 'plpgsql';
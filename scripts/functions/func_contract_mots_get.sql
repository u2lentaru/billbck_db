CREATE OR REPLACE FUNCTION func_contract_mots_get(pg int, pgs int, rn text, kn text, ord int, dsc boolean) RETURNS setof st_contract_mots AS
$$
declare
s text;
BEGIN
	s:='select * from st_contract_mots where contract_mot_name_ru ilike '||''''||rn||'%'||'''';
    s:=s||' and contract_mot_name_kz ilike '||''''||kn||'%'||'''';
	s:=s||'order by '||ord;
	if dsc
	then
	s:=s||' desc';
	end if;
	s:=s||' limit '||pgs||' offset '||(pg-1)*pgs;
	return query execute s;
END
$$ LANGUAGE 'plpgsql';
CREATE OR REPLACE FUNCTION func_contract_mots_cnt(rn text, kn text) RETURNS int AS
$$
declare
s text;
i int;
BEGIN
	s:='select count(*) from st_contract_mots where contract_mot_name_ru ilike '||''''||rn||'%'||'''';
     s:=s||' and contract_mot_name_kz ilike '||''''||kn||'%'||'''';
    execute s into i;
	if ( i is null )
	then
		return 0;
	end if;
return i;
END
$$ LANGUAGE 'plpgsql';
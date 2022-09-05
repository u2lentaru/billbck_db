CREATE OR REPLACE FUNCTION func_contract_mots_upd(x int, rn text, kn text) RETURNS int AS
$$
DECLARE
i int :=0;
BEGIN
	begin
        update public.st_contract_mots set (contract_mot_name_ru, contract_mot_name_kz) = (rn, kn) where id = x returning id into i;
	exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;
    if ( i is null )
	then
		return 0;
	end if;
	return i;
END
$$ LANGUAGE 'plpgsql';
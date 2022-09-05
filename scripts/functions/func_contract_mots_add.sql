CREATE OR REPLACE FUNCTION func_contract_mots_add(rn text, kn text) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	begin
		insert into public.st_contract_mots (contract_mot_name_ru, contract_mot_name_kz) values (rn, kn) returning id into i;
	exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;
	return i;
END
$$ LANGUAGE 'plpgsql';
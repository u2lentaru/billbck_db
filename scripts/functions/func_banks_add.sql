CREATE OR REPLACE FUNCTION func_banks_add(bn text, bd text, bm text) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	begin
		insert into public.st_banks (id, bank_name, bank_descr, mfo) values (default, bn, bd, bm) returning id into i;
	exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;
	return i;
END
$$ LANGUAGE 'plpgsql';
CREATE OR REPLACE FUNCTION func_sub_banks_add(sx int, bx int, an text) RETURNS int AS
$$
DECLARE
i int := 0;
BEGIN
	begin
		if (select count(*) from public.st_sub_banks where sub_id = sx) = 0 then
			insert into public.st_sub_banks (sub_id, bank_id, account_number, active) values (sx, bx, an, 'true') returning id into i;
		else
			insert into public.st_sub_banks (sub_id, bank_id, account_number, active) values (sx, bx, an, 'false') returning id into i;
		end if;
	exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;
	return i;
END
$$ LANGUAGE 'plpgsql';
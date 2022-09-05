CREATE OR REPLACE FUNCTION func_sub_banks_upd(x int, sx int, bx int, an text) RETURNS int AS
$$
DECLARE
i int := 0;
BEGIN
	begin
        update public.st_sub_banks set (sub_id, bank_id, account_number) = (sx, bx, an) 
		where id = x returning id into i;
	exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;
	return i;
END
$$ LANGUAGE 'plpgsql';
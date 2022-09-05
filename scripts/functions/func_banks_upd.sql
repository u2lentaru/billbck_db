CREATE OR REPLACE FUNCTION func_banks_upd(ib int, bn text, bd text, bm text) RETURNS int AS
$$
DECLARE
i int :=0;
BEGIN
	begin
        update public.st_banks set (bank_name, bank_descr, mfo) = (bn, bd, bm) where id = ib returning id into i;
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
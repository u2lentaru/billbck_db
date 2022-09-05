CREATE OR REPLACE FUNCTION func_trans_types_add(n text, r int, c int, mc int, nc int) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	begin
		insert into public.st_trans_types (trans_type_name, ratio, class, maxcurr, nomcurr) 
        values (n, r, c, mc, nc) returning id into i;
	exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;
	return i;
END
$$ LANGUAGE 'plpgsql';
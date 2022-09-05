CREATE OR REPLACE FUNCTION func_sub_pu_add(p int, s int) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	begin
		insert into public.st_sub_pu (parid, subid) values (p, s) returning id into i;
	exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;
	return i;
END
$$ LANGUAGE 'plpgsql';
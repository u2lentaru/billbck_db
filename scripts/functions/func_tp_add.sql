CREATE OR REPLACE FUNCTION func_tp_add(n text, g int) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	begin
		insert into public.st_tp (id, tp_name, grp_id) values (default, n, g) returning id into i;
	exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;
	return i;
END
$$ LANGUAGE 'plpgsql';
CREATE OR REPLACE FUNCTION func_tariffs_add(n text, g int, o numeric(10,2), t numeric(10,2), s date) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	begin
		insert into public.st_tariffs (id, tariff_name, tariff_group_id, norma, tariff, startdate, enddate) values (default, n, g, o, t, s, null) returning id into i;
	exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;
	return i;
END
$$ LANGUAGE 'plpgsql';
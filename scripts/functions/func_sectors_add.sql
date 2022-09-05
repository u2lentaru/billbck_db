CREATE OR REPLACE FUNCTION func_sectors_add(sn text) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	begin
		insert into public.st_sectors (id, sector_name) values (default, sn) returning id into i;
	exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;
	return i;
END
$$ LANGUAGE 'plpgsql';
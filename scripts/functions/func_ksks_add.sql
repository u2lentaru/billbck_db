CREATE OR REPLACE FUNCTION func_ksks_add(kskn text, kska text, kskh text, kskp text) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	begin
		insert into public.st_ksk (id, ksk_name, ksk_address, ksk_head, ksk_phone) values (default, kskn, kska, kskh, kskp) returning id into i;
	exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;
	return i;
END
$$ LANGUAGE 'plpgsql';
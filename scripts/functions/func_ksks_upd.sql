CREATE OR REPLACE FUNCTION func_ksks_upd(kski int, kskn text, kska text, kskh text, kskp text) RETURNS int AS
$$
DECLARE
i int :=0;
BEGIN
	begin
        update public.st_ksk set (ksk_name, ksk_address, ksk_head, ksk_phone) = (kskn, kska, kskh, kskp) where id = kski returning id into i;
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
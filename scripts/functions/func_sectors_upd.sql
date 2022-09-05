CREATE OR REPLACE FUNCTION func_sectors_upd(si int,sn text) RETURNS int AS
$$
DECLARE
i int :=0;
BEGIN
	begin
        update public.st_sectors set sector_name = sn where id = si returning id into i;
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
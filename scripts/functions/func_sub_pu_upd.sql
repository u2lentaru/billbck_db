CREATE OR REPLACE FUNCTION func_sub_pu_upd(x int,p int, s int) RETURNS int AS
$$
DECLARE
i int :=0;
BEGIN
	begin
        update public.st_sub_pu set (parid, subid) = (p, s) where id = x returning id into i;
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
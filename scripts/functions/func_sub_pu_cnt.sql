CREATE OR REPLACE FUNCTION func_sub_pu_cnt(x int) RETURNS int AS
$$
DECLARE
i int=0;
BEGIN
	select count(*) from public.st_sub_pu where parid = x into i;
    -- no subs
    if ( i is null )
	then
		return 0;
	end if;
    return i;
END
$$ LANGUAGE 'plpgsql';
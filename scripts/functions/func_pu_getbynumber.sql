CREATE OR REPLACE FUNCTION func_pu_getbynumber(n text) RETURNS int AS
$$
DECLARE
i int :=0;
BEGIN
	select id from public.wt_pu where trim(pu_number) = trim(n) into i;
    if ( i is null ) then
		return 0;
	end if;
	return i;
END
$$ LANGUAGE 'plpgsql';
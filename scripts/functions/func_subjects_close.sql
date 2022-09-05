CREATE OR REPLACE FUNCTION func_subjects_close(sid int, dc text) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	update public.st_subjects set closed=to_date(dc, 'YYYY-mm-dd') where id=sid returning id into i;
    -- id not exist
    if ( i is null )
	then
		return 0;
	end if;
	return i;
END
$$ LANGUAGE 'plpgsql';
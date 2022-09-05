CREATE OR REPLACE FUNCTION func_sector_get(si int) RETURNS st_sectors AS
$$
DECLARE
ret st_sectors;
BEGIN
	select * from public.st_sectors where id = si into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
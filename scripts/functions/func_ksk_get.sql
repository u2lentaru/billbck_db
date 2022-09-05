CREATE OR REPLACE FUNCTION func_ksk_get(kski int) RETURNS st_ksk AS
$$
DECLARE
ret st_ksk;
BEGIN
	select * from public.st_ksk where id = kski into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
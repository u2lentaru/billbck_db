CREATE OR REPLACE FUNCTION func_sub_types_upd(ist int, stn text, std text) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	update public.st_sub_types set (type_name, type_descr) = (stn, std) where id = ist returning id into i;
    -- id not exist
	if ( i is null )
	then
		return 0;
	end if;
	return i;
END
$$ LANGUAGE 'plpgsql';
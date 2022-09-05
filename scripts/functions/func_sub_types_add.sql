CREATE OR REPLACE FUNCTION func_sub_types_add(td text, tn text) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	insert into public.st_sub_types (id, type_descr, type_name) values (default, td, tn) returning id into i;
	-- id not exist
	if ( i is null )
	then
		return 0;
	end if;
	return i;
END
$$ LANGUAGE 'plpgsql';
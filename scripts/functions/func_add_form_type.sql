CREATE OR REPLACE FUNCTION func_add_form_type(ftn text, ftd text) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	insert into public.st_form_types (id, form_type_name, form_type_descr) values (default, ftn, ftd) returning id into i;
	return i;
END
$$ LANGUAGE 'plpgsql';
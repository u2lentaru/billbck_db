CREATE OR REPLACE FUNCTION func_upd_form_type(ift int, ftn text, ftd text) RETURNS int AS
$$
BEGIN
	update public.st_form_types set (form_type_name, form_type_descr) = (ftn, ftd) where id = ift;
	return ift;
END
$$ LANGUAGE 'plpgsql';
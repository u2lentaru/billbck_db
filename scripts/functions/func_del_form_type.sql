CREATE OR REPLACE FUNCTION func_del_form_type(ift int) RETURNS int AS
$$
declare
i int;
BEGIN
	i:=0;
	begin
		delete from public.st_form_types where id=ift returning id into i;
	exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;	
	return i;
END
$$ LANGUAGE 'plpgsql';
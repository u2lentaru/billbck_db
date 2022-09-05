CREATE OR REPLACE FUNCTION func_customer_groups_add(cgn text) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	begin
		insert into public.st_customer_groups (id, customer_group_name) values (default, cgn) returning id into i;
	exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;
	return i;
END
$$ LANGUAGE 'plpgsql';
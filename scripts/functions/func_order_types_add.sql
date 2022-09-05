CREATE OR REPLACE FUNCTION func_order_types_add(n text) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	begin
		insert into public.st_order_types (id, order_type_name) values (default, n) returning id into i;
	exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;
	return i;
END
$$ LANGUAGE 'plpgsql';
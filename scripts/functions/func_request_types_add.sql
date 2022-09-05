CREATE OR REPLACE FUNCTION func_request_types_add(n text, k int) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	begin
		insert into public.st_request_types (request_type_name, request_kind_id) values (n, k) returning id into i;
	exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;
	return i;
END
$$ LANGUAGE 'plpgsql';
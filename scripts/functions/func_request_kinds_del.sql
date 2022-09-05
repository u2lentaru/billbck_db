CREATE OR REPLACE FUNCTION func_request_kinds_del(x int) RETURNS int AS
$$
DECLARE
i int :=0;
BEGIN
	begin
        delete from public.st_request_kinds where id = x returning id into i;
	exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;
    if ( i is null ) then
		return 0;
	end if;
	return i;
END
$$ LANGUAGE 'plpgsql';
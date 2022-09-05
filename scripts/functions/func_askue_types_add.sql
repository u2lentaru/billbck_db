CREATE OR REPLACE FUNCTION func_askue_types_add(n text, s int, p int, v int, d int, da text) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	begin
		insert into public.st_askue_types (id, askue_type_name, start_line, pu_column, value_column, date_column, date_column_array) 
        values (default, n, s, p, v, d, da) returning id into i;
	exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;
	return i;
END
$$ LANGUAGE 'plpgsql';
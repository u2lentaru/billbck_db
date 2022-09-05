CREATE OR REPLACE FUNCTION func_askue_types_upd(x int,n text, s int, p int, v int, d int, da text) RETURNS int AS
$$
DECLARE
i int :=0;
BEGIN
	begin
        update public.st_askue_types set (askue_type_name, start_line, pu_column, value_column, date_column, date_column_array) = 
		(n, s, p, v, d, da) where id = x returning id into i;
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
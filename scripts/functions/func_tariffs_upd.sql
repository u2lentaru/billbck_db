CREATE OR REPLACE FUNCTION func_tariffs_upd(x int,n text, g int, o numeric(10,2), t numeric(10,2), s text, e text) RETURNS int AS
$$
DECLARE
i int :=0;
BEGIN
	begin
		--raise warning 'len(e): "%"',len(e);
		if (length(e) = 0)
		then
        	update public.st_tariffs set (tariff_name, tariff_group_id, norma, tariff, startdate, enddate) = 
        	(n, g, o, t, to_date(s, 'YYYY-mm-dd'), null) where id = x returning id into i;
			return i;
		end if;
        update public.st_tariffs set (tariff_name, tariff_group_id, norma, tariff, startdate, enddate) = 
        (n, g, o, t, to_date(s, 'YYYY-mm-dd'), to_date(e, 'YYYY-mm-dd')) where id = x returning id into i;
	exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;
    if ( i is null )
	then
		return 0;
	end if;
	return i;
END
$$ LANGUAGE 'plpgsql';
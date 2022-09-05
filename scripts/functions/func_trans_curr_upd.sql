CREATE OR REPLACE FUNCTION func_trans_curr_upd(x int, n text, t int, cd text, nd text, pd text, s1 text, s2 text, s3 text) RETURNS int AS
$$
DECLARE
i int :=0;
BEGIN
	begin
        update public.st_trans_curr set (trans_curr_name, trans_type_id, checkdate, nextcheckdate, proddate, serial1, serial2, serial3) = 
        (n, t, to_date(cd, 'YYYY-mm-dd'), to_date(nd, 'YYYY-mm-dd'), to_date(pd, 'YYYY-mm-dd'), s1, s2, s3) where id = x returning id into i;
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
CREATE OR REPLACE FUNCTION func_payments_cnt(n text, o text) RETURNS int AS
$$
declare
s text;
i int;
BEGIN
	s:='select count(*) from v_payments where contract_number ilike '||''''||n||'%'||'''';
   	if not (o is null) then
	s:=s||' and obj_id='||o;
	end if;
	execute s into i;
	if ( i is null ) then
		return 0;
	end if;
return i;
END
$$ LANGUAGE 'plpgsql';
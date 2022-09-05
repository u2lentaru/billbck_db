CREATE OR REPLACE FUNCTION func_request_types_cnt(n text, ki text) RETURNS int AS
$$
declare
s text;
i int;
BEGIN
	s:='select count(*) from v_request_types where request_type_name ilike '||''''||n||'%'||'''';
	if not (ki is null) then
		s:=s||' and request_kind_id='||ki;
	end if;
    execute s into i;
	if ( i is null )
	then
		return 0;
	end if;
return i;
END
$$ LANGUAGE 'plpgsql';
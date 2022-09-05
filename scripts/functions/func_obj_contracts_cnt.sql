CREATE OR REPLACE FUNCTION func_obj_contracts_cnt(o int, t int, c int, active boolean) RETURNS int AS
$$
declare
s text;
i int;
BEGIN
	s:='select count(*) from v_obj_contracts where true';
	if o is not null then
		s:=s||' and obj_id = '||o;
	end if;
	if t is not null then
		s:=s||' and type_id = '||t;
	end if;
	if c is not null then
		s:=s||' and contract_id = '||c;
	end if;
    if active is not null 
    then
        if active then
            s:=s||' and enddate is null';
        else
            s:=s||' and enddate is not null';
        end if;
    end if;
	execute s into i;
	if ( i is null )
	then
		return 0;
	end if;
return i;
END
$$ LANGUAGE 'plpgsql';
CREATE OR REPLACE FUNCTION func_acts_activate(x int, d text) RETURNS int AS
$$
DECLARE
acttype int; 
i int;
BEGIN
    if ( x is null ) or ( d is null ) 
    then
		return 0;
	end if;
    if ( (select activated from public.wt_acts where id = x) is not null ) 
    then
		return 0;
	end if;
    select act_type_id::int from public.wt_acts where id = x into acttype;
    if acttype = 3 THEN
        BEGIN          
            insert into public.wt_pu_values (pu_id, value_date, pu_value)
            (select pu_id, to_date(wad_date, 'YYYY-mm-dd'), ad_pu_value from public.v_acts where id = x);
            update public.wt_acts set activated = to_date(d, 'YYYY-mm-dd') where id = x returning id into i;
            if ( i is null ) then
		        return 0;
	        end if;
        return i;
        EXCEPTION                   
            WHEN unique_violation THEN
            RAISE EXCEPTION 'PU value on this date already exist!';
        END;
    END IF;
    return 0;
END
$$ LANGUAGE 'plpgsql';
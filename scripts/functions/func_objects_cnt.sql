CREATE OR REPLACE FUNCTION func_objects_cnt(n text, h text, ac boolean) RETURNS int AS
$$
declare
s text;
i int;
BEGIN
	s:='select count(*) from v_objects where upper(object_name) like '||''''||n||'%'||'''';
	if h is not null then
	s:=s||' and house_id='||h;
	end if;
	if not (ac is null) then
		if ac then
			s:=s||' and id in (select obj_id from wt_obj_contract woc where enddate is null and type_id = 0)';
		else
			s:=s||' and id not in (select obj_id from wt_obj_contract woc where enddate is null and type_id = 0)';
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
CREATE OR REPLACE FUNCTION func_objects_get(pg int, pgs int, n text, h text, ac boolean, ord int, dsc boolean) RETURNS setof v_objects AS
$$
declare
s text;
BEGIN
    s:='select * from v_objects';
    s:=s||' where upper(object_name) like '||''''||n||'%'||'''';
	if not (h is null) then
	s:=s||' and house_id='||h;
	end if;
	if not (ac is null) then
		if ac 
		then
			s:=s||' and id in (select obj_id from wt_obj_contract woc where enddate is null and type_id = 0)';
		else
			s:=s||' and id not in (select obj_id from wt_obj_contract woc where enddate is null and type_id = 0)';
		end if;
	end if;
	s:=s||' order by '||ord;
	if dsc
	then
	s:=s||' desc';
	end if;
	s:=s||' limit '||pgs||' offset '||(pg-1)*pgs;
	return query execute s;
END
$$ LANGUAGE 'plpgsql';
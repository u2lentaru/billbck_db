CREATE OR REPLACE FUNCTION func_acts_get(pg int, pgs int, a text, o text, x int, ord int, dsc boolean) RETURNS setof v_act_heads AS
$$
declare
s text;
BEGIN
	s:='select va.id, va.act_type_id, va.act_number, va.act_date, va.object_id, va.staff_id, va.notes, va.activated, 
    va.act_type_name, va.object_name, va.flat_number, va.reg_qty, va.street_name, va.city_name, va.house_number, 
    va.building_number, va.tariff_group_name, va.staff_name';
	s:=s||' from v_act_heads va ';
	s:=s||' where upper(act_number) like '||''''||a||'%'||''''||' and upper(object_name) like '||''''||o||'%'||'''';
	if ( x > 0 )
	then
		s:=s||' and object_id='||cast(x as text)||' ';
	end if;
	s:=s||'order by '||ord;
	if dsc
	then
	s:=s||' desc';
	end if;
	s:=s||' limit '||pgs||' offset '||(pg-1)*pgs;
	return query execute s;
END
$$ LANGUAGE 'plpgsql';
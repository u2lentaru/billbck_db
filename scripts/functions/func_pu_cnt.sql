CREATE OR REPLACE FUNCTION func_pu_cnt(o text,n text, d text, p text, h text, ex text, pa boolean) RETURNS int AS
$$
declare
s text;
i int;
BEGIN
	s:='select count(*) from v_pu';
	s:=s||' where object_name ilike '||''''||o||'%'||''''||' and street_name ilike '||''''||n||'%'||'''';
	if (p is not null) and (p = '0') then
		s:=s||' and pid is null';
	elseif (p is not null) then
		s:=s||' and pid='||p;
	end if;
	if not (h is null) then
		s:=s||' and house_id='||h;
	end if;
	if not (ex is null) then
		s:=s||' and not id='||ex;
	end if;
	if not (pa is null)	then
		if pa then
			s:=s||' and enddate is null';
		else
			s:=s||' and not (enddate is null)';
		end if;
	end if;
	s:=s||' and ((startdate::date<='||''''||d||''''||' and enddate::date>='||''''||d||''''||') or '||'(startdate::date<='||''''||d||''''||' and enddate is null))';
    s:=s||' and ((created::date<='||''''||d||''''||' and closed::date>='||''''||d||''''||') or '||'(created::date<='||''''||d||''''||' and closed is null))';
	execute s into i;
   	if ( i is null ) then
		return 0;
	end if;
    return i;
END
$$ LANGUAGE 'plpgsql';
CREATE OR REPLACE FUNCTION func_sub_pu_prl_cnt(h int, x int) RETURNS int AS
$$
declare
s text;
i int:=0;
BEGIN
	s:='select count(*) from v_pu where house_id = '||cast(h as text);
	s:=s||' and id not in (select subid from st_sub_pu) and not (id = '||cast(x as text)||')';
	execute s into i;
    return i;
END
$$ LANGUAGE 'plpgsql';
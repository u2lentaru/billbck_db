CREATE OR REPLACE FUNCTION func_sub_details_add(st int, sp boolean, sd text, sn text, sb text, shp int, shn text, sap int, san text, 
sad text, sph text, sst text, sac text, j text, e text, mp text, jp text, n text) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	insert into public.st_subjects (id, created, closed) values (default, to_date(sst, 'YYYY-mm-dd'), null) returning id into i;
	-- id not exist
	if ( i is null )
	then
		return 0;
	end if;
	insert into public.st_sub_details values (i, st, sp, sd, sn, sb, shp, shn, sap, san, sad, sph, to_date(sst, 'YYYY-mm-dd'), sac, 
	j, e, mp, jp, n);
	return i;
END
$$ LANGUAGE 'plpgsql';
CREATE OR REPLACE FUNCTION func_sub_details_upd(si int, st int, sp boolean, sd text, sn text, sb text, shp int, shn text, sap int, 
san text, sad text, sph text, sst text, sac text, j text, e text, mp text, jp text, n text) RETURNS int AS
$$
DECLARE
i int;
BEGIN
	update public.st_sub_details set (sub_type, sub_phys, sub_descr, sub_name, bin, head_pos, head_name, acc_pos, acc_name, 
    sub_address, sub_phone, created, sub_account, job, email, mob_phone, job_phone, notes ) = 
    (st, sp, sd, sn, sb, shp, shn, sap, san, sad, sph, to_date(sst, 'YYYY-mm-dd'), sac, j, e, mp, jp, n) 
	where sub_id = si returning sub_id into i;
	-- id not exist
	if ( i is null ) then
		return 0;
	end if;
	return i;
END
$$ LANGUAGE 'plpgsql';
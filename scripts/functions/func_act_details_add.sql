CREATE OR REPLACE FUNCTION func_act_details_add(ai int, pi int, sn text, apv numeric, dd text, pn text, pdd text, pci int, piv numeric, 
pds boolean, sd text, ed text, ppid int, si int, sdd text, nt text, pti int, ci int, cn text, sti int, cph text, cpo text, ri int, vi int, 
cu text) 
RETURNS int AS
$$
DECLARE
i int;
BEGIN
-- null ids!
	if pti = 0 
	then
		pti = null;
	end if;
	if si = 0 then
		si = null;
	end if;
	if ci = 0 then
		ci = null;
	end if;
	if sti = 0 then
		sti = null;
	end if;
	if ri = 0 then
		ri = null;
	end if;
	if vi = 0 then
		vi = null;
	end if;
	begin
		insert into public.wt_act_details (act_id, pu_id, seal_number, ad_pu_value, detail_date, pu_number, pu_install_date, pu_check_interval,
		pu_initial_value, pu_dev_stopped, startdate, enddate, pu_pid, seal_id, seal_date, notes, pu_type_id, conclusion_id, conclusion_num, 
		shutdown_type_id, customer_phone, customer_pos, reason_id, violation_id, customer) 
        values (ai, pi, sn, apv, to_date(dd, 'YYYY-mm-dd'), pn, to_date(pdd, 'YYYY-mm-dd'), pci, piv, pds, to_date(sd, 'YYYY-mm-dd'), 
		to_date(ed, 'YYYY-mm-dd'), ppid, si, to_date(sdd, 'YYYY-mm-dd'), nt, pti, ci, cn, sti, cph, cpo, ri, vi, cu) returning id into i;
	exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;
	return i;
END
$$ LANGUAGE 'plpgsql';
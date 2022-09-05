CREATE OR REPLACE FUNCTION func_act_details_tgr_ad() RETURNS trigger AS
$$
DECLARE
acttype int;
vd date;
BEGIN
    select act_type_id::int from public.wt_acts where id = OLD.act_id into acttype;
    if acttype = 3 THEN
        select act_date from public.wt_acts where id = OLD.act_id into vd;
        delete from public.wt_pu_values where pu_id = OLD.pu_id and value_date = vd;       
    END IF;
    return NEW;
END
$$ LANGUAGE 'plpgsql';
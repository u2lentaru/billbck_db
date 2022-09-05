CREATE OR REPLACE FUNCTION func_act_details_tgr_ai() RETURNS trigger AS
$$
DECLARE
acttype int; 
vd date;
BEGIN
    select act_type_id::int from public.wt_acts where id = NEW.act_id into acttype;
    if acttype = 3 THEN
        BEGIN
            select act_date from public.wt_acts where id = NEW.act_id into vd;
            insert into public.wt_pu_values (pu_id, value_date, pu_value)
            values (NEW.pu_id, vd, NEW.ad_pu_value);
        return NEW;
        EXCEPTION                   
            WHEN unique_violation THEN
            RAISE EXCEPTION 'PU value on this date already exist!';
        END;
    END IF;
END
$$ LANGUAGE 'plpgsql';
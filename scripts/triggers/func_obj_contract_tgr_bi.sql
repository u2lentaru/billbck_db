CREATE OR REPLACE FUNCTION func_obj_contract_tgr_bi() RETURNS trigger AS
$$
DECLARE
i int; 
BEGIN
    select count(*) from wt_obj_contract
    where obj_id = NEW.obj_id and enddate is null into i;
    if i > 0 THEN
            RAISE EXCEPTION 'Actual contract for this object already exist!';
    END IF;
    select count(*) from wt_obj_contract
    where obj_id = NEW.obj_id and 
    NEW.startdate <=  enddate into i;
    if i > 0 THEN
            RAISE EXCEPTION 'Contract in this period already exist!';
    END IF;
    return NEW;
END
$$ LANGUAGE 'plpgsql';
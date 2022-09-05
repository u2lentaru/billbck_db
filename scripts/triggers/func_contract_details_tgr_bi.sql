CREATE OR REPLACE FUNCTION func_contract_details_tgr_bi() RETURNS trigger AS
$$
DECLARE
i int; 
BEGIN
    select count(*) from wt_contract_details
    where contract_id = NEW.contract_id and enddate is null into i;
    if i > 0 THEN
            RAISE EXCEPTION 'Actual details for this contract already exist!';
    END IF;
    select count(*) from wt_contract_details
    where contract_id = NEW.contract_id and 
    NEW.startdate <=  enddate into i;
    if i > 0 THEN
            RAISE EXCEPTION 'Contract details in this period already exist!';
    END IF;
    return NEW;
END
$$ LANGUAGE 'plpgsql';
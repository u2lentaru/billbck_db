CREATE OR REPLACE FUNCTION func_street_names_tgr_bi() RETURNS trigger AS
$$
DECLARE
i int; 
BEGIN
    select count(*) from st_street_names
    where street_id = NEW.street_id and closed is null into i;
    if i > 0 THEN
            RAISE EXCEPTION 'Actual name for this street already exist!';
    END IF;
    select count(*) from st_street_names
    where street_id = NEW.street_id and 
    NEW.created <=  closed into i;
    if i > 0 THEN
            RAISE EXCEPTION 'Street name in this period already exist!';
    END IF;
    return NEW;
END
$$ LANGUAGE 'plpgsql';
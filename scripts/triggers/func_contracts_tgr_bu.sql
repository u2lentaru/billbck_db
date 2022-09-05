CREATE OR REPLACE FUNCTION func_contracts_tgr_bu() RETURNS trigger AS
$$
BEGIN
    IF NEW.startdate < OLD.startdate THEN
        RAISE EXCEPTION 'NEW startdate cannot be earlier than OLD startdate!';
    END IF;
    IF NEW.startdate = OLD.startdate THEN
        return NEW;
    END IF;
    insert into public.wt_contract_details 
    values (OLD.contract_id, OLD.contract_number, OLD.startdate, (NEW.startdate - INTERVAL '1 DAY')::date, OLD.customer_id, 
    OLD.сonsignee_id, OLD.eso_contract_number, OLD.eso_id, OLD.area_id, OLD.customer_group_id);
    return NEW;
END
$$ LANGUAGE 'plpgsql';
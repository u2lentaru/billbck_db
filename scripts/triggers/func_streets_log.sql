CREATE OR REPLACE FUNCTION func_streets_log() RETURNS trigger AS
$$
BEGIN
    IF NEW.created < OLD.created THEN
        RAISE EXCEPTION 'NEW CREATED cannot be earlier OLD CREATED!';
    END IF;
    insert into logs.streets_log
    select to_jsonb(q.*) from (select ssn.street_id, ssn.street_name, ssn.created , to_char(NEW.created - INTERVAL '1 DAY', 'YYYY-mm-dd') as closed from st_street_names ssn
    where OLD.street_id = ssn.street_id) as q;
    return NEW;
END
$$ LANGUAGE 'plpgsql';
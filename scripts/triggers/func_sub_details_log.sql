CREATE OR REPLACE FUNCTION func_sub_details_log() RETURNS trigger AS
$$
BEGIN
    insert into logs.sub_detail_log
    select to_jsonb(q.*) from (select vsd.*, to_char(NEW.created - INTERVAL '1 DAY', 'YYYY-mm-dd') as closed from v_sub_details vsd
    where OLD.sub_id = vsd.sub_id) as q;
    return NEW;
END
$$ LANGUAGE 'plpgsql';
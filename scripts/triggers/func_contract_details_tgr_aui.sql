CREATE OR REPLACE FUNCTION func_contract_details_tgr_aui() RETURNS trigger AS
$$
BEGIN
    insert into logs.contracts_log
    select to_jsonb(q.*) from (select clock_timestamp() as ts, '???' as username ,vc.* from v_contracts vc where OLD.contract_id = vc.id) as q;
    return NEW;
END
$$ LANGUAGE 'plpgsql';
CREATE OR REPLACE FUNCTION func_charges_run(period_id int) RETURNS int AS
$$
declare
maincur refcursor;
rec record;
sd text; ed text; spd text;
idc int; r int:= 0;
tvl numeric(10,3):=0;
tcl numeric(10,3):=0;
ll numeric(10,3):=0;
BEGIN

select lower(drperiod)::text, (upper(drperiod)-1)::text from st_periods where id = period_id into sd, ed;

--charge_type_id = 1
delete from wt_charges
where charge_date between to_date(sd, 'YYYY-mm-dd') and to_date(ed, 'YYYY-mm-dd') and charge_type_id = 1;

open maincur for select wpv.*, wp2.object_id, wp2.obj_type_id, voc3.contract_id, voc3.contract_number, 
voc3.startdate, voc3.enddate, voc3.cstartdate, voc3.cenddate 
from wt_pu_values wpv join wt_pu wp2 on wpv.pu_id = wp2.id 
left join v_obj_contracts voc3 on wp2.object_id = voc3.obj_id and wp2.obj_type_id = voc3.type_id 
where value_date between to_date(sd, 'YYYY-mm-dd') and to_date(ed, 'YYYY-mm-dd') and not voc3.contract_id is null
order by wpv.pu_id, wpv.value_date; 
loop
    fetch maincur into rec;    
    EXIT WHEN NOT FOUND;

    select enddate::text from wt_charges where pu_id = rec.pu_id and enddate <= to_date(ed, 'YYYY-mm-dd')
    order by enddate limit 1 into spd;
    if to_date(spd, 'YYYY-mm-dd') <= to_date(sd, 'YYYY-mm-dd') or spd is null then
        spd=sd;
    else
        spd=(to_date(spd, 'YYYY-mm-dd') + interval '1 day')::text;
    end if;
    
    -- trans_volt_loss
    select ratio 
    from v_obj_trans_volt
    where obj_id = rec.object_id and obj_type_id = rec.obj_type_id 
    and to_date(startdate, 'YYYY-mm-dd')<=to_date(spd, 'YYYY-mm-dd') and
    to_date(enddate, 'YYYY-mm-dd')>=rec.value_date
    into tvl;

    if tvl is null then
        tvl=0;
    end if;

    -- trans_curr_loss
    select ratio 
    from v_obj_trans_curr
    where obj_id = rec.object_id and obj_type_id = rec.obj_type_id 
    and to_date(startdate, 'YYYY-mm-dd')<=to_date(spd, 'YYYY-mm-dd') and
    to_date(enddate, 'YYYY-mm-dd')>=rec.value_date
    into tcl;

    if tcl is null then
        tcl=0;
    end if;

    -- line_loss
    select line_length*resistance 
    from v_obj_lines vol
    where obj_id = rec.object_id and obj_type_id = rec.obj_type_id
    into ll;

    if ll is null then
        ll=0;
    end if;

    INSERT INTO public.wt_charges 
    (id, charge_date, contract_id, obj_id, obj_type_id, pu_id, charge_type_id, qty, trans_loss, line_loss, startdate, enddate) 
    VALUES (default, to_date(ed, 'YYYY-mm-dd'), rec.contract_id, rec.object_id, rec.obj_type_id, rec.pu_id, 1, 
    func_balance_pu_sum(rec.pu_id::int, spd, rec.value_date::text), 
    func_balance_pu_sum(rec.pu_id::int, spd, rec.value_date::text)*(tvl+tcl), 
    func_balance_pu_sum(rec.pu_id::int, spd, rec.value_date::text)*ll, 
    to_date(spd, 'YYYY-mm-dd'), rec.value_date) 
    returning id into idc;

    RAISE notice 'wt_charges id : % ', idc;

    r=r+1;
end loop;
close maincur;

return r;
END
$$ LANGUAGE 'plpgsql';
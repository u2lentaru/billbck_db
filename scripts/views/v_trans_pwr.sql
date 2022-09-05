create or replace view v_trans_pwr as
select stp.id, stp.trans_pwr_name, stp.trans_pwr_type_id, stt.trans_pwr_type_name, stt.short_circuit_power, stt.idling_loss_power, stt.nominal_power
from st_trans_pwr stp join st_trans_pwr_types stt on stp.trans_pwr_type_id = stt.id;
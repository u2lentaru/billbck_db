create view v_tgu as
select wt.*, stt.tgu_type_name, iv.voltage_value as ivv, ov1.voltage_value as ov1v, ov2.voltage_value as ov2v, iv.voltage_name as ivn, 
ov1.voltage_name as ov1n, ov2.voltage_name as ov2n
from wt_tgu wt, st_tgu_types stt, func_voltage_get(input_voltage::int) iv, func_voltage_get(output_voltage1::int) ov1,
func_voltage_get(output_voltage2::int) ov2
where wt.tgu_type_id = stt.id
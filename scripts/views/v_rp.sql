create view v_rp as
select sr.*, svi.voltage_name as ivn, svi.voltage_value as ivv, svo1.voltage_name as ov1n, svo1.voltage_value as ov1v, 
svo2.voltage_name as ov2n, svo2.voltage_value as ov2v, vt.tp_name, vt.grp_id, vt.grp_name 
from st_rp sr, st_voltage svi , st_voltage svo1, st_voltage svo2, v_tp vt 
where sr.input_voltage = svi.id and sr.output_voltage1 = svo1.id and sr.output_voltage2 = svo2.id and sr.tp_id = vt.id 
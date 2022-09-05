create or replace view v_contracts as
select wc.*, wcd.*, custvsd.sub_name as custname, custvsd.sub_address as custaddress, consvsd.sub_name as consname, se.eso_name, sa.area_name, 
cg.customer_group_name, scm.contract_mot_name_ru, scm.contract_mot_name_kz 
from wt_contract_details wcd right join wt_contracts wc on wc.id = wcd.contract_id 
join v_sub_details custvsd on wcd.customer_id = custvsd.sub_id join v_sub_details consvsd on wcd.сonsignee_id = consvsd.sub_id 
join st_eso se on wcd.eso_id = se.id join st_areas sa on wcd.area_id = sa.id join st_customer_groups cg on wcd.customer_group_id = cg.id 
left join st_contract_mots scm on wcd.contract_mot_id = scm.id
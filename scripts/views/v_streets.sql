create view v_streets as
select ssn.street_id, ssn.street_name, to_char(ssn.created, 'YYYY-mm-dd') as created, to_char(ssn.closed, 'YYYY-mm-dd') as closed, 
sc.city_name, sc.id as cityid 
from st_street_names ssn,st_streets ss, st_cities sc 
where ssn.street_id = ss.id and ss.city_id = sc.id  
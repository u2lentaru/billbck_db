create view v_staff as
select sts.*, soi.name from st_staff sts, st_org_info soi where sts.org_id = soi.id;
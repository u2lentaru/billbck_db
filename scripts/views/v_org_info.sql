create view v_org_info as
select soi.*, sb.bank_name from st_org_info soi, st_banks sb where soi.bank_id = sb.id;
create or replace view v_sub_banks as
select ssb.*, ssd.sub_name, sb.bank_name from st_sub_banks ssb, st_banks sb, st_sub_details ssd
where ssb.sub_id = ssd.sub_id and ssb.bank_id = sb.id;
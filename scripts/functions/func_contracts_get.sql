CREATE OR REPLACE FUNCTION func_contracts_get(pg int, pgs int,n text,a text, ac boolean, cn text, cx int, ct int, cad text, csn text, en text, ecn text, an text, cgn text, cmr text, cmk text, ord int, dsc boolean) RETURNS setof v_tcontracts AS
$$
declare
s text;
BEGIN
	s:='select id, bar_code, personal_account, contract_id, contract_number, startdate::text, enddate::text, customer_id, сonsignee_id,';
	s:=s||' eso_contract_number, eso_id, area_id, customer_group_id, contract_mot_id, notes, motnotes, custname, custaddress, consname,';
	s:=s||' eso_name, area_name, customer_group_name, contract_mot_name_ru, contract_mot_name_kz from v_contracts';
	s:=s||' where contract_number ilike '||''''||n||'%'||''''||' and personal_account::text ilike '||''''||a||'%'||'''';
	s:=s||' and custname ilike '||''''||cn||'%'||''''||' and custaddress ilike '||''''||cad||'%'||'''';
	s:=s||' and consname ilike '||''''||csn||'%'||''''||' and eso_name ilike '||''''||en||'%'||'''';
	s:=s||' and eso_contract_number ilike '||''''||ecn||'%'||''''||' and area_name ilike '||''''||an||'%'||'''';
	s:=s||' and customer_group_name ilike '||''''||cgn||'%'||'''';
	-- s:=s||' and customer_group_name ilike '||''''||cgn||'%'||''''||' and contract_mot_name_ru ilike '||''''||cmr||'%'||'''';
	-- s:=s||' and contract_mot_name_kz ilike '||''''||cmk||'%'||'''';
	if not (cmr is null) then
		s:=s||' and contract_mot_name_ru ilike '||''''||cmr||'%'||'''';
	end if;
	if not (cmk is null) then
		s:=s||' and contract_mot_name_kz ilike '||''''||cmk||'%'||'''';
	end if;
	if not (cx is null)	then
		s:=s||' and customer_id='||cx::text;
	end if;
	if not (ct is null)	then
		s:=s||' and customer_id in (select sub_id from v_sub_details where sub_type='||ct::text||')';
	end if;
	-- s:=s||' and ((startdate<='||''''||d||''''||' and enddate>='||''''||d||''''||') or '||'(startdate<='||''''||d||''''||' and enddate is null))';
	if not (ac is null)	then
		if ac then
			s:=s||' and enddate is null';
		else
			s:=s||' and not (enddate is null)';
		end if;
	end if;
    s:=s||' order by '||ord;
	if dsc then
		s:=s||' desc';
	end if;
	s:=s||' limit '||pgs||' offset '||(pg-1)*pgs;
	return query execute s;
END
$$ LANGUAGE 'plpgsql';
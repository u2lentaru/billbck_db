CREATE OR REPLACE FUNCTION func_orgs_info_del(ioi int) RETURNS int AS
$$
declare
i int :=0;
BEGIN
	begin
		delete from public.st_org_info where id=ioi returning id into i;
	exception 
		when foreign_key_violation then
			return 0;
		when others then
			return 0;
	end;
	if ( i is null )
	then
		return 0;
	end if;
	return i;
END
$$ LANGUAGE 'plpgsql';
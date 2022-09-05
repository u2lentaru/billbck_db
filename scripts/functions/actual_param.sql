CREATE OR REPLACE FUNCTION actual_param(clcode INT, pcode text) returns SETOF text AS $$
BEGIN
 return query select value 
 			  from client_params
 			  where client_id = clcode 
 			  and param_code = pcode
 			  and closed  is null;
 if not found then
 	return query select null;
 end if;
END
$$ LANGUAGE 'plpgsql';
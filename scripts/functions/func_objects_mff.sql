CREATE OR REPLACE FUNCTION func_objects_mff(x int) RETURNS wt_objects AS
$$
DECLARE
ret wt_objects;
BEGIN
	select * from public.wt_objects where house_id = x and obj_type_id = 1 into ret;
    return ret;
END
$$ LANGUAGE 'plpgsql';
CREATE OR REPLACE FUNCTION func_test(n text, dsc boolean) RETURNS setof st_areas AS
$$
declare
s text;
BEGIN
--  CREATE OR REPLACE FUNCTION list(
-- ...
-- in_use_asc boolean default false,
-- _order_by varchar(100)
-- ..
-- ..
-- CREATE TEMPORARY TABLE tempHolder ON COMMIT DROP AS
-- SELECT SELECT id, name, clientname, count(*) OVER() AS full_count
--       FROM   design_list
--       WHERE ($1 = $2 OR category ILIKE $1);

--      IF in_use_asc = TRUE THEN
--         RETURN QUERY SELECT * FROM tempHolder ORDER BY _order_by asc LIMIT {} OFFSET {};
--     ELSE 
--         RETURN QUERY SELECT * FROM tempHolder ORDER BY _order_by desc LIMIT {} OFFSET {};
--     END IF;
------------------------------------------------------------------------------
------------------------------------------------------------------------------
--    RETURN QUERY EXECUTE format(
--      'SELECT id, name, clientname, count(*) OVER() AS full_count
--       FROM   design_list
--       WHERE ($1 = $2 OR category ILIKE $1) 
--       ORDER  BY %I %s
--       LIMIT  %s
--       OFFSET %s'
--     , _order_by, _order_asc_desc, _limit, _offset)
--    USING _category, _empty;
END
$$ LANGUAGE 'plpgsql';
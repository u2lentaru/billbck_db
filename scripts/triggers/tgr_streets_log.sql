CREATE TRIGGER tgr_streets_log
  BEFORE UPDATE
  ON public.st_street_names
  FOR EACH ROW
  EXECUTE PROCEDURE func_streets_log();
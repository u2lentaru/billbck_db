CREATE TRIGGER tgr_sub_details_log
  BEFORE UPDATE
  ON public.st_sub_details
  FOR EACH ROW
  EXECUTE PROCEDURE func_sub_details_log();
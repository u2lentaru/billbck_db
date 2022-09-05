CREATE TRIGGER tgr_street_names_bi
  BEFORE INSERT
  ON public.st_street_names
  FOR EACH ROW
  EXECUTE PROCEDURE func_street_names_tgr_bi();
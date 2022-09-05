CREATE TRIGGER tgr_contract_details_aiu
  AFTER INSERT OR UPDATE
  ON public.wt_contract_details
  FOR EACH ROW
  EXECUTE PROCEDURE func_contract_details_tgr_aui();
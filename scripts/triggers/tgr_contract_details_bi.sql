CREATE TRIGGER tgr_contract_details_bi
  BEFORE INSERT
  ON public.wt_contract_details
  FOR EACH ROW
  EXECUTE PROCEDURE func_contract_details_tgr_bi();
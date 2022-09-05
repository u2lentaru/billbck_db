CREATE TRIGGER tgr_contracts_bu
  BEFORE UPDATE
  ON public.wt_contract_details
  FOR EACH ROW
  EXECUTE PROCEDURE func_contracts_tgr_bu();
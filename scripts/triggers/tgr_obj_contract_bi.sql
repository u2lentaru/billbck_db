CREATE TRIGGER tgr_obj_contract_bi
  BEFORE INSERT
  ON public.wt_obj_contract
  FOR EACH ROW
  EXECUTE PROCEDURE func_obj_contract_tgr_bi();
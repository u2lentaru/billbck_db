--disabled
CREATE TRIGGER tgr_act_details_ad
  AFTER DELETE
  ON public.wt_act_details
  FOR EACH ROW
  EXECUTE PROCEDURE func_act_details_tgr_ad();
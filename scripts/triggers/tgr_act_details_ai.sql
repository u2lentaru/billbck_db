--disabled
CREATE TRIGGER tgr_act_details_ai
  AFTER INSERT
  ON public.wt_act_details
  FOR EACH ROW
  EXECUTE PROCEDURE func_act_details_tgr_ai();
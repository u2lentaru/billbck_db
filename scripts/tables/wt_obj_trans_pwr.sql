CREATE TABLE public.wt_obj_trans_pwr (
    id int NOT NULL GENERATED ALWAYS AS IDENTITY,
    obj_id int NOT NULL,
    obj_type_id int NOT NULL, -- obj - 0, tgu > 0 (st_tgu_types(id))
    trans_pwr_id int NOT NULL,
    startdate date NOT NULL,
    enddate date,
    CONSTRAINT wt_obj_trans_pwr_pk PRIMARY KEY (id)
);

ALTER TABLE public.wt_obj_trans_pwr ADD CONSTRAINT wt_obj_trans_pwr_enddate_check CHECK (enddate >= startdate);
ALTER TABLE public.wt_obj_trans_pwr ADD CONSTRAINT wt_obj_trans_pwr_id_st_trans_pwr_fkey FOREIGN KEY (trans_pwr_id) REFERENCES st_trans_pwr(id);
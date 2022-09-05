CREATE TABLE public.wt_obj_trans_volt (
    id int NOT NULL GENERATED ALWAYS AS IDENTITY,
    obj_id int NOT NULL,
    obj_type_id int NOT NULL, -- obj - 0, tgu > 0 (st_tgu_types(id))
    trans_volt_id int NOT NULL,
    startdate date NOT NULL,
    enddate date,
    CONSTRAINT wt_obj_trans_volt_pk PRIMARY KEY (id)
);

ALTER TABLE public.wt_obj_trans_volt ADD CONSTRAINT wt_obj_trans_volt_enddate_check CHECK (enddate >= startdate);
ALTER TABLE public.wt_obj_trans_volt ADD CONSTRAINT wt_obj_trans_volt_id_st_trans_volt_fkey FOREIGN KEY (trans_volt_id) REFERENCES st_trans_volt(id);
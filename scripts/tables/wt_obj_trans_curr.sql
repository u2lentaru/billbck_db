CREATE TABLE public.wt_obj_trans_curr (
    id int NOT NULL GENERATED ALWAYS AS IDENTITY,
    obj_id int NOT NULL,
    obj_type_id int NOT NULL, -- obj - 0, tgu > 0 (st_tgu_types(id))
    trans_curr_id int NOT NULL,
    startdate date NOT NULL,
    enddate date,
    CONSTRAINT wt_obj_trans_curr_pk PRIMARY KEY (id)
);

ALTER TABLE public.wt_obj_trans_curr ADD CONSTRAINT wt_obj_trans_curr_enddate_check CHECK (enddate >= startdate);
ALTER TABLE public.wt_obj_trans_curr ADD CONSTRAINT wt_obj_trans_curr_id_st_trans_curr_fkey FOREIGN KEY (trans_curr_id) REFERENCES st_trans_curr(id);
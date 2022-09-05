CREATE TABLE public.wt_charges (
    id int NOT NULL GENERATED ALWAYS AS IDENTITY,
    charge_date date NOT NULL,
    contract_id int NOT NULL,
    obj_id int NOT NULL,
    obj_type_id int NOT NULL, -- obj - 0, tgu > 0 (st_tgu_types(id))
    pu_id int NOT NULL,
    charge_type_id int NOT NULL,
    qty numeric NOT NULL,
    trans_loss numeric(10,1) NOT NULL,
    line_loss numeric(10,1) NOT NULL,
    startdate date NOT NULL,
    enddate date NOT NULL,
    CONSTRAINT wt_charges_pk PRIMARY KEY (id)
);

ALTER TABLE public.wt_charges ADD CONSTRAINT wt_charges_id_wt_contracts_fkey FOREIGN KEY (contract_id) REFERENCES wt_contracts(id);
ALTER TABLE public.wt_charges ADD CONSTRAINT wt_charges_id_wt_objects_fkey FOREIGN KEY (obj_id) REFERENCES wt_objects(id);
ALTER TABLE public.wt_charges ADD CONSTRAINT wt_charges_id_wt_pu_fkey FOREIGN KEY (pu_id) REFERENCES wt_pu(id);
ALTER TABLE public.wt_charges ADD CONSTRAINT wt_charges_id_st_charge_types_fkey FOREIGN KEY (charge_type_id) REFERENCES st_charge_types(id);
ALTER TABLE public.wt_charges ADD CONSTRAINT wt_charges_enddate_check CHECK (enddate >= startdate);

COMMENT ON TABLE public.wt_charges is 'In ER schema wt_nach';
CREATE TABLE public.wt_obj_contract (
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
    contract_id bigint NOT NULL,
    obj_id bigint NOT NULL,
    type_id int NOT NULL, -- obj - 0, tgu > 0 (st_tgu_types(id))
    startdate date NOT NULL, 
    enddate date,
    CONSTRAINT wt_obj_contract_pk PRIMARY KEY (id)
);

ALTER TABLE public.wt_obj_contract ADD CONSTRAINT wt_obj_contract_id_wt_contracts_fkey FOREIGN KEY (contract_id) REFERENCES wt_contracts(id);
ALTER TABLE public.wt_obj_contract ADD CONSTRAINT wt_obj_contract_id_wt_objects_fkey FOREIGN KEY (obj_id) REFERENCES wt_objects(id);
ALTER TABLE public.wt_obj_contract ADD CONSTRAINT wt_obj_contract_enddate_check CHECK (enddate >= startdate);


COMMENT ON TABLE public.wt_obj_contract is 'In ER schema wt_obj_dog';
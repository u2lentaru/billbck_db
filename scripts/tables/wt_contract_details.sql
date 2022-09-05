CREATE TABLE public.wt_contract_details (
    contract_id bigint NOT NULL,
    -- contract_type_id int NOT NULL,
    contract_number text NOT NULL,
    startdate date NOT NULL,
    enddate date,
    customer_id bigint NOT NULL,
    сonsignee_id bigint NOT NULL,
    eso_contract_number text NOT NULL, 
    eso_id bigint NOT NULL,
    area_id bigint NOT NULL,
    customer_group_id bigint NOT NULL,
    contract_mot_id int,
    notes text,
    motnotes text
);

ALTER TABLE public.wt_contract_details ADD CONSTRAINT wt_contract_details_id_wt_contracts_fkey FOREIGN KEY (contract_id) REFERENCES wt_contracts(id);
ALTER TABLE public.wt_contract_details ADD CONSTRAINT wt_contract_details_customer_id_st_subjects_fkey FOREIGN KEY (customer_id) REFERENCES st_subjects(id);
ALTER TABLE public.wt_contract_details ADD CONSTRAINT wt_contract_details_сonsignee_id_st_subjects_fkey FOREIGN KEY (сonsignee_id) REFERENCES st_subjects(id);
ALTER TABLE public.wt_contract_details ADD CONSTRAINT wt_contract_details_id_st_eso_fkey FOREIGN KEY (eso_id) REFERENCES st_eso(id);
ALTER TABLE public.wt_contract_details ADD CONSTRAINT wt_contract_details_id_st_area_fkey FOREIGN KEY (area_id) REFERENCES st_areas(id);
ALTER TABLE public.wt_contract_details ADD CONSTRAINT wt_contract_details_id_st_customer_groups_fkey FOREIGN KEY (customer_group_id) REFERENCES st_customer_groups(id);
ALTER TABLE public.wt_contract_details ADD CONSTRAINT wt_contract_details_id_st_contract_mots_fkey FOREIGN KEY (contract_mot_id) REFERENCES st_contract_mots(id);

ALTER TABLE public.wt_contract_details ADD CONSTRAINT wt_contract_enddate_check CHECK (enddate >= startdate);

COMMENT ON TABLE public.wt_contract_details is 'In ER schema wt_dogovor_rekvizit';
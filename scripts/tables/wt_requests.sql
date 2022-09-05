CREATE TABLE public.wt_requests (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
	request_number text NOT NULL,
    request_date date NOT NULL,
    contract_id bigint,
    service_type_id int NOT NULL,
    request_type_id int NOT NULL,
    request_kind_id int NOT NULL,
    claim_type_id int,
    term_date date NOT NULL,
    executive text NOT NULL,
    accept text NOT NULL,
    notes text,
    result_id int NOT NULL,
    act_id bigint,
    obj_id bigint,
	CONSTRAINT wt_requests_pk PRIMARY KEY (id)
);

ALTER TABLE public.wt_requests ADD CONSTRAINT wt_requests_id_wt_contracts_fkey FOREIGN KEY (contract_id) REFERENCES wt_contracts(id);
ALTER TABLE public.wt_requests ADD CONSTRAINT wt_requests_id_st_service_types_fkey FOREIGN KEY (service_type_id) REFERENCES st_service_types(id);
ALTER TABLE public.wt_requests ADD CONSTRAINT wt_requests_id_st_request_types_fkey FOREIGN KEY (request_type_id) REFERENCES st_request_types(id);
ALTER TABLE public.wt_requests ADD CONSTRAINT wt_requests_id_st_request_kinds_fkey FOREIGN KEY (request_kind_id) REFERENCES st_request_kinds(id);
ALTER TABLE public.wt_requests ADD CONSTRAINT wt_requests_id_st_claim_types_fkey FOREIGN KEY (claim_type_id) REFERENCES st_claim_types(id);
ALTER TABLE public.wt_requests ADD CONSTRAINT wt_requests_id_st_results_fkey FOREIGN KEY (result_id) REFERENCES st_results(id);
ALTER TABLE public.wt_requests ADD CONSTRAINT wt_requests_id_wt_acts_fkey FOREIGN KEY (act_id) REFERENCES wt_acts(id);
ALTER TABLE public.wt_requests ADD CONSTRAINT wt_requests_id_wt_objects_fkey FOREIGN KEY (obj_id) REFERENCES wt_objects(id);
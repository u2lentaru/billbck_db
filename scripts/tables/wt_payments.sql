CREATE TABLE public.wt_payments (
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
    payment_date date NOT NULL,
    contract_id bigint NOT NULL,
    obj_id bigint NOT NULL,
    payment_type_id bigint NOT NULL,
    charge_type_id bigint NOT NULL,
    cashdesk_id bigint NOT NULL,
    bundle_number bigint NOT NULL,
    amount numeric NOT NULL,
    CONSTRAINT wt_payments_pk PRIMARY KEY (id)
);

ALTER TABLE public.wt_payments ADD CONSTRAINT wt_payments_id_wt_contracts_fkey FOREIGN KEY (contract_id) REFERENCES wt_contracts(id);
ALTER TABLE public.wt_payments ADD CONSTRAINT wt_payments_id_wt_objects_fkey FOREIGN KEY (obj_id) REFERENCES wt_objects(id);
ALTER TABLE public.wt_payments ADD CONSTRAINT wt_payments_id_st_payment_types_fkey FOREIGN KEY (payment_type_id) REFERENCES st_payment_types(id);
ALTER TABLE public.wt_payments ADD CONSTRAINT wt_payments_id_st_charge_types_fkey FOREIGN KEY (charge_type_id) REFERENCES st_charge_types(id);
ALTER TABLE public.wt_payments ADD CONSTRAINT wt_payments_id_st_cashdesks_fkey FOREIGN KEY (cashdesk_id) REFERENCES st_cashdesks(id);

COMMENT ON TABLE public.wt_payments is 'In ER schema wt_oplata';
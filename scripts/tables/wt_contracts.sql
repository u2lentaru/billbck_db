CREATE TABLE public.wt_contracts (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
	personal_account numeric(12) NOT NULL, 
    bar_code text NOT NULL,
	CONSTRAINT wt_contracts_pk PRIMARY KEY (id)
);

COMMENT ON TABLE public.wt_contracts is 'In ER schema wt_dogovor';
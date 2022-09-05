CREATE TABLE public.st_contract_mots (
	id int NOT NULL GENERATED ALWAYS AS IDENTITY,
	contract_mot_name_ru text NOT NULL,
    contract_mot_name_kz text NOT NULL,
	CONSTRAINT st_contract_mots_pk PRIMARY KEY (id)
);
COMMENT ON TABLE public.st_contract_mots is 'Contract motive of termination';
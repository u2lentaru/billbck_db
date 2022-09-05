CREATE TABLE public.st_contract_types (
	id int NOT NULL GENERATED ALWAYS AS IDENTITY,
	contract_type_name text NOT NULL,
	CONSTRAINT st_contract_types_pk PRIMARY KEY (id)
);
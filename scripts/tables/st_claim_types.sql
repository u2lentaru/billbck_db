CREATE TABLE public.st_claim_types (
	id int NOT NULL GENERATED ALWAYS AS IDENTITY,
	claim_type_name text NOT NULL,
	CONSTRAINT st_claim_types_pk PRIMARY KEY (id)
);
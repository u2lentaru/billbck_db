CREATE TABLE public.st_seal_types (
	id int NOT NULL GENERATED ALWAYS AS IDENTITY,
	seal_type_name text NOT NULL,
	CONSTRAINT st_seal_types_pk PRIMARY KEY (id)
);
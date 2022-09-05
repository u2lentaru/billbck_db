CREATE TABLE public.st_pu_value_types (
	id int NOT NULL GENERATED ALWAYS AS IDENTITY,
	pu_value_type_name text NOT NULL,
	CONSTRAINT st_pu_value_types_pk PRIMARY KEY (id)
);
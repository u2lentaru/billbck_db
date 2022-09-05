CREATE TABLE public.st_calculation_types (
	id int NOT NULL GENERATED ALWAYS AS IDENTITY,
	calculation_type_name text NOT NULL,
	CONSTRAINT st_calculation_types_pk PRIMARY KEY (id)
);
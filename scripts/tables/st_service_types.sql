CREATE TABLE public.st_service_types (
	id int NOT NULL GENERATED ALWAYS AS IDENTITY,
	service_type_name text NOT NULL,
	CONSTRAINT st_service_types_pk PRIMARY KEY (id)
);
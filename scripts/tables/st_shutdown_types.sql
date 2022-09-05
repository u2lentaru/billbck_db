CREATE TABLE public.st_shutdown_types (
	id int NOT NULL GENERATED ALWAYS AS IDENTITY,
	shutdown_type_name text NOT NULL,
	CONSTRAINT st_shutdown_types_pk PRIMARY KEY (id)
);
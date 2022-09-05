CREATE TABLE public.st_tgu_types (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
	tgu_type_name text NOT NULL,
	CONSTRAINT st_tgu_types_pk PRIMARY KEY (id)
);
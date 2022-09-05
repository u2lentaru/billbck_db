CREATE TABLE public.st_input_types (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
	input_type_name text NOT NULL,
	CONSTRAINT st_input_types_pk PRIMARY KEY (id)
);

COMMENT ON TABLE public.st_input_types is 'In ER schema st_input_type';
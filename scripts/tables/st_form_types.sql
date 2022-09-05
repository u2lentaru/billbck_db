CREATE TABLE public.st_form_types (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
	form_type_name text NOT NULL,
	form_type_descr text NOT NULL,
	CONSTRAINT st_form_types_pk PRIMARY KEY (id)
);

COMMENT ON TABLE public.st_form_types is 'In ER schema st_form_types';
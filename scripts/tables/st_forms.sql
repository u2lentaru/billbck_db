CREATE TABLE public.st_forms (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
	form_name text NOT NULL,
	form_descr text NOT NULL,
    form_type_id bigint NOT NULL,
    form_url text NOT NULL,
	CONSTRAINT st_forms_pk PRIMARY KEY (id)
);

ALTER TABLE public.st_forms ADD CONSTRAINT st_forms_id_st_form_types_fkey FOREIGN KEY (form_type_id) REFERENCES st_form_types(id);

COMMENT ON TABLE public.st_forms is 'In ER schema st_forms';
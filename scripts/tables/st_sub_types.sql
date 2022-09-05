CREATE TABLE public.st_sub_types (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
	type_descr text NOT NULL,
	type_name text NOT NULL,
	CONSTRAINT st_sub_types_pk PRIMARY KEY (id)
);

COMMENT ON TABLE public.st_sub_types is 'In ER schema st_sub_fs';

CREATE TABLE public.st_obj_types (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY, --fixed 1 - MFF, 2 -SubMFF
	obj_type_name text NOT NULL,
	CONSTRAINT st_obj_types_pk PRIMARY KEY (id)
);

COMMENT ON TABLE public.st_obj_types is 'In ER schema st_obj_type';
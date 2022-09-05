CREATE TABLE public.st_act_types (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
	act_type_name text NOT NULL,
	CONSTRAINT st_act_types_pk PRIMARY KEY (id)
);

COMMENT ON TABLE public.st_act_types is 'In ER schema st_tip_akt';
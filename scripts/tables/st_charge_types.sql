CREATE TABLE public.st_charge_types (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
	charge_type_name text NOT NULL,
	CONSTRAINT st_charge_types_pk PRIMARY KEY (id)
);

COMMENT ON TABLE public.st_charge_types is 'In ER schema st_tip_nach';
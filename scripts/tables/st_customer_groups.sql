CREATE TABLE public.st_customer_groups (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
	customer_group_name text NOT NULL,
	CONSTRAINT st_customer_groups_pk PRIMARY KEY (id)
);

COMMENT ON TABLE public.st_customer_groups is 'In ER schema st_gr_potreb';
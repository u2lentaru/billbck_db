CREATE TABLE public.st_tariff_groups (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
	tariff_group_name text NOT NULL,
	CONSTRAINT st_tariff_groups_pk PRIMARY KEY (id)
);

COMMENT ON TABLE public.st_tariff_groups is 'In ER schema st_gr_tarif';
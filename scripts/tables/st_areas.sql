CREATE TABLE public.st_areas (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
	area_number text NOT NULL,
	area_name text NOT NULL,
	CONSTRAINT st_area_pk PRIMARY KEY (id)
);

COMMENT ON TABLE public.st_areas is 'In ER schema st_uchastok';
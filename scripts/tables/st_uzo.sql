CREATE TABLE public.st_uzo (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
	uzo_name text NOT NULL,
	uzo_value int NOT NULL,
	CONSTRAINT st_uzo_pk PRIMARY KEY (id)
);

COMMENT ON TABLE public.st_uzo is 'In ER schema st_uzo';
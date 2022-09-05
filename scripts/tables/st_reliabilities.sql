CREATE TABLE public.st_reliabilities (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
	reliability_name text NOT NULL,
	CONSTRAINT st_reliabilities_pk PRIMARY KEY (id)
);

COMMENT ON TABLE public.st_reliabilities is 'In ER schema st_reliability';
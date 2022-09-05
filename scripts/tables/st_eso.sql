CREATE TABLE public.st_eso (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
	eso_name text NOT NULL,
	CONSTRAINT st_eso_pk PRIMARY KEY (id)
);

COMMENT ON TABLE public.st_eso is 'In ER schema st_eso';
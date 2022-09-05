CREATE TABLE public.st_positions (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
	position_name text NOT NULL,
	CONSTRAINT st_positions_pk PRIMARY KEY (id)
);

COMMENT ON TABLE public.st_positions is 'In ER schema st_dol';

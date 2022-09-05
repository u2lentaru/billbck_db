CREATE TABLE public.st_seal_colours (
	id int NOT NULL GENERATED ALWAYS AS IDENTITY,
	seal_colour_name text NOT NULL,
	CONSTRAINT st_seal_colours_pk PRIMARY KEY (id)
);
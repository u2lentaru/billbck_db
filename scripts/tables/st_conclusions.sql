CREATE TABLE public.st_conclusions (
	id int NOT NULL GENERATED ALWAYS AS IDENTITY,
	conclusion_name text NOT NULL,
	CONSTRAINT st_conclusions_pk PRIMARY KEY (id)
);
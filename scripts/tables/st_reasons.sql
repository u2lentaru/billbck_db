CREATE TABLE public.st_reasons (
	id int NOT NULL GENERATED ALWAYS AS IDENTITY,
	reason_name text NOT NULL,
	CONSTRAINT st_reasons_pk PRIMARY KEY (id)
);
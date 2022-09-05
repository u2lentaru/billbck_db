CREATE TABLE public.st_tpu (
	id int NOT NULL GENERATED ALWAYS AS IDENTITY,
	tpu_name text NOT NULL,
	CONSTRAINT st_tpu_pk PRIMARY KEY (id)
);
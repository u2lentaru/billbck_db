CREATE TABLE public.st_violations (
	id int NOT NULL GENERATED ALWAYS AS IDENTITY,
	violation_name text NOT NULL,
	CONSTRAINT st_violations_pk PRIMARY KEY (id)
);
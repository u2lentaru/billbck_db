CREATE TABLE public.st_results (
	id int NOT NULL GENERATED ALWAYS AS IDENTITY,
	result_name text NOT NULL,
	CONSTRAINT st_results_pk PRIMARY KEY (id)
);
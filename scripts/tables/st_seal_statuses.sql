CREATE TABLE public.st_seal_statuses (
	id int NOT NULL GENERATED ALWAYS AS IDENTITY,
	seal_status_name text NOT NULL,
	CONSTRAINT st_seal_statuses_pk PRIMARY KEY (id)
);
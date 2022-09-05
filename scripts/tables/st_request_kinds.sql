CREATE TABLE public.st_request_kinds (
	id int NOT NULL GENERATED ALWAYS AS IDENTITY,
	request_kind_name text NOT NULL,
	CONSTRAINT st_request_kinds_pk PRIMARY KEY (id)
);
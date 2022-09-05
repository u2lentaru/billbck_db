CREATE TABLE public.st_request_types (
	id int NOT NULL GENERATED ALWAYS AS IDENTITY,
	request_kind_id int NOT NULL,
	request_type_name text NOT NULL,
	CONSTRAINT st_request_types_pk PRIMARY KEY (id)
);

ALTER TABLE public.st_request_types ADD CONSTRAINT st_request_types_id_st_request_kinds_fkey FOREIGN KEY (request_kind_id) REFERENCES st_request_kinds(id);
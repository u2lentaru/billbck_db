CREATE TABLE public.st_obj_statuses (
	id int NOT NULL GENERATED ALWAYS AS IDENTITY,
	obj_status_name text NOT NULL,
	CONSTRAINT st_obj_statuses_pk PRIMARY KEY (id)
);
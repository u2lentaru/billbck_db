CREATE TABLE public.st_order_types (
	id int NOT NULL GENERATED ALWAYS AS IDENTITY,
	order_type_name text NOT NULL,
	CONSTRAINT st_order_types_pk PRIMARY KEY (id)
);
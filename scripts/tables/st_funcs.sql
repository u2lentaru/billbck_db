CREATE TABLE public.st_funcs (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
	func_name text NOT NULL,
	func_descr text NOT NULL,
	CONSTRAINT st_funcs_pk PRIMARY KEY (id)
);
CREATE TABLE public.st_trans_types (
	id int NOT NULL GENERATED ALWAYS AS IDENTITY,
	trans_type_name text NOT NULL,
	ratio int NOT NULL,
	class int NOT NULL,
	maxcurr int NOT NULL,
	nomcurr int NOT NULL,
	CONSTRAINT st_trans_types_pk PRIMARY KEY (id)
);

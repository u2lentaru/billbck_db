CREATE TABLE public.st_grp (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
	grp_name text NOT NULL,
	CONSTRAINT st_grp_pk PRIMARY KEY (id)
);

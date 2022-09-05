CREATE TABLE public.st_tp (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
	tp_name text NOT NULL,
    grp_id bigint NOT NULL,
	CONSTRAINT st_tp_pk PRIMARY KEY (id)
);

ALTER TABLE public.st_tp ADD CONSTRAINT st_tp_id_st_grp_fkey FOREIGN KEY (grp_id) REFERENCES st_grp(id);

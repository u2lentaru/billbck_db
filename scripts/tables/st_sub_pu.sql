CREATE TABLE public.st_sub_pu (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
    parid bigint NOT NULL,
    subid bigint NOT NULL
);

ALTER TABLE public.st_sub_pu ADD CONSTRAINT st_sub_pu_parid_wt_pu_fkey FOREIGN KEY (parid) REFERENCES wt_pu(id);
ALTER TABLE public.st_sub_pu ADD CONSTRAINT st_sub_pu_subid_wt_pu_fkey FOREIGN KEY (subid) REFERENCES wt_pu(id);

COMMENT ON TABLE public.wt_pu is 'sub pu links';
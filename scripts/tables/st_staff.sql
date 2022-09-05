CREATE TABLE public.st_staff (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
	staff_name text NOT NULL,
    org_id bigint NOT NULL,
	phone text,
	notes text,
	CONSTRAINT st_staff_pk PRIMARY KEY (id)
);

ALTER TABLE public.st_staff ADD CONSTRAINT st_staff_id_st_org_info_fkey FOREIGN KEY (org_id) REFERENCES st_org_info(id);
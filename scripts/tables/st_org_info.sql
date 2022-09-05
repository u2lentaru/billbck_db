CREATE TABLE public.st_org_info (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
	name text NOT NULL,
	full_name text NOT NULL,
	bin char(12) NOT NULL,
	address text NOT NULL,
	bank_id bigint NOT NULL,
	account_number text NOT NULL,
	CONSTRAINT st_org_info_pk PRIMARY KEY (id)
);


ALTER TABLE public.st_org_info ADD CONSTRAINT st_org_info_id_st_banks_fkey FOREIGN KEY (bank_id) REFERENCES st_banks(id);

COMMENT ON TABLE public.st_org_info is 'In ER schema st_org_rekvizit';
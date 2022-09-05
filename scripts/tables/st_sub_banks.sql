CREATE TABLE public.st_sub_banks (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
	sub_id bigint NOT NULL,
	bank_id bigint NOT NULL,
	account_number text NOT NULL,
	active boolean NOT NULL,
	CONSTRAINT st_sub_banks_pk PRIMARY KEY (id)
);

ALTER TABLE public.st_sub_banks ADD CONSTRAINT st_sub_banks_id_st_subjects_fkey FOREIGN KEY (sub_id) REFERENCES st_subjects(id);
ALTER TABLE public.st_sub_banks ADD CONSTRAINT st_sub_banks_id_st_banks_fkey FOREIGN KEY (bank_id) REFERENCES st_banks(id);
COMMENT ON TABLE public.st_sub_banks is 'In ER schema st_sub_bank';
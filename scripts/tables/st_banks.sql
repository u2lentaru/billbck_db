CREATE TABLE public.st_banks (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
	bank_descr text NOT NULL,
	bank_name text NOT NULL,
	mfo text NOT NULL,
	CONSTRAINT st_banks_pk PRIMARY KEY (id)
);

COMMENT ON TABLE public.st_banks is 'In ER schema st_bank';

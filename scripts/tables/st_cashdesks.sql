CREATE TABLE public.st_cashdesks (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
	cashdesk_name text NOT NULL,
	CONSTRAINT st_cashdesks_pk PRIMARY KEY (id)
);

COMMENT ON TABLE public.st_cashdesks is 'In ER schema st_kassa';
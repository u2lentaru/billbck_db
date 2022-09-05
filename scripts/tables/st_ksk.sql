CREATE TABLE public.st_ksk (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
	ksk_name text NOT NULL,
	ksk_address text NOT NULL,
	ksk_head text NOT NULL,
	ksk_phone text NOT NULL,
	CONSTRAINT st_ksk_pk PRIMARY KEY (id)
);

COMMENT ON TABLE public.st_ksk is 'In ER schema st_ksk';
CREATE TABLE public.st_langs (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
	lang_name text NOT NULL,
	lang_descr text NOT NULL,
	CONSTRAINT st_langs_pk PRIMARY KEY (id)
);

COMMENT ON TABLE public.st_langs is 'In ER schema st_lang';
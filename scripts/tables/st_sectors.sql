CREATE TABLE public.st_sectors (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
	sector_name text NOT NULL,
	CONSTRAINT st_sector_pk PRIMARY KEY (id)
);

COMMENT ON TABLE public.st_sectors is 'In ER schema st_sector';
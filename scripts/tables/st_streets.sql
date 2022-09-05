CREATE TABLE public.st_streets (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
	city_id bigint NOT NULL,
	CONSTRAINT st_streets_pk PRIMARY KEY (id)
);

ALTER TABLE public.st_streets ADD CONSTRAINT st_streets_id_st_cities_fkey FOREIGN KEY (city_id) REFERENCES st_cities(id);
COMMENT ON TABLE public.st_subjects is 'In ER schema st_ulica';
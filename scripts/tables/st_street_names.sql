CREATE TABLE public.st_street_names (
	street_id bigint NOT NULL,
	street_name text NOT NULL,
	created date NOT NULL,
	closed date
);

ALTER TABLE public.st_street_names ADD CONSTRAINT st_street_names_id_st_streets_fkey FOREIGN KEY (street_id) REFERENCES st_streets(id);

ALTER TABLE public.st_street_names ADD CONSTRAINT st_street_names_closed_check CHECK (closed >= created);

COMMENT ON TABLE public.st_subjects is 'In ER schema st_ulica_naim';
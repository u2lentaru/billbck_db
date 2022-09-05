CREATE TABLE public.st_subjects (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
	created date NOT NULL,
	closed date,
	CONSTRAINT st_subjects_pk PRIMARY KEY (id)
);

ALTER TABLE public.st_subjects ADD CONSTRAINT st_subjects_closed_check CHECK (closed >= created);

COMMENT ON TABLE public.st_subjects is 'In ER schema st_subject';
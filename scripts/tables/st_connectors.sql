CREATE TABLE public.st_connectors (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
	connector_name text NOT NULL,
	CONSTRAINT st_connectors_pk PRIMARY KEY (id)
);

COMMENT ON TABLE public.st_connectors is 'In ER schema st_connector';
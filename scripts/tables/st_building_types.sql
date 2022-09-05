CREATE TABLE public.st_building_types (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
	building_type_name text NOT NULL,
	CONSTRAINT st_building_types_pk PRIMARY KEY (id)
);

COMMENT ON TABLE public.st_building_types is 'In ER schema st_vid_zdaniya';
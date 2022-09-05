CREATE TABLE public.st_distribution_zones (
	id int NOT NULL GENERATED ALWAYS AS IDENTITY,
	distribution_zone_name text NOT NULL,
	CONSTRAINT st_distribution_zones_pk PRIMARY KEY (id)
);
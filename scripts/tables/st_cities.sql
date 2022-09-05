CREATE TABLE public.st_cities (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
	city_name text NOT NULL,
	CONSTRAINT st_cities_pk PRIMARY KEY (id)
);

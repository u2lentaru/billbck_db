CREATE TABLE public.st_cable_resistances (
	id int NOT NULL GENERATED ALWAYS AS IDENTITY,
	cable_resistance_name text NOT NULL,
    resistance numeric(10,3) NOT NULL,
    material_type boolean  NOT NULL,
	CONSTRAINT st_cable_resistances_pk PRIMARY KEY (id)
);
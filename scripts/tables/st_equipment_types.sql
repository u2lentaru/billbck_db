CREATE TABLE public.st_equipment_types (
	id int NOT NULL GENERATED ALWAYS AS IDENTITY,
	equipment_type_name text NOT NULL,
    equipment_type_power numeric NOT NULL,
	CONSTRAINT st_equipment_types_pk PRIMARY KEY (id)
);
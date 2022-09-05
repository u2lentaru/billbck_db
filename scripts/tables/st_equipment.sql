CREATE TABLE public.st_equipment (
	id int NOT NULL GENERATED ALWAYS AS IDENTITY,
	equipment_type_id int NOT NULL,
    obj_id int NOT NULL,
    qty int NOT NULL,
    working_hours numeric NOT NULL,
	CONSTRAINT st_equipment_pk PRIMARY KEY (id)
);

ALTER TABLE public.st_equipment ADD CONSTRAINT st_equipment_id_st_equipment_types_fkey FOREIGN KEY (equipment_type_id) REFERENCES st_equipment_types(id);
ALTER TABLE public.st_equipment ADD CONSTRAINT st_equipment_id_wt_objects_fkey FOREIGN KEY (obj_id) REFERENCES wt_objects(id);
CREATE TABLE public.wt_objects (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
	object_name text NOT NULL, 
    house_id bigint NOT NULL,
    flat_number text,
    obj_type_id bigint NOT NULL, --fixed 1 - MFF, 2 -SubMFF
    reg_qty int NOT NULL,
    uzo_id bigint NOT NULL,
    tariff_group_id bigint NOT NULL,
    calculation_type_id int NOT NULL,
    obj_status_id int NOT NULL,
    notes text,
    mff_id bigint, -- not null for SubMFF
	CONSTRAINT wt_objects_pk PRIMARY KEY (id)
);

ALTER TABLE public.wt_objects ADD CONSTRAINT wt_objects_id_st_houses_fkey FOREIGN KEY (house_id) REFERENCES st_houses(id);
ALTER TABLE public.wt_objects ADD CONSTRAINT wt_objects_id_st_obj_types_fkey FOREIGN KEY (obj_type_id) REFERENCES st_obj_types(id);
ALTER TABLE public.wt_objects ADD CONSTRAINT wt_objects_id_st_uzo_fkey FOREIGN KEY (uzo_id) REFERENCES st_uzo(id);
ALTER TABLE public.wt_objects ADD CONSTRAINT wt_objects_id_st_tariff_groups_fkey FOREIGN KEY (tariff_group_id) REFERENCES st_tariff_groups(id);
ALTER TABLE public.wt_objects ADD CONSTRAINT wt_objects_id_st_calculation_types_fkey FOREIGN KEY (calculation_type_id) REFERENCES st_calculation_types(id);
ALTER TABLE public.wt_objects ADD CONSTRAINT wt_objects_id_st_obj_statuses_fkey FOREIGN KEY (obj_status_id) REFERENCES st_obj_statuses(id);
ALTER TABLE public.wt_objects ADD CONSTRAINT wt_objects_id_wt_objects_fkey FOREIGN KEY (mff_id) REFERENCES wt_objects(id);

COMMENT ON TABLE public.wt_objects is 'In ER schema wt_object';
CREATE TABLE public.wt_acts (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
	act_type_id bigint NOT NULL,
    act_number text NOT NULL,
    act_date date NOT NULL,
    object_id bigint NOT NULL,
    staff_id bigint NOT NULL,
    notes text,
    activated date,
	CONSTRAINT wt_acts_pk PRIMARY KEY (id)
);

ALTER TABLE public.wt_acts ADD CONSTRAINT wt_acts_id_st_act_types_fkey FOREIGN KEY (act_type_id) REFERENCES st_act_types(id);
ALTER TABLE public.wt_acts ADD CONSTRAINT wt_acts_id_wt_objects_fkey FOREIGN KEY (object_id) REFERENCES wt_objects(id);
ALTER TABLE public.wt_acts ADD CONSTRAINT wt_acts_id_st_staff_fkey FOREIGN KEY (staff_id) REFERENCES st_staff(id);

COMMENT ON TABLE public.wt_acts is 'In ER schema wt_akt';
CREATE TABLE public.wt_pu (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY, 
    object_id bigint NOT NULL,
    obj_type_id bigint NOT NULL,
    pu_type_id bigint NOT NULL,
    pu_number text NOT NULL,
    install_date date NOT NULL,
    check_interval int NOT NULL,
    initial_value numeric NOT NULL,
    dev_stopped boolean NOT NULL,
    startdate date NOT NULL,
    enddate date,
    pid bigint,
	CONSTRAINT wt_pu_pk PRIMARY KEY (id)
);

-- ALTER TABLE public.wt_pu ADD CONSTRAINT wt_pu_id_wt_objects_fkey FOREIGN KEY (object_id) REFERENCES wt_objects(id);
ALTER TABLE public.wt_pu ADD CONSTRAINT wt_pu_id_st_pu_types_fkey FOREIGN KEY (pu_type_id) REFERENCES st_pu_types(id);
ALTER TABLE public.wt_pu ADD CONSTRAINT wt_pu_enddate_check CHECK (enddate >= startdate);

COMMENT ON TABLE public.wt_pu is 'In ER schema wt_pu';
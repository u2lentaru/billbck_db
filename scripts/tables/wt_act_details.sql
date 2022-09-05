CREATE TABLE public.wt_act_details (
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
    act_id bigint NOT NULL,
    detail_date date NOT NULL,
    pu_id bigint,
    pu_type_id bigint,
    pu_number text,
    pu_install_date date,
    pu_check_interval int,
    pu_initial_value numeric,
    pu_dev_stopped boolean,
    startdate date,
    enddate date,
    pu_pid bigint,
    ad_pu_value numeric(10,1),
    seal_id int,
    seal_number text,
    seal_date date,
    conclusion_id int,
    conclusion_num text,
    shutdown_type_id int,
    reason_id int,
    violation_id int,
    customer text,
    customer_phone text,
    customer_pos text,
    notes text,
    CONSTRAINT wt_act_details_pk PRIMARY KEY (id)
);

ALTER TABLE public.wt_act_details ADD CONSTRAINT wt_act_details_id_wt_acts_fkey FOREIGN KEY (act_id) REFERENCES wt_acts(id);
ALTER TABLE public.wt_act_details ADD CONSTRAINT wt_act_details_id_wt_pu_fkey FOREIGN KEY (pu_id) REFERENCES wt_pu(id);
ALTER TABLE public.wt_act_details ADD CONSTRAINT wt_act_details_id_wt_pu_type_fkey FOREIGN KEY (pu_type_id) REFERENCES st_pu_types(id);
ALTER TABLE public.wt_act_details ADD CONSTRAINT wt_act_details_id_wt_pu_pid_fkey FOREIGN KEY (pu_pid) REFERENCES wt_pu(id);
ALTER TABLE public.wt_act_details ADD CONSTRAINT wt_act_details_id_st_seals_fkey FOREIGN KEY (seal_id) REFERENCES st_seals(id);
ALTER TABLE public.wt_act_details ADD CONSTRAINT wt_act_details_id_st_conclusions_fkey FOREIGN KEY (conclusion_id) REFERENCES st_conclusions(id);
ALTER TABLE public.wt_act_details ADD CONSTRAINT wt_act_details_id_st_shutdown_types_fkey FOREIGN KEY (shutdown_type_id) REFERENCES st_shutdown_types(id);
ALTER TABLE public.wt_act_details ADD CONSTRAINT wt_act_details_id_st_reason_fkey FOREIGN KEY (reason_id) REFERENCES st_reasons(id);
ALTER TABLE public.wt_act_details ADD CONSTRAINT wt_act_details_id_st_violation_fkey FOREIGN KEY (violation_id) REFERENCES st_violations(id);

COMMENT ON TABLE public.wt_act_details is 'In ER schema wt_akt_rekvizit';
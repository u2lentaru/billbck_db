CREATE TABLE public.wt_pu_values (
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
    pu_id bigint NOT NULL,
    -- pu_value_type_id int NOT NULL,
    value_date date NOT NULL,
    pu_value numeric(10,1) NOT NULL
);


ALTER TABLE public.wt_pu_values ADD CONSTRAINT wt_pu_values_id_wt_pu_fkey FOREIGN KEY (pu_id) REFERENCES wt_pu(id);
-- ALTER TABLE public.wt_pu_values ADD CONSTRAINT wt_pu_values_id_st_pu_value_types_fkey FOREIGN KEY (pu_value_type_id) REFERENCES st_pu_value_types(id);
ALTER TABLE public.wt_pu_values ADD CONSTRAINT wt_pu_values_pu_id_value_date_unique UNIQUE (pu_id, value_date);

COMMENT ON TABLE public.wt_pu_values is 'In ER schema wt_pok_pu';
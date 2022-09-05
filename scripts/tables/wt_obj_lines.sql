CREATE TABLE public.wt_obj_lines (
    id int NOT NULL GENERATED ALWAYS AS IDENTITY,
    obj_id int NOT NULL,
    obj_type_id int NOT NULL, -- obj - 0, tgu > 0 (st_tgu_types(id))
    cable_resistance_id int NOT NULL,
    line_length numeric(10,3) NOT NULL,
    startdate date NOT NULL,
    enddate date,
    CONSTRAINT wt_obj_lines_pk PRIMARY KEY (id)
);
ALTER TABLE public.wt_obj_lines ADD CONSTRAINT wt_obj_lines_enddate_check CHECK (enddate >= startdate);
ALTER TABLE public.wt_obj_lines ADD CONSTRAINT wt_obj_lines_id_st_cable_resistances_fkey FOREIGN KEY (cable_resistance_id) REFERENCES st_cable_resistances(id);
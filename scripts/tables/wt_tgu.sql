CREATE TABLE public.wt_tgu (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
    pid bigint NOT NULL,
    tgu_name text NOT NULL,
    tgu_type_id bigint NOT NULL,
   	inv_number text,
	input_voltage bigint,
	output_voltage1 bigint,
	output_voltage2 bigint,
	CONSTRAINT wt_tgu_pk PRIMARY KEY (id)
);

ALTER TABLE public.wt_tgu ADD CONSTRAINT wt_tgu_id_st_tgu_types_fkey FOREIGN KEY (tgu_type_id) REFERENCES st_tgu_types(id);
ALTER TABLE public.wt_tgu ADD CONSTRAINT wt_tgu_id_wt_tgu_fkey FOREIGN KEY (pid) REFERENCES wt_tgu(id);
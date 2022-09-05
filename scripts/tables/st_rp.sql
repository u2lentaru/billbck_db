CREATE TABLE public.st_rp (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
	rp_name text NOT NULL,
	inv_number text NOT NULL,
	input_voltage bigint NOT NULL,
	output_voltage1 bigint NOT NULL,
	output_voltage2 bigint NOT NULL,
	tp_id bigint NOT NULL,
	CONSTRAINT st_rp_pk PRIMARY KEY (id)
);

ALTER TABLE public.st_rp ADD CONSTRAINT st_rp_input_id_st_voltage_fkey FOREIGN KEY (input_voltage) REFERENCES st_voltage(id);
ALTER TABLE public.st_rp ADD CONSTRAINT st_rp_output1_id_st_voltage_fkey FOREIGN KEY (output_voltage1) REFERENCES st_voltage(id);
ALTER TABLE public.st_rp ADD CONSTRAINT st_rp_output2_id_st_voltage_fkey FOREIGN KEY (output_voltage2) REFERENCES st_voltage(id);
ALTER TABLE public.st_rp ADD CONSTRAINT st_rp_id_st_tp_fkey FOREIGN KEY (tp_id) REFERENCES st_tp(id);

COMMENT ON TABLE public.st_rp is 'In ER schema st_rp';
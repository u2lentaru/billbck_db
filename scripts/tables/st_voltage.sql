CREATE TABLE public.st_voltage (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
	voltage_name text NOT NULL,
	voltage_value int NOT NULL,
	CONSTRAINT st_voltage_pk PRIMARY KEY (id)
);

COMMENT ON TABLE public.st_voltage is 'In ER schema st_voltage';
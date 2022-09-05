CREATE TABLE public.st_trans_pwr_types (
	id int NOT NULL GENERATED ALWAYS AS IDENTITY,
	trans_pwr_type_name text NOT NULL,
	short_circuit_power numeric(10,2) NOT NULL,
	idling_loss_power numeric(10,2) NOT NULL,
	nominal_power int NOT NULL,
	CONSTRAINT st_trans_pwr_types_pk PRIMARY KEY (id)
);
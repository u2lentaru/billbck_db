CREATE TABLE public.st_trans_pwr (
	id int NOT NULL GENERATED ALWAYS AS IDENTITY,
    trans_pwr_name text NOT NULL,
    trans_pwr_type_id int NOT NULL,
	CONSTRAINT st_trans_pwr_pk PRIMARY KEY (id)
);
ALTER TABLE public.st_trans_pwr ADD CONSTRAINT st_trans_pwr_id_st_trans_pwr_types_fkey FOREIGN KEY (trans_pwr_type_id) REFERENCES st_trans_pwr_types(id);
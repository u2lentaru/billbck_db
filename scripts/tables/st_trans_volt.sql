CREATE TABLE public.st_trans_volt (
    id int NOT NULL GENERATED ALWAYS AS IDENTITY,
    trans_volt_name text NOT NULL,
    trans_type_id int NOT NULL,
    checkdate date,
    nextcheckdate date,
    proddate date,
    serial1 text,
    serial2 text,
    serial3 text,
	CONSTRAINT st_trans_volt_pk PRIMARY KEY (id)
);

ALTER TABLE public.st_trans_volt ADD CONSTRAINT st_trans_volt_id_st_trans_types_fkey FOREIGN KEY (trans_type_id) REFERENCES st_trans_types(id);
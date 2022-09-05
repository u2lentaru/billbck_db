CREATE TABLE public.st_askue_types (
	id int NOT NULL GENERATED ALWAYS AS IDENTITY,
	askue_type_name text NOT NULL,
    start_line int NOT NULL,
    pu_column int NOT NULL,
    value_column int NOT NULL,
    date_column int NOT NULL,
    date_column_array text, -- {11,13,15} 
	CONSTRAINT st_askue_types_pk PRIMARY KEY (id)
);
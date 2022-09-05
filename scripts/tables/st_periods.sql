CREATE TABLE public.st_periods (
    id int NOT NULL GENERATED ALWAYS AS IDENTITY,
    period_name text NOT NULL,
    drperiod daterange NOT NULL,
    EXCLUDE USING GIST (drperiod WITH &&),
    CONSTRAINT st_periods_pk PRIMARY KEY (id)
);
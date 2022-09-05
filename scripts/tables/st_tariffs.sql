CREATE TABLE public.st_tariffs (
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
	tariff_name text NOT NULL,
	tariff_group_id bigint NOT NULL,
	norma numeric(10,2) NOT NULL,
    tariff numeric(10,2) NOT NULL,
    startdate date NOT NULL,
    enddate date
);

ALTER TABLE public.st_tariffs ADD CONSTRAINT st_tariffs_id_tariff_groups_fkey FOREIGN KEY (tariff_group_id) REFERENCES st_tariff_groups(id);
ALTER TABLE public.st_tariffs ADD CONSTRAINT st_tariffs_enddate_check CHECK (enddate >= startdate);

COMMENT ON TABLE public.st_tariffs is 'In ER schema st_tarif';
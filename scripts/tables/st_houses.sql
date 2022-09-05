CREATE TABLE public.st_houses (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
	building_types_id bigint NOT NULL,
	street_id bigint NOT NULL,
	house_number text NOT NULL,
	building_number text,
	rp_id bigint NOT NULL,
	area_id bigint NOT NULL,
	ksk_id bigint NOT NULL,
	sector_id bigint NOT NULL,
	connector_id bigint NOT NULL,
	input_type_id bigint NOT NULL,
	reliability_id bigint NOT NULL,
	voltage_id bigint NOT NULL,
	notes text,
	CONSTRAINT st_houses_pk PRIMARY KEY (id)
);

ALTER TABLE public.st_houses ADD CONSTRAINT st_houses_id_building_types_fkey FOREIGN KEY (building_types_id) REFERENCES st_building_types(id);
ALTER TABLE public.st_houses ADD CONSTRAINT st_houses_id_streets_fkey FOREIGN KEY (street_id) REFERENCES st_streets(id);
ALTER TABLE public.st_houses ADD CONSTRAINT st_houses_id_tgu_fkey FOREIGN KEY (rp_id) REFERENCES wt_tgu(id);
ALTER TABLE public.st_houses ADD CONSTRAINT st_houses_id_areas_fkey FOREIGN KEY (area_id) REFERENCES st_areas(id);
ALTER TABLE public.st_houses ADD CONSTRAINT st_houses_id_ksk_fkey FOREIGN KEY (ksk_id) REFERENCES st_ksk(id);
ALTER TABLE public.st_houses ADD CONSTRAINT st_houses_id_sectors_fkey FOREIGN KEY (sector_id) REFERENCES st_sectors(id);
ALTER TABLE public.st_houses ADD CONSTRAINT st_houses_id_connectors_fkey FOREIGN KEY (connector_id) REFERENCES st_connectors(id);
ALTER TABLE public.st_houses ADD CONSTRAINT st_houses_id_input_types_fkey FOREIGN KEY (input_type_id) REFERENCES st_input_types(id);
ALTER TABLE public.st_houses ADD CONSTRAINT st_houses_id_reliabilities_fkey FOREIGN KEY (reliability_id) REFERENCES st_reliabilities(id);
ALTER TABLE public.st_houses ADD CONSTRAINT st_houses_id_voltage_fkey FOREIGN KEY (voltage_id) REFERENCES st_voltage(id);

COMMENT ON TABLE public.st_houses is 'In ER schema st_doma';
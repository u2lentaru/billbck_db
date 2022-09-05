CREATE TABLE public.st_seals (
	id int NOT NULL GENERATED ALWAYS AS IDENTITY,
	seal_number text NOT NULL,
	packet_number text NOT NULL,
	area_id int NOT NULL,
	staff_id int NOT NULL,
	seal_type_id int NOT NULL,
	seal_colour_id int NOT NULL,
	seal_status_id int NOT NULL,
	issue_date date,
	report_date date,
	CONSTRAINT st_seals_pk PRIMARY KEY (id)
);

ALTER TABLE public.st_seals ADD CONSTRAINT st_seals_id_st_areas_fkey FOREIGN KEY (area_id) REFERENCES st_areas(id);
ALTER TABLE public.st_seals ADD CONSTRAINT st_seals_id_st_staff_fkey FOREIGN KEY (staff_id) REFERENCES st_staff(id);
ALTER TABLE public.st_seals ADD CONSTRAINT st_seals_id_st_seal_types_fkey FOREIGN KEY (seal_type_id) REFERENCES st_seal_types(id);
ALTER TABLE public.st_seals ADD CONSTRAINT st_seals_id_st_seal_colours_fkey FOREIGN KEY (seal_colour_id) REFERENCES st_seal_colours(id);
ALTER TABLE public.st_seals ADD CONSTRAINT st_seals_id_st_seal_statuses_fkey FOREIGN KEY (seal_status_id) REFERENCES st_seal_statuses(id);
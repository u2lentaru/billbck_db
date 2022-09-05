CREATE TABLE public.st_sub_details (
	sub_id bigint NOT NULL,
	sub_type bigint NOT NULL,
	sub_phys boolean NOT NULL,
	sub_descr text NOT NULL,
	sub_name text NOT NULL,
	bin char(12) NOT NULL,
	head_pos bigint,
	head_name text,
	acc_pos bigint,
	acc_name text,
	sub_address text NOT NULL,
	sub_phone text NOT NULL,
	created date NOT NULL,
	sub_account text NOT NULL,
	job text,
	email text,
	mob_phone text,
	job_phone text,
	notes text
);

ALTER TABLE public.st_sub_details ADD CONSTRAINT st_sub_details_id_st_subjects_fkey FOREIGN KEY (sub_id) REFERENCES st_subjects(id);
ALTER TABLE public.st_sub_details ADD CONSTRAINT st_sub_details_id_st_sub_types_fkey FOREIGN KEY (sub_type) REFERENCES st_sub_types(id);
-- ALTER TABLE public.st_sub_details ADD CONSTRAINT st_sub_details_head_id_st_positions_fkey FOREIGN KEY (head_pos) REFERENCES st_positions(id);
-- ALTER TABLE public.st_sub_details ADD CONSTRAINT st_sub_details_acc_id_st_positions_fkey FOREIGN KEY (acc_pos) REFERENCES st_positions(id);


COMMENT ON TABLE public.st_sub_details is 'In ER schema st_sub_detail';
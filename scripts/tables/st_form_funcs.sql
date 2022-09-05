CREATE TABLE public.st_form_funcs (
	form_id bigint NOT NULL,
	func_id bigint NOT NULL
);

ALTER TABLE public.st_form_funcs ADD CONSTRAINT st_form_funcs_id_st_forms_fkey FOREIGN KEY (form_id) REFERENCES st_forms(id);
ALTER TABLE public.st_form_funcs ADD CONSTRAINT st_form_funcs_id_st_funcs_fkey FOREIGN KEY (func_id) REFERENCES st_funcs(id);
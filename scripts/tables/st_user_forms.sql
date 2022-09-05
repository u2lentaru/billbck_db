CREATE TABLE public.st_user_forms (
	user_id bigint NOT NULL,
	form_id bigint NOT NULL,
	rights jsonb NOT NULL
);

ALTER TABLE public.st_user_forms ADD CONSTRAINT st_user_forms_id_st_users_fkey FOREIGN KEY (user_id) REFERENCES st_users(id);
ALTER TABLE public.st_user_forms ADD CONSTRAINT st_user_forms_id_st_forms_fkey FOREIGN KEY (form_id) REFERENCES st_forms(id);
ALTER TABLE public.st_user_forms ADD CONSTRAINT st_user_forms_unique_user_id_form_id UNIQUE(user_id, form_id);
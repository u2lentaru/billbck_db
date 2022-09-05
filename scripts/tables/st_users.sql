CREATE TABLE public.st_users (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
	user_name text NOT NULL,
	org_id bigint NOT NULL,
	lang_id bigint NOT NULL,
	change_pass boolean DEFAULT true NOT NULL,
	position_id bigint NOT NULL,
	full_name text NOT NULL,
	created date NOT NULL,
    closed date
	CONSTRAINT st_users_pk PRIMARY KEY (id)
)
ALTER TABLE public.st_users ADD CONSTRAINT st_users_id_st_orgs_fkey FOREIGN KEY (org_id) REFERENCES st_org_info(id);
ALTER TABLE public.st_users ADD CONSTRAINT st_users_id_langs_fkey FOREIGN KEY (lang_id) REFERENCES st_langs(id);
ALTER TABLE public.st_users ADD CONSTRAINT st_users_user_name_unique UNIQUE (user_name);
ALTER TABLE public.st_users ADD CONSTRAINT st_users_id_st_positions_fkey FOREIGN KEY (position_id) REFERENCES st_positions(id);
ALTER TABLE public.st_users ADD CONSTRAINT st_users_closed_check CHECK (closed >= created);

COMMENT ON TABLE public.st_users is 'In ER schema st_users';
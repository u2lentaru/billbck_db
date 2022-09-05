CREATE TABLE public.st_user_funcs (
	user_id bigint NOT NULL,
	func_id bigint NOT NULL
);

ALTER TABLE public.st_user_funcs ADD CONSTRAINT st_user_funcs_id_st_users_fkey FOREIGN KEY (user_id) REFERENCES st_users(id);
ALTER TABLE public.st_user_funcs ADD CONSTRAINT st_user_funcs_id_st_funcs_fkey FOREIGN KEY (func_id) REFERENCES st_funcs(id);
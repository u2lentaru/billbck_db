-- NOT USED!!!
-- CREATE TABLE public.st_user_info (
-- 	user_id bigint NOT NULL,
-- 	position_id bigint NOT NULL,
-- 	full_name text NOT NULL,
-- 	created date NOT NULL,
--     closed date
-- );

-- ALTER TABLE public.st_user_info ADD CONSTRAINT st_user_info_id_st_users_fkey FOREIGN KEY (user_id) REFERENCES st_users(id);
-- ALTER TABLE public.st_user_info ADD CONSTRAINT st_user_info_id_st_positions_fkey FOREIGN KEY (position_id) REFERENCES st_positions(id);
-- ALTER TABLE public.st_user_info ADD CONSTRAINT st_user_info_closed_check CHECK (closed >= created);

-- COMMENT ON TABLE public.st_user_info is 'In ER schema st_user_info';
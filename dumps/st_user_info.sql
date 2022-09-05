--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1 (Debian 13.1-1.pgdg100+1)
-- Dumped by pg_dump version 13.1 (Debian 13.1-1.pgdg100+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: st_user_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.st_user_info (
    user_id bigint NOT NULL,
    position_id bigint NOT NULL,
    full_name text NOT NULL,
    created date NOT NULL,
    closed date
);


ALTER TABLE public.st_user_info OWNER TO postgres;

--
-- Name: TABLE st_user_info; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.st_user_info IS 'In ER schema st_user_info';


--
-- Name: st_user_info st_user_info_id_st_positions_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.st_user_info
    ADD CONSTRAINT st_user_info_id_st_positions_fkey FOREIGN KEY (position_id) REFERENCES public.st_positions(id);


--
-- Name: st_user_info st_user_info_id_st_users_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.st_user_info
    ADD CONSTRAINT st_user_info_id_st_users_fkey FOREIGN KEY (user_id) REFERENCES public.st_users(id);


--
-- PostgreSQL database dump complete
--


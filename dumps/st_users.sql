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
-- Name: st_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.st_users (
    id bigint NOT NULL,
    user_name text NOT NULL,
    org_id bigint NOT NULL,
    lang_id bigint NOT NULL
);


ALTER TABLE public.st_users OWNER TO postgres;

--
-- Name: TABLE st_users; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.st_users IS 'In ER schema st_users';


--
-- Name: st_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.st_users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.st_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: st_users st_users_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.st_users
    ADD CONSTRAINT st_users_pk PRIMARY KEY (id);


--
-- Name: st_users st_users_id_langs_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.st_users
    ADD CONSTRAINT st_users_id_langs_fkey FOREIGN KEY (lang_id) REFERENCES public.st_langs(id);


--
-- Name: st_users st_users_id_st_orgs_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.st_users
    ADD CONSTRAINT st_users_id_st_orgs_fkey FOREIGN KEY (org_id) REFERENCES public.st_org_info(id);


--
-- PostgreSQL database dump complete
--


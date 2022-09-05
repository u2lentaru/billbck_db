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
-- Name: st_langs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.st_langs (
    id bigint NOT NULL,
    lang_name text NOT NULL,
    lang_descr text NOT NULL
);


ALTER TABLE public.st_langs OWNER TO postgres;

--
-- Name: TABLE st_langs; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.st_langs IS 'In ER schema st_lang';


--
-- Name: st_langs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.st_langs ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.st_langs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: st_langs st_langs_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.st_langs
    ADD CONSTRAINT st_langs_pk PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--


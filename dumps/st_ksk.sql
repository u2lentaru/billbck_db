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
-- Name: st_ksk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.st_ksk (
    id bigint NOT NULL,
    ksk_name text NOT NULL,
    ksk_address text NOT NULL,
    ksk_head text NOT NULL,
    ksk_phone text NOT NULL
);


ALTER TABLE public.st_ksk OWNER TO postgres;

--
-- Name: TABLE st_ksk; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.st_ksk IS 'In ER schema st_ksk';


--
-- Name: st_ksk_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.st_ksk ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.st_ksk_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: st_ksk st_ksk_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.st_ksk
    ADD CONSTRAINT st_ksk_pk PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--


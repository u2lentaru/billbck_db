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
-- Name: st_org_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.st_org_info (
    id bigint NOT NULL,
    name text NOT NULL,
    bin character(12) NOT NULL,
    address text NOT NULL,
    bank_id bigint NOT NULL,
    account_number text NOT NULL
);


ALTER TABLE public.st_org_info OWNER TO postgres;

--
-- Name: TABLE st_org_info; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.st_org_info IS 'In ER schema st_org_rekvizit';


--
-- Name: st_org_info_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.st_org_info ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.st_org_info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: st_org_info st_org_info_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.st_org_info
    ADD CONSTRAINT st_org_info_pk PRIMARY KEY (id);


--
-- Name: st_org_info st_org_info_id_st_banks_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.st_org_info
    ADD CONSTRAINT st_org_info_id_st_banks_fkey FOREIGN KEY (bank_id) REFERENCES public.st_banks(id);


--
-- PostgreSQL database dump complete
--


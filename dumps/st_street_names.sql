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
-- Name: st_street_names; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.st_street_names (
    street_id bigint NOT NULL,
    street_name text NOT NULL,
    created date NOT NULL,
    closed date
);


ALTER TABLE public.st_street_names OWNER TO postgres;

--
-- Name: st_street_names st_street_names_id_st_streets_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.st_street_names
    ADD CONSTRAINT st_street_names_id_st_streets_fkey FOREIGN KEY (street_id) REFERENCES public.st_streets(id);


--
-- PostgreSQL database dump complete
--


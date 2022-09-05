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
-- Name: st_sub_bank; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.st_sub_bank (
    sub_id bigint NOT NULL,
    bank_id bigint NOT NULL,
    account_number text NOT NULL
);


ALTER TABLE public.st_sub_bank OWNER TO postgres;

--
-- Name: TABLE st_sub_bank; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.st_sub_bank IS 'In ER schema st_sub_bank';


--
-- Name: st_sub_bank st_sub_bank_id_st_banks_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.st_sub_bank
    ADD CONSTRAINT st_sub_bank_id_st_banks_fkey FOREIGN KEY (bank_id) REFERENCES public.st_banks(id);


--
-- Name: st_sub_bank st_sub_bank_id_st_subjects_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.st_sub_bank
    ADD CONSTRAINT st_sub_bank_id_st_subjects_fkey FOREIGN KEY (sub_id) REFERENCES public.st_subjects(id);


--
-- PostgreSQL database dump complete
--


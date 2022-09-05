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
-- Name: st_sub_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.st_sub_details (
    sub_id bigint NOT NULL,
    sub_type bigint NOT NULL,
    sub_phys boolean NOT NULL,
    sub_descr text NOT NULL,
    sub_name text NOT NULL,
    bin character(12) NOT NULL,
    head_pos bigint NOT NULL,
    head_name text NOT NULL,
    acc_pos bigint NOT NULL,
    acc_name text NOT NULL,
    sub_address text NOT NULL,
    sub_phone text NOT NULL,
    created date NOT NULL,
    sub_account text NOT NULL
);


ALTER TABLE public.st_sub_details OWNER TO postgres;

--
-- Name: TABLE st_sub_details; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.st_sub_details IS 'In ER schema st_sub_detail';


--
-- Name: st_sub_details st_sub_details_acc_id_st_positions_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.st_sub_details
    ADD CONSTRAINT st_sub_details_acc_id_st_positions_fkey FOREIGN KEY (acc_pos) REFERENCES public.st_positions(id);


--
-- Name: st_sub_details st_sub_details_id_st_sub_types_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.st_sub_details
    ADD CONSTRAINT st_sub_details_id_st_sub_types_fkey FOREIGN KEY (sub_type) REFERENCES public.st_sub_types(id);


--
-- PostgreSQL database dump complete
--


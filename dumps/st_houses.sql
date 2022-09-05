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
-- Name: st_houses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.st_houses (
    id bigint NOT NULL,
    building_types_id bigint NOT NULL,
    street_id bigint NOT NULL,
    house_number text NOT NULL,
    building_number text NOT NULL,
    rp_id bigint NOT NULL,
    area_id bigint NOT NULL,
    ksk_id bigint NOT NULL,
    sector_id bigint NOT NULL
);


ALTER TABLE public.st_houses OWNER TO postgres;

--
-- Name: TABLE st_houses; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.st_houses IS 'In ER schema st_doma';


--
-- Name: st_houses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.st_houses ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.st_houses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: st_houses st_houses_id_areas_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.st_houses
    ADD CONSTRAINT st_houses_id_areas_fkey FOREIGN KEY (area_id) REFERENCES public.st_areas(id);


--
-- Name: st_houses st_houses_id_building_types_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.st_houses
    ADD CONSTRAINT st_houses_id_building_types_fkey FOREIGN KEY (building_types_id) REFERENCES public.st_building_types(id);


--
-- Name: st_houses st_houses_id_ksk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.st_houses
    ADD CONSTRAINT st_houses_id_ksk_fkey FOREIGN KEY (ksk_id) REFERENCES public.st_ksk(id);


--
-- Name: st_houses st_houses_id_rp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.st_houses
    ADD CONSTRAINT st_houses_id_rp_fkey FOREIGN KEY (rp_id) REFERENCES public.st_rp(id);


--
-- Name: st_houses st_houses_id_sectors_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.st_houses
    ADD CONSTRAINT st_houses_id_sectors_fkey FOREIGN KEY (sector_id) REFERENCES public.st_sectors(id);


--
-- Name: st_houses st_houses_id_streets_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.st_houses
    ADD CONSTRAINT st_houses_id_streets_fkey FOREIGN KEY (street_id) REFERENCES public.st_streets(id);


--
-- PostgreSQL database dump complete
--


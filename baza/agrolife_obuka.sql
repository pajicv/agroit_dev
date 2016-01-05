--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.4
-- Dumped by pg_dump version 9.4.4
-- Started on 2016-01-05 09:48:05

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 2071 (class 1262 OID 109478)
-- Name: agrolife_obuka; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE agrolife_obuka WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';


ALTER DATABASE agrolife_obuka OWNER TO postgres;

\connect agrolife_obuka

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 183 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2074 (class 0 OID 0)
-- Dependencies: 183
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 178 (class 1259 OID 111829)
-- Name: OT_grupa; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "OT_grupa" (
    id integer NOT NULL,
    naziv character varying(100) NOT NULL,
    gt_mape_vidi boolean DEFAULT false NOT NULL,
    gt_mape_menja boolean DEFAULT false NOT NULL,
    rt_radni_nalog_vidi boolean DEFAULT false NOT NULL,
    rt_radni_nalog_menja boolean DEFAULT false NOT NULL,
    ot_materijal_vidi boolean DEFAULT false NOT NULL,
    ot_materijal_menja boolean DEFAULT false NOT NULL,
    ot_ostalo_vidi boolean DEFAULT false NOT NULL,
    ot_ostalo_menja boolean DEFAULT false NOT NULL,
    gt_gps_vidi boolean DEFAULT false NOT NULL,
    gt_gps_menja boolean DEFAULT false NOT NULL
);


ALTER TABLE "OT_grupa" OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 111798)
-- Name: ot_klijent_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ot_klijent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ot_klijent_id_seq OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 111807)
-- Name: OT_klijent; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "OT_klijent" (
    id integer DEFAULT nextval('ot_klijent_id_seq'::regclass) NOT NULL,
    ulica_i_broj character varying(100),
    naziv character varying(100) NOT NULL,
    kontakt_mobilni character varying(100),
    mesto character varying(100),
    pib character varying(10),
    drzava character varying(100),
    kontakt_osoba character varying(100),
    kontakt_telefon character varying(100),
    kontakt_mejl character varying(255)
);


ALTER TABLE "OT_klijent" OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 111847)
-- Name: OT_korisnik; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "OT_korisnik" (
    id integer NOT NULL,
    id_klijent integer,
    id_grupa integer NOT NULL,
    username character varying(20) NOT NULL,
    password character varying(60) NOT NULL,
    ime character varying(20),
    prezime character varying(50),
    farm character varying(20) NOT NULL,
    mejl character varying(50) NOT NULL,
    x double precision,
    y double precision,
    zoom integer
);


ALTER TABLE "OT_korisnik" OWNER TO postgres;

--
-- TOC entry 172 (class 1259 OID 111778)
-- Name: ot_vrsta_intervencije_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ot_vrsta_intervencije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ot_vrsta_intervencije_id_seq OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 111780)
-- Name: OT_vrsta_intervencije; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "OT_vrsta_intervencije" (
    id integer DEFAULT nextval('ot_vrsta_intervencije_id_seq'::regclass) NOT NULL,
    naziv character varying(50) NOT NULL
);


ALTER TABLE "OT_vrsta_intervencije" OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 111857)
-- Name: RT_anketa; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "RT_anketa" (
    id integer NOT NULL,
    id_korisnik integer NOT NULL,
    id_intervencija integer NOT NULL,
    odgovor1 integer NOT NULL,
    odgovor2 integer NOT NULL,
    odgovor3 integer NOT NULL,
    odgovor4 integer NOT NULL,
    odgovor5 integer NOT NULL,
    odgovor6 integer NOT NULL,
    odgovor7 integer NOT NULL,
    predlog_softver character varying(1000) NOT NULL,
    predlog_intervencija character varying(1000) NOT NULL
);


ALTER TABLE "RT_anketa" OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 111816)
-- Name: RT_intervencija; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "RT_intervencija" (
    id integer NOT NULL,
    id_klijent integer,
    id_vrsta_intervencije integer,
    naziv character varying(100),
    opis character varying(255),
    link_na_fajl character varying(255) NOT NULL,
    datum character varying(10) NOT NULL,
    vreme_od timestamp without time zone NOT NULL,
    vreme_do timestamp without time zone NOT NULL
);


ALTER TABLE "RT_intervencija" OWNER TO postgres;

--
-- TOC entry 2075 (class 0 OID 0)
-- Dependencies: 176
-- Name: COLUMN "RT_intervencija".link_na_fajl; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "RT_intervencija".link_na_fajl IS 'Proveriti koliko maksimalno karaktera odvojiti za hyperlink';


--
-- TOC entry 2076 (class 0 OID 0)
-- Dependencies: 176
-- Name: COLUMN "RT_intervencija".datum; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "RT_intervencija".datum IS 'Pitati Vladu :)';


--
-- TOC entry 177 (class 1259 OID 111827)
-- Name: ot_grupa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ot_grupa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ot_grupa_id_seq OWNER TO postgres;

--
-- TOC entry 2077 (class 0 OID 0)
-- Dependencies: 177
-- Name: ot_grupa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ot_grupa_id_seq OWNED BY "OT_grupa".id;


--
-- TOC entry 179 (class 1259 OID 111845)
-- Name: ot_korisnik_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ot_korisnik_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ot_korisnik_id_seq OWNER TO postgres;

--
-- TOC entry 2078 (class 0 OID 0)
-- Dependencies: 179
-- Name: ot_korisnik_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ot_korisnik_id_seq OWNED BY "OT_korisnik".id;


--
-- TOC entry 181 (class 1259 OID 111855)
-- Name: rt_anketa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE rt_anketa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rt_anketa_id_seq OWNER TO postgres;

--
-- TOC entry 2079 (class 0 OID 0)
-- Dependencies: 181
-- Name: rt_anketa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE rt_anketa_id_seq OWNED BY "RT_anketa".id;


--
-- TOC entry 1914 (class 2604 OID 111832)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "OT_grupa" ALTER COLUMN id SET DEFAULT nextval('ot_grupa_id_seq'::regclass);


--
-- TOC entry 1925 (class 2604 OID 111850)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "OT_korisnik" ALTER COLUMN id SET DEFAULT nextval('ot_korisnik_id_seq'::regclass);


--
-- TOC entry 1926 (class 2604 OID 111860)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "RT_anketa" ALTER COLUMN id SET DEFAULT nextval('rt_anketa_id_seq'::regclass);


--
-- TOC entry 2062 (class 0 OID 111829)
-- Dependencies: 178
-- Data for Name: OT_grupa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "OT_grupa" (id, naziv, gt_mape_vidi, gt_mape_menja, rt_radni_nalog_vidi, rt_radni_nalog_menja, ot_materijal_vidi, ot_materijal_menja, ot_ostalo_vidi, ot_ostalo_menja, gt_gps_vidi, gt_gps_menja) FROM stdin;
\.


--
-- TOC entry 2059 (class 0 OID 111807)
-- Dependencies: 175
-- Data for Name: OT_klijent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "OT_klijent" (id, ulica_i_broj, naziv, kontakt_mobilni, mesto, pib, drzava, kontakt_osoba, kontakt_telefon, kontakt_mejl) FROM stdin;
\.


--
-- TOC entry 2064 (class 0 OID 111847)
-- Dependencies: 180
-- Data for Name: OT_korisnik; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "OT_korisnik" (id, id_klijent, id_grupa, username, password, ime, prezime, farm, mejl, x, y, zoom) FROM stdin;
\.


--
-- TOC entry 2057 (class 0 OID 111780)
-- Dependencies: 173
-- Data for Name: OT_vrsta_intervencije; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "OT_vrsta_intervencije" (id, naziv) FROM stdin;
\.


--
-- TOC entry 2066 (class 0 OID 111857)
-- Dependencies: 182
-- Data for Name: RT_anketa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "RT_anketa" (id, id_korisnik, id_intervencija, odgovor1, odgovor2, odgovor3, odgovor4, odgovor5, odgovor6, odgovor7, predlog_softver, predlog_intervencija) FROM stdin;
\.


--
-- TOC entry 2060 (class 0 OID 111816)
-- Dependencies: 176
-- Data for Name: RT_intervencija; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "RT_intervencija" (id, id_klijent, id_vrsta_intervencije, naziv, opis, link_na_fajl, datum, vreme_od, vreme_do) FROM stdin;
\.


--
-- TOC entry 2080 (class 0 OID 0)
-- Dependencies: 177
-- Name: ot_grupa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ot_grupa_id_seq', 1, false);


--
-- TOC entry 2081 (class 0 OID 0)
-- Dependencies: 174
-- Name: ot_klijent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ot_klijent_id_seq', 1, false);


--
-- TOC entry 2082 (class 0 OID 0)
-- Dependencies: 179
-- Name: ot_korisnik_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ot_korisnik_id_seq', 1, false);


--
-- TOC entry 2083 (class 0 OID 0)
-- Dependencies: 172
-- Name: ot_vrsta_intervencije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ot_vrsta_intervencije_id_seq', 1, false);


--
-- TOC entry 2084 (class 0 OID 0)
-- Dependencies: 181
-- Name: rt_anketa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('rt_anketa_id_seq', 1, false);


--
-- TOC entry 1928 (class 2606 OID 111785)
-- Name: id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "OT_vrsta_intervencije"
    ADD CONSTRAINT id PRIMARY KEY (id);


--
-- TOC entry 1934 (class 2606 OID 111844)
-- Name: ot_grupa_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "OT_grupa"
    ADD CONSTRAINT ot_grupa_id PRIMARY KEY (id);


--
-- TOC entry 1930 (class 2606 OID 111815)
-- Name: ot_klijent_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "OT_klijent"
    ADD CONSTRAINT ot_klijent_id PRIMARY KEY (id);


--
-- TOC entry 1936 (class 2606 OID 111852)
-- Name: ot_korisnik_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "OT_korisnik"
    ADD CONSTRAINT ot_korisnik_id PRIMARY KEY (id);


--
-- TOC entry 1940 (class 2606 OID 111865)
-- Name: rt_anketa_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "RT_anketa"
    ADD CONSTRAINT rt_anketa_id PRIMARY KEY (id);


--
-- TOC entry 1932 (class 2606 OID 111823)
-- Name: rt_intervencija_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "RT_intervencija"
    ADD CONSTRAINT rt_intervencija_id PRIMARY KEY (id);


--
-- TOC entry 1937 (class 1259 OID 111853)
-- Name: user_email_key; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX user_email_key ON "OT_korisnik" USING btree (mejl);


--
-- TOC entry 1938 (class 1259 OID 111854)
-- Name: user_username_key; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX user_username_key ON "OT_korisnik" USING btree (farm);


--
-- TOC entry 1944 (class 2606 OID 111891)
-- Name: ot_grupa_ot_korisnik_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "OT_korisnik"
    ADD CONSTRAINT ot_grupa_ot_korisnik_fk FOREIGN KEY (id_grupa) REFERENCES "OT_grupa"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 1943 (class 2606 OID 111876)
-- Name: ot_klijent_ot_korisnik_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "OT_korisnik"
    ADD CONSTRAINT ot_klijent_ot_korisnik_fk FOREIGN KEY (id_klijent) REFERENCES "OT_klijent"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1942 (class 2606 OID 111881)
-- Name: ot_klijent_rt_intervencija_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "RT_intervencija"
    ADD CONSTRAINT ot_klijent_rt_intervencija_fk FOREIGN KEY (id_klijent) REFERENCES "OT_klijent"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1946 (class 2606 OID 111896)
-- Name: ot_korisnik_rt_anketa_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "RT_anketa"
    ADD CONSTRAINT ot_korisnik_rt_anketa_fk FOREIGN KEY (id_korisnik) REFERENCES "OT_korisnik"(id) ON UPDATE CASCADE;


--
-- TOC entry 1941 (class 2606 OID 111871)
-- Name: ot_vrsta_intervencije_rt_intervencija_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "RT_intervencija"
    ADD CONSTRAINT ot_vrsta_intervencije_rt_intervencija_fk FOREIGN KEY (id_vrsta_intervencije) REFERENCES "OT_vrsta_intervencije"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 1945 (class 2606 OID 111886)
-- Name: rt_intervencija_rt_anketa_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "RT_anketa"
    ADD CONSTRAINT rt_intervencija_rt_anketa_fk FOREIGN KEY (id_intervencija) REFERENCES "RT_intervencija"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2073 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-01-05 09:48:06

--
-- PostgreSQL database dump complete
--


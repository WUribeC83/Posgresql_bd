--
-- PostgreSQL database dump
--

-- Dumped from database version 16.8
-- Dumped by pg_dump version 17.2

-- Started on 2025-02-26 20:26:16

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 8 (class 2615 OID 1622038)
-- Name: William Uribe; Type: SCHEMA; Schema: -; Owner: Comfe_owner
--

CREATE SCHEMA "William Uribe";


ALTER SCHEMA "William Uribe" OWNER TO "Comfe_owner";

--
-- TOC entry 3474 (class 0 OID 0)
-- Dependencies: 8
-- Name: SCHEMA "William Uribe"; Type: COMMENT; Schema: -; Owner: Comfe_owner
--

COMMENT ON SCHEMA "William Uribe" IS 'BD  Asignacion Citas,  para IPS especializada en temas de salud visual, ubicada en la ciudad de Bucaramanga, para tener el record de las citas asignadas en la misma.';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 228 (class 1259 OID 1630342)
-- Name: convenios; Type: TABLE; Schema: William Uribe; Owner: Comfe_owner
--

CREATE TABLE "William Uribe".convenios (
    id integer NOT NULL,
    nom_convenio character varying(20)
);


ALTER TABLE "William Uribe".convenios OWNER TO "Comfe_owner";

--
-- TOC entry 227 (class 1259 OID 1630341)
-- Name: convenios_id_seq; Type: SEQUENCE; Schema: William Uribe; Owner: Comfe_owner
--

CREATE SEQUENCE "William Uribe".convenios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "William Uribe".convenios_id_seq OWNER TO "Comfe_owner";

--
-- TOC entry 3475 (class 0 OID 0)
-- Dependencies: 227
-- Name: convenios_id_seq; Type: SEQUENCE OWNED BY; Schema: William Uribe; Owner: Comfe_owner
--

ALTER SEQUENCE "William Uribe".convenios_id_seq OWNED BY "William Uribe".convenios.id;


--
-- TOC entry 224 (class 1259 OID 1630274)
-- Name: departamentos; Type: TABLE; Schema: William Uribe; Owner: Comfe_owner
--

CREATE TABLE "William Uribe".departamentos (
    id integer NOT NULL,
    nom_dpto character varying(30)
);


ALTER TABLE "William Uribe".departamentos OWNER TO "Comfe_owner";

--
-- TOC entry 223 (class 1259 OID 1630273)
-- Name: departamento_id_seq; Type: SEQUENCE; Schema: William Uribe; Owner: Comfe_owner
--

CREATE SEQUENCE "William Uribe".departamento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "William Uribe".departamento_id_seq OWNER TO "Comfe_owner";

--
-- TOC entry 3476 (class 0 OID 0)
-- Dependencies: 223
-- Name: departamento_id_seq; Type: SEQUENCE OWNED BY; Schema: William Uribe; Owner: Comfe_owner
--

ALTER SEQUENCE "William Uribe".departamento_id_seq OWNED BY "William Uribe".departamentos.id;


--
-- TOC entry 242 (class 1259 OID 1630419)
-- Name: especialidades; Type: TABLE; Schema: William Uribe; Owner: Comfe_owner
--

CREATE TABLE "William Uribe".especialidades (
    id integer NOT NULL,
    nom_especialidad character varying(20)
);


ALTER TABLE "William Uribe".especialidades OWNER TO "Comfe_owner";

--
-- TOC entry 241 (class 1259 OID 1630418)
-- Name: especialidades_id_seq; Type: SEQUENCE; Schema: William Uribe; Owner: Comfe_owner
--

CREATE SEQUENCE "William Uribe".especialidades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "William Uribe".especialidades_id_seq OWNER TO "Comfe_owner";

--
-- TOC entry 3477 (class 0 OID 0)
-- Dependencies: 241
-- Name: especialidades_id_seq; Type: SEQUENCE OWNED BY; Schema: William Uribe; Owner: Comfe_owner
--

ALTER SEQUENCE "William Uribe".especialidades_id_seq OWNED BY "William Uribe".especialidades.id;


--
-- TOC entry 226 (class 1259 OID 1630335)
-- Name: municipios; Type: TABLE; Schema: William Uribe; Owner: Comfe_owner
--

CREATE TABLE "William Uribe".municipios (
    id integer NOT NULL,
    departamentos_id integer,
    nom_municip character varying(30)
);


ALTER TABLE "William Uribe".municipios OWNER TO "Comfe_owner";

--
-- TOC entry 225 (class 1259 OID 1630334)
-- Name: municipios_id_seq; Type: SEQUENCE; Schema: William Uribe; Owner: Comfe_owner
--

CREATE SEQUENCE "William Uribe".municipios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "William Uribe".municipios_id_seq OWNER TO "Comfe_owner";

--
-- TOC entry 3478 (class 0 OID 0)
-- Dependencies: 225
-- Name: municipios_id_seq; Type: SEQUENCE OWNED BY; Schema: William Uribe; Owner: Comfe_owner
--

ALTER SEQUENCE "William Uribe".municipios_id_seq OWNED BY "William Uribe".municipios.id;


--
-- TOC entry 222 (class 1259 OID 1630254)
-- Name: pacientes; Type: TABLE; Schema: William Uribe; Owner: Comfe_owner
--

CREATE TABLE "William Uribe".pacientes (
    id integer NOT NULL,
    tipo_doc character varying(3),
    nro_doc character varying(20),
    direccion_residencia character varying(50),
    movil_contacto character varying(10),
    departamentos_id integer,
    municipios_id integer
);


ALTER TABLE "William Uribe".pacientes OWNER TO "Comfe_owner";

--
-- TOC entry 221 (class 1259 OID 1630253)
-- Name: pacientes_id_seq; Type: SEQUENCE; Schema: William Uribe; Owner: Comfe_owner
--

CREATE SEQUENCE "William Uribe".pacientes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "William Uribe".pacientes_id_seq OWNER TO "Comfe_owner";

--
-- TOC entry 3479 (class 0 OID 0)
-- Dependencies: 221
-- Name: pacientes_id_seq; Type: SEQUENCE OWNED BY; Schema: William Uribe; Owner: Comfe_owner
--

ALTER SEQUENCE "William Uribe".pacientes_id_seq OWNED BY "William Uribe".pacientes.id;


--
-- TOC entry 232 (class 1259 OID 1630356)
-- Name: profesionales; Type: TABLE; Schema: William Uribe; Owner: Comfe_owner
--

CREATE TABLE "William Uribe".profesionales (
    id integer NOT NULL,
    nombre_prof character varying(50),
    tipo_doc character varying(3),
    nro_doc character varying(15),
    ubicacion character varying(30),
    sede character varying(10),
    especialidades_id integer,
    activo boolean NOT NULL
);


ALTER TABLE "William Uribe".profesionales OWNER TO "Comfe_owner";

--
-- TOC entry 231 (class 1259 OID 1630355)
-- Name: profesionales_id_seq; Type: SEQUENCE; Schema: William Uribe; Owner: Comfe_owner
--

CREATE SEQUENCE "William Uribe".profesionales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "William Uribe".profesionales_id_seq OWNER TO "Comfe_owner";

--
-- TOC entry 3480 (class 0 OID 0)
-- Dependencies: 231
-- Name: profesionales_id_seq; Type: SEQUENCE OWNED BY; Schema: William Uribe; Owner: Comfe_owner
--

ALTER SEQUENCE "William Uribe".profesionales_id_seq OWNED BY "William Uribe".profesionales.id;


--
-- TOC entry 3299 (class 2604 OID 1630345)
-- Name: convenios id; Type: DEFAULT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".convenios ALTER COLUMN id SET DEFAULT nextval('"William Uribe".convenios_id_seq'::regclass);


--
-- TOC entry 3297 (class 2604 OID 1630277)
-- Name: departamentos id; Type: DEFAULT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".departamentos ALTER COLUMN id SET DEFAULT nextval('"William Uribe".departamento_id_seq'::regclass);


--
-- TOC entry 3301 (class 2604 OID 1630422)
-- Name: especialidades id; Type: DEFAULT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".especialidades ALTER COLUMN id SET DEFAULT nextval('"William Uribe".especialidades_id_seq'::regclass);


--
-- TOC entry 3298 (class 2604 OID 1630338)
-- Name: municipios id; Type: DEFAULT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".municipios ALTER COLUMN id SET DEFAULT nextval('"William Uribe".municipios_id_seq'::regclass);


--
-- TOC entry 3296 (class 2604 OID 1630257)
-- Name: pacientes id; Type: DEFAULT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".pacientes ALTER COLUMN id SET DEFAULT nextval('"William Uribe".pacientes_id_seq'::regclass);


--
-- TOC entry 3300 (class 2604 OID 1630359)
-- Name: profesionales id; Type: DEFAULT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".profesionales ALTER COLUMN id SET DEFAULT nextval('"William Uribe".profesionales_id_seq'::regclass);


--
-- TOC entry 3464 (class 0 OID 1630342)
-- Dependencies: 228
-- Data for Name: convenios; Type: TABLE DATA; Schema: William Uribe; Owner: Comfe_owner
--

COPY "William Uribe".convenios (id, nom_convenio) FROM stdin;
\.


--
-- TOC entry 3460 (class 0 OID 1630274)
-- Dependencies: 224
-- Data for Name: departamentos; Type: TABLE DATA; Schema: William Uribe; Owner: Comfe_owner
--

COPY "William Uribe".departamentos (id, nom_dpto) FROM stdin;
\.


--
-- TOC entry 3468 (class 0 OID 1630419)
-- Dependencies: 242
-- Data for Name: especialidades; Type: TABLE DATA; Schema: William Uribe; Owner: Comfe_owner
--

COPY "William Uribe".especialidades (id, nom_especialidad) FROM stdin;
\.


--
-- TOC entry 3462 (class 0 OID 1630335)
-- Dependencies: 226
-- Data for Name: municipios; Type: TABLE DATA; Schema: William Uribe; Owner: Comfe_owner
--

COPY "William Uribe".municipios (id, departamentos_id, nom_municip) FROM stdin;
\.


--
-- TOC entry 3458 (class 0 OID 1630254)
-- Dependencies: 222
-- Data for Name: pacientes; Type: TABLE DATA; Schema: William Uribe; Owner: Comfe_owner
--

COPY "William Uribe".pacientes (id, tipo_doc, nro_doc, direccion_residencia, movil_contacto, departamentos_id, municipios_id) FROM stdin;
\.


--
-- TOC entry 3466 (class 0 OID 1630356)
-- Dependencies: 232
-- Data for Name: profesionales; Type: TABLE DATA; Schema: William Uribe; Owner: Comfe_owner
--

COPY "William Uribe".profesionales (id, nombre_prof, tipo_doc, nro_doc, ubicacion, sede, especialidades_id, activo) FROM stdin;
\.


--
-- TOC entry 3481 (class 0 OID 0)
-- Dependencies: 227
-- Name: convenios_id_seq; Type: SEQUENCE SET; Schema: William Uribe; Owner: Comfe_owner
--

SELECT pg_catalog.setval('"William Uribe".convenios_id_seq', 1, false);


--
-- TOC entry 3482 (class 0 OID 0)
-- Dependencies: 223
-- Name: departamento_id_seq; Type: SEQUENCE SET; Schema: William Uribe; Owner: Comfe_owner
--

SELECT pg_catalog.setval('"William Uribe".departamento_id_seq', 1, false);


--
-- TOC entry 3483 (class 0 OID 0)
-- Dependencies: 241
-- Name: especialidades_id_seq; Type: SEQUENCE SET; Schema: William Uribe; Owner: Comfe_owner
--

SELECT pg_catalog.setval('"William Uribe".especialidades_id_seq', 1, false);


--
-- TOC entry 3484 (class 0 OID 0)
-- Dependencies: 225
-- Name: municipios_id_seq; Type: SEQUENCE SET; Schema: William Uribe; Owner: Comfe_owner
--

SELECT pg_catalog.setval('"William Uribe".municipios_id_seq', 1, false);


--
-- TOC entry 3485 (class 0 OID 0)
-- Dependencies: 221
-- Name: pacientes_id_seq; Type: SEQUENCE SET; Schema: William Uribe; Owner: Comfe_owner
--

SELECT pg_catalog.setval('"William Uribe".pacientes_id_seq', 1, false);


--
-- TOC entry 3486 (class 0 OID 0)
-- Dependencies: 231
-- Name: profesionales_id_seq; Type: SEQUENCE SET; Schema: William Uribe; Owner: Comfe_owner
--

SELECT pg_catalog.setval('"William Uribe".profesionales_id_seq', 1, false);


--
-- TOC entry 3309 (class 2606 OID 1630347)
-- Name: convenios convenios_pkey; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".convenios
    ADD CONSTRAINT convenios_pkey PRIMARY KEY (id);


--
-- TOC entry 3305 (class 2606 OID 1630279)
-- Name: departamentos departamento_pkey; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".departamentos
    ADD CONSTRAINT departamento_pkey PRIMARY KEY (id);


--
-- TOC entry 3313 (class 2606 OID 1630424)
-- Name: especialidades especialidades_pkey; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".especialidades
    ADD CONSTRAINT especialidades_pkey PRIMARY KEY (id);


--
-- TOC entry 3307 (class 2606 OID 1630340)
-- Name: municipios municipios_pkey; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".municipios
    ADD CONSTRAINT municipios_pkey PRIMARY KEY (id);


--
-- TOC entry 3303 (class 2606 OID 1630259)
-- Name: pacientes pacientes_pkey; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".pacientes
    ADD CONSTRAINT pacientes_pkey PRIMARY KEY (id);


--
-- TOC entry 3311 (class 2606 OID 1630361)
-- Name: profesionales profesionales_pkey; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".profesionales
    ADD CONSTRAINT profesionales_pkey PRIMARY KEY (id);


-- Completed on 2025-02-26 20:26:27

--
-- PostgreSQL database dump complete
--


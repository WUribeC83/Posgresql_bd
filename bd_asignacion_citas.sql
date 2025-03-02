--
-- PostgreSQL database dump
--

-- Dumped from database version 16.8
-- Dumped by pg_dump version 17.2

-- Started on 2025-03-01 19:43:01

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
-- TOC entry 3552 (class 0 OID 0)
-- Dependencies: 8
-- Name: SCHEMA "William Uribe"; Type: COMMENT; Schema: -; Owner: Comfe_owner
--

COMMENT ON SCHEMA "William Uribe" IS 'BD  Asignacion Citas,  para IPS especializada en temas de salud visual, ubicada en la ciudad de Bucaramanga, para tener el record de las citas asignadas en la misma.';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 266 (class 1259 OID 1654791)
-- Name: citas; Type: TABLE; Schema: William Uribe; Owner: Comfe_owner
--

CREATE TABLE "William Uribe".citas (
    id integer NOT NULL,
    pacientes_id integer NOT NULL,
    convenios_id integer NOT NULL,
    consultorios_id integer NOT NULL,
    profesionales_id integer NOT NULL,
    tipos_citas_id integer NOT NULL,
    fecha_cita date NOT NULL,
    hora_cita time without time zone NOT NULL,
    est_cita_id integer NOT NULL,
    usuarios_id integer,
    fecha_reg timestamp without time zone
);


ALTER TABLE "William Uribe".citas OWNER TO "Comfe_owner";

--
-- TOC entry 267 (class 1259 OID 1654798)
-- Name: citas_id_seq; Type: SEQUENCE; Schema: William Uribe; Owner: Comfe_owner
--

CREATE SEQUENCE "William Uribe".citas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "William Uribe".citas_id_seq OWNER TO "Comfe_owner";

--
-- TOC entry 3553 (class 0 OID 0)
-- Dependencies: 267
-- Name: citas_id_seq; Type: SEQUENCE OWNED BY; Schema: William Uribe; Owner: Comfe_owner
--

ALTER SEQUENCE "William Uribe".citas_id_seq OWNED BY "William Uribe".citas.id;


--
-- TOC entry 265 (class 1259 OID 1654785)
-- Name: consultorios; Type: TABLE; Schema: William Uribe; Owner: Comfe_owner
--

CREATE TABLE "William Uribe".consultorios (
    id integer NOT NULL,
    nombre_consultorio character varying(30) NOT NULL
);


ALTER TABLE "William Uribe".consultorios OWNER TO "Comfe_owner";

--
-- TOC entry 264 (class 1259 OID 1654784)
-- Name: consultorios_id_seq; Type: SEQUENCE; Schema: William Uribe; Owner: Comfe_owner
--

CREATE SEQUENCE "William Uribe".consultorios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "William Uribe".consultorios_id_seq OWNER TO "Comfe_owner";

--
-- TOC entry 3554 (class 0 OID 0)
-- Dependencies: 264
-- Name: consultorios_id_seq; Type: SEQUENCE OWNED BY; Schema: William Uribe; Owner: Comfe_owner
--

ALTER SEQUENCE "William Uribe".consultorios_id_seq OWNED BY "William Uribe".consultorios.id;


--
-- TOC entry 228 (class 1259 OID 1630342)
-- Name: convenios; Type: TABLE; Schema: William Uribe; Owner: Comfe_owner
--

CREATE TABLE "William Uribe".convenios (
    id integer NOT NULL,
    nom_convenio character varying(20) NOT NULL
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
-- TOC entry 3555 (class 0 OID 0)
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
-- TOC entry 3556 (class 0 OID 0)
-- Dependencies: 223
-- Name: departamento_id_seq; Type: SEQUENCE OWNED BY; Schema: William Uribe; Owner: Comfe_owner
--

ALTER SEQUENCE "William Uribe".departamento_id_seq OWNED BY "William Uribe".departamentos.id;


--
-- TOC entry 242 (class 1259 OID 1630419)
-- Name: tipos_citas; Type: TABLE; Schema: William Uribe; Owner: Comfe_owner
--

CREATE TABLE "William Uribe".tipos_citas (
    id integer NOT NULL,
    tipo_cita character varying(50)
);


ALTER TABLE "William Uribe".tipos_citas OWNER TO "Comfe_owner";

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
-- TOC entry 3557 (class 0 OID 0)
-- Dependencies: 241
-- Name: especialidades_id_seq; Type: SEQUENCE OWNED BY; Schema: William Uribe; Owner: Comfe_owner
--

ALTER SEQUENCE "William Uribe".especialidades_id_seq OWNED BY "William Uribe".tipos_citas.id;


--
-- TOC entry 295 (class 1259 OID 1736705)
-- Name: est_cita; Type: TABLE; Schema: William Uribe; Owner: Comfe_owner
--

CREATE TABLE "William Uribe".est_cita (
    id integer NOT NULL,
    estado character varying(15)
);


ALTER TABLE "William Uribe".est_cita OWNER TO "Comfe_owner";

--
-- TOC entry 294 (class 1259 OID 1736704)
-- Name: est_cita_id_seq; Type: SEQUENCE; Schema: William Uribe; Owner: Comfe_owner
--

CREATE SEQUENCE "William Uribe".est_cita_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "William Uribe".est_cita_id_seq OWNER TO "Comfe_owner";

--
-- TOC entry 3558 (class 0 OID 0)
-- Dependencies: 294
-- Name: est_cita_id_seq; Type: SEQUENCE OWNED BY; Schema: William Uribe; Owner: Comfe_owner
--

ALTER SEQUENCE "William Uribe".est_cita_id_seq OWNED BY "William Uribe".est_cita.id;


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
-- TOC entry 3559 (class 0 OID 0)
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
    tipo_doc character varying(3) NOT NULL,
    nro_doc character varying(20) NOT NULL,
    nombre_completo character varying(100) NOT NULL,
    tel_contacto character varying(10),
    departamentos_id integer,
    municipios_id integer,
    direccion_residencia character varying(100)
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
-- TOC entry 3560 (class 0 OID 0)
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
    nombre_prof character varying(50) NOT NULL,
    profesion character varying(30),
    activo boolean DEFAULT true NOT NULL
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
-- TOC entry 3561 (class 0 OID 0)
-- Dependencies: 231
-- Name: profesionales_id_seq; Type: SEQUENCE OWNED BY; Schema: William Uribe; Owner: Comfe_owner
--

ALTER SEQUENCE "William Uribe".profesionales_id_seq OWNED BY "William Uribe".profesionales.id;


--
-- TOC entry 297 (class 1259 OID 1753093)
-- Name: usuarios; Type: TABLE; Schema: William Uribe; Owner: Comfe_owner
--

CREATE TABLE "William Uribe".usuarios (
    id integer NOT NULL,
    nom_usr character varying(50),
    "user" character varying(20),
    CONSTRAINT solo_mayusc_usr CHECK ((upper((nom_usr)::text) = (nom_usr)::text))
);


ALTER TABLE "William Uribe".usuarios OWNER TO "Comfe_owner";

--
-- TOC entry 296 (class 1259 OID 1753092)
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: William Uribe; Owner: Comfe_owner
--

CREATE SEQUENCE "William Uribe".usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "William Uribe".usuarios_id_seq OWNER TO "Comfe_owner";

--
-- TOC entry 3562 (class 0 OID 0)
-- Dependencies: 296
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: William Uribe; Owner: Comfe_owner
--

ALTER SEQUENCE "William Uribe".usuarios_id_seq OWNED BY "William Uribe".usuarios.id;


--
-- TOC entry 3352 (class 2604 OID 1654799)
-- Name: citas id; Type: DEFAULT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".citas ALTER COLUMN id SET DEFAULT nextval('"William Uribe".citas_id_seq'::regclass);


--
-- TOC entry 3351 (class 2604 OID 1654788)
-- Name: consultorios id; Type: DEFAULT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".consultorios ALTER COLUMN id SET DEFAULT nextval('"William Uribe".consultorios_id_seq'::regclass);


--
-- TOC entry 3347 (class 2604 OID 1630345)
-- Name: convenios id; Type: DEFAULT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".convenios ALTER COLUMN id SET DEFAULT nextval('"William Uribe".convenios_id_seq'::regclass);


--
-- TOC entry 3345 (class 2604 OID 1630277)
-- Name: departamentos id; Type: DEFAULT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".departamentos ALTER COLUMN id SET DEFAULT nextval('"William Uribe".departamento_id_seq'::regclass);


--
-- TOC entry 3353 (class 2604 OID 1736708)
-- Name: est_cita id; Type: DEFAULT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".est_cita ALTER COLUMN id SET DEFAULT nextval('"William Uribe".est_cita_id_seq'::regclass);


--
-- TOC entry 3346 (class 2604 OID 1630338)
-- Name: municipios id; Type: DEFAULT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".municipios ALTER COLUMN id SET DEFAULT nextval('"William Uribe".municipios_id_seq'::regclass);


--
-- TOC entry 3344 (class 2604 OID 1630257)
-- Name: pacientes id; Type: DEFAULT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".pacientes ALTER COLUMN id SET DEFAULT nextval('"William Uribe".pacientes_id_seq'::regclass);


--
-- TOC entry 3348 (class 2604 OID 1630359)
-- Name: profesionales id; Type: DEFAULT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".profesionales ALTER COLUMN id SET DEFAULT nextval('"William Uribe".profesionales_id_seq'::regclass);


--
-- TOC entry 3350 (class 2604 OID 1630422)
-- Name: tipos_citas id; Type: DEFAULT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".tipos_citas ALTER COLUMN id SET DEFAULT nextval('"William Uribe".especialidades_id_seq'::regclass);


--
-- TOC entry 3354 (class 2604 OID 1753096)
-- Name: usuarios id; Type: DEFAULT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".usuarios ALTER COLUMN id SET DEFAULT nextval('"William Uribe".usuarios_id_seq'::regclass);


--
-- TOC entry 3541 (class 0 OID 1654791)
-- Dependencies: 266
-- Data for Name: citas; Type: TABLE DATA; Schema: William Uribe; Owner: Comfe_owner
--

INSERT INTO "William Uribe".citas VALUES (1, 85, 9, 4, 47, 25, '2025-01-02', '09:10:00', 1, 1, '2025-01-02 07:54:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (2, 159, 2, 1, 15, 32, '2025-01-02', '11:35:00', 2, 2, '2024-12-30 09:46:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (3, 188, 2, 4, 16, 30, '2025-01-02', '15:45:00', 1, 2, '2024-12-20 16:02:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (4, 234, 2, 2, 45, 27, '2025-01-03', '08:00:00', 1, 3, '2024-12-30 15:05:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (5, 236, 2, 2, 45, 25, '2025-01-03', '09:15:00', 3, 4, '2024-12-30 15:03:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (6, 89, 3, 6, 2, 29, '2025-01-03', '10:45:00', 1, 5, '2025-01-03 07:28:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (7, 93, 5, 1, 18, 39, '2025-01-03', '11:40:00', 2, 6, '2024-12-12 10:23:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (8, 262, 1, 4, 58, 10, '2025-01-04', '07:40:00', 1, 7, '2025-01-04 07:48:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (9, 276, 7, 8, 9, 31, '2025-01-05', '10:30:00', 1, 8, '2025-01-05 10:23:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (10, 84, 2, 6, 2, 27, '2025-01-07', '10:30:00', 3, 9, '2024-12-18 15:06:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (11, 213, 1, 1, 17, 22, '2025-01-07', '13:00:00', 1, 10, '2024-12-27 11:33:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (12, 201, 3, 6, 52, 30, '2025-01-08', '08:40:00', 3, 11, '2024-12-30 10:37:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (13, 237, 2, 6, 52, 31, '2025-01-08', '11:40:00', 3, 9, '2024-12-17 09:10:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (14, 200, 1, 1, 15, 3, '2025-01-08', '00:00:00', 1, 12, '2024-12-27 07:42:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (15, 83, 2, 3, 44, 28, '2025-01-08', '14:45:00', 1, 13, '2025-01-02 11:34:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (16, 272, 2, 5, 41, 30, '2025-01-08', '15:00:00', 1, 14, '2025-01-02 11:04:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (17, 236, 2, 6, 45, 25, '2025-01-08', '15:15:00', 1, 4, '2024-12-30 15:07:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (18, 153, 10, 10, 7, 25, '2025-01-08', '15:30:00', 1, 13, '2025-01-07 15:38:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (19, 208, 1, 1, 15, 1, '2025-01-09', '07:50:00', 1, 15, '2024-12-31 11:01:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (20, 171, 1, 10, 24, 25, '2025-01-09', '08:00:00', 1, 16, '2025-01-09 07:45:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (21, 210, 2, 4, 61, 25, '2025-01-09', '14:45:00', 1, 13, '2024-12-23 09:59:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (22, 116, 3, 10, 7, 25, '2025-01-09', '15:10:00', 1, 17, '2025-01-08 08:50:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (23, 197, 2, 3, 11, 9, '2025-01-10', '08:00:00', 1, 6, '2024-12-17 09:37:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (24, 162, 2, 1, 20, 39, '2025-01-10', '08:00:00', 1, 18, '2025-01-10 10:23:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (25, 174, 2, 3, 11, 9, '2025-01-10', '08:55:00', 1, 19, '2025-01-08 08:19:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (26, 112, 9, 1, 17, 24, '2025-01-10', '10:25:00', 1, 18, '2025-01-07 09:22:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (27, 12, 1, 1, 15, 37, '2025-01-10', '11:10:00', 2, 15, '2024-12-28 10:01:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (28, 13, 4, 4, 47, 10, '2025-01-10', '13:20:00', 1, 20, '2025-01-10 10:20:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (29, 137, 3, 6, 52, 30, '2025-01-10', '15:20:00', 3, 5, '2025-01-08 09:41:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (30, 74, 2, 3, 51, 30, '2025-01-10', '16:00:00', 1, 2, '2024-12-19 09:33:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (31, 267, 8, 3, 38, 25, '2025-01-11', '07:30:00', 1, 2, '2024-12-27 10:40:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (32, 117, 4, 10, 47, 25, '2025-01-11', '08:15:00', 1, 4, '2024-12-26 09:27:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (33, 204, 8, 1, 15, 39, '2025-01-11', '09:40:00', 2, 21, '2025-01-10 10:25:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (34, 169, 3, 6, 2, 10, '2025-01-13', '07:00:00', 1, 5, '2025-01-10 07:14:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (35, 69, 5, 4, 26, 35, '2025-01-13', '09:00:00', 2, 22, '2025-01-08 15:30:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (36, 130, 3, 4, 26, 12, '2025-01-13', '09:30:00', 1, 4, '2025-01-03 13:56:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (37, 281, 4, 10, 57, 17, '2025-01-13', '15:00:00', 1, 23, '2025-01-13 15:38:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (38, 23, 5, 10, 47, 25, '2025-01-13', '15:30:00', 1, 4, '2025-01-09 11:03:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (39, 232, 2, 3, 29, 25, '2025-01-13', '16:00:00', 1, 4, '2024-12-26 14:31:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (40, 92, 2, 6, 52, 30, '2025-01-14', '07:20:00', 1, 5, '2025-01-02 11:15:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (41, 230, 7, 7, 54, 30, '2025-01-14', '08:30:00', 1, 24, '2025-01-14 07:27:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (42, 151, 4, 4, 61, 10, '2025-01-14', '14:25:00', 1, 25, '2025-01-07 12:07:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (43, 49, 13, 4, 61, 25, '2025-01-14', '15:40:00', 1, 26, '2025-01-13 09:25:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (44, 78, 2, 3, 29, 27, '2025-01-14', '15:45:00', 1, 27, '2025-01-02 12:27:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (45, 263, 2, 3, 51, 30, '2025-01-15', '07:00:00', 2, 4, '2025-01-13 16:24:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (46, 100, 17, 1, 49, 24, '2025-01-15', '07:00:00', 2, 21, '2025-01-14 10:03:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (47, 178, 1, 2, 5, 6, '2025-01-15', '07:30:00', 1, 15, '2025-01-02 09:26:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (48, 194, 5, 3, 61, 25, '2025-01-15', '07:45:00', 3, 6, '2024-12-31 08:17:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (49, 118, 3, 4, 26, 34, '2025-01-15', '07:55:00', 2, 28, '2025-01-14 09:15:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (50, 255, 3, 4, 62, 25, '2025-01-15', '08:00:00', 1, 26, '2025-01-03 14:55:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (51, 65, 4, 10, 7, 36, '2025-01-15', '08:10:00', 1, 29, '2025-01-08 10:58:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (52, 183, 4, 1, 15, 3, '2025-01-15', '09:30:00', 1, 30, '2025-01-08 14:18:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (53, 6, 8, 4, 62, 25, '2025-01-15', '16:15:00', 1, 13, '2025-01-07 07:16:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (54, 64, 1, 2, 5, 30, '2025-01-16', '07:00:00', 3, 31, '2025-01-02 11:06:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (55, 45, 2, 3, 38, 25, '2025-01-16', '07:45:00', 1, 4, '2024-12-30 07:29:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (56, 9, 2, 3, 38, 10, '2025-01-16', '10:30:00', 1, 2, '2025-01-02 16:42:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (57, 258, 6, 10, 7, 25, '2025-01-16', '13:40:00', 1, 2, '2025-01-08 17:02:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (58, 257, 1, 4, 47, 25, '2025-01-16', '14:00:00', 1, 32, '2024-12-26 14:14:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (59, 107, 2, 6, 45, 27, '2025-01-16', '15:00:00', 3, 13, '2025-01-15 11:04:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (60, 58, 2, 4, 16, 30, '2025-01-16', '16:00:00', 3, 27, '2024-12-23 15:44:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (61, 21, 2, 8, 42, 31, '2025-01-16', '16:40:00', 1, 27, '2024-12-10 09:05:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (62, 132, 4, 10, 58, 12, '2025-01-17', '09:40:00', 1, 29, '2025-01-16 15:21:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (63, 238, 2, 1, 15, 3, '2025-01-17', '09:50:00', 1, 30, '2025-01-15 15:39:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (64, 47, 2, 3, 29, 27, '2025-01-17', '16:00:00', 1, 30, '2025-01-15 11:17:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (65, 101, 2, 3, 29, 27, '2025-01-17', '16:15:00', 3, 33, '2024-12-26 08:55:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (66, 226, 4, 10, 61, 25, '2025-01-18', '07:30:00', 1, 34, '2025-01-02 09:59:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (67, 139, 4, 10, 61, 25, '2025-01-18', '07:40:00', 1, 6, '2025-01-16 15:47:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (68, 211, 4, 4, 11, 9, '2025-01-18', '08:00:00', 2, 26, '2024-12-28 09:11:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (69, 28, 5, 1, 17, 22, '2025-01-18', '08:15:00', 2, 35, '2025-01-16 15:57:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (70, 241, 5, 4, 47, 10, '2025-01-18', '10:50:00', 1, 4, '2025-01-15 07:35:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (71, 225, 1, 4, 11, 18, '2025-01-18', '11:15:00', 1, 19, '2025-01-17 10:50:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (72, 8, 2, 3, 29, 27, '2025-01-20', '09:00:00', 1, 2, '2025-01-09 10:43:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (73, 206, 5, 1, 18, 37, '2025-01-20', '09:25:00', 2, 17, '2025-01-16 08:53:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (74, 96, 2, 3, 29, 27, '2025-01-20', '10:15:00', 1, 27, '2025-01-02 07:37:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (75, 104, 2, 5, 34, 30, '2025-01-20', '10:20:00', 1, 14, '2025-01-15 16:18:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (76, 80, 1, 1, 15, 37, '2025-01-20', '10:35:00', 2, 26, '2025-01-16 17:03:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (77, 246, 3, 6, 2, 29, '2025-01-20', '00:00:00', 1, 5, '2025-01-18 08:19:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (78, 167, 9, 1, 18, 39, '2025-01-20', '14:15:00', 2, 6, '2025-01-17 08:07:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (79, 155, 3, 1, 48, 17, '2025-01-20', '14:45:00', 1, 23, '2025-01-20 15:31:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (80, 168, 5, 4, 62, 10, '2025-01-20', '15:00:00', 1, 30, '2025-01-03 14:34:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (81, 182, 4, 10, 47, 34, '2025-01-20', '15:20:00', 1, 25, '2025-01-14 14:55:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (82, 34, 5, 3, 3, 7, '2025-01-21', '07:30:00', 3, 36, '2025-01-14 07:44:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (83, 187, 1, 2, 25, 21, '2025-01-21', '08:15:00', 1, 37, '2024-11-29 10:10:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (84, 148, 11, 4, 26, 36, '2025-01-21', '08:15:00', 1, 19, '2025-01-21 07:39:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (85, 181, 2, 1, 20, 37, '2025-01-21', '08:20:00', 2, 18, '2025-01-21 07:53:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (86, 7, 1, 1, 17, 22, '2025-01-21', '09:15:00', 1, 15, '2025-01-08 11:06:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (87, 143, 2, 1, 14, 33, '2025-01-21', '10:00:00', 1, 13, '2025-01-20 08:11:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (88, 268, 3, 4, 62, 10, '2025-01-21', '10:25:00', 1, 22, '2025-01-20 17:55:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (89, 231, 3, 4, 62, 25, '2025-01-21', '10:30:00', 3, 20, '2025-01-20 16:40:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (90, 46, 1, 1, 15, 37, '2025-01-21', '13:40:00', 1, 38, '2025-01-14 14:25:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (91, 29, 4, 10, 47, 25, '2025-01-21', '14:00:00', 3, 2, '2024-12-30 15:56:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (92, 127, 2, 8, 42, 31, '2025-01-21', '17:40:00', 1, 6, '2025-01-13 10:44:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (93, 53, 1, 2, 5, 6, '2025-01-22', '07:30:00', 1, 39, '2025-01-07 12:15:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (94, 136, 1, 1, 20, 39, '2025-01-22', '08:05:00', 2, 21, '2025-01-21 10:10:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (95, 77, 2, 10, 11, 13, '2025-01-22', '08:15:00', 2, 36, '2024-12-27 07:20:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (96, 30, 4, 3, 61, 36, '2025-01-22', '09:50:00', 1, 29, '2025-01-14 09:18:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (97, 163, 2, 1, 15, 3, '2025-01-22', '13:05:00', 1, 38, '2025-01-09 14:18:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (98, 175, 1, 10, 7, 25, '2025-01-22', '13:55:00', 1, 1, '2025-01-22 07:29:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (99, 142, 2, 1, 14, 33, '2025-01-22', '14:00:00', 1, 1, '2025-01-16 17:55:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (100, 205, 3, 1, 18, 39, '2025-01-22', '14:55:00', 1, 13, '2025-01-22 08:34:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (101, 221, 4, 1, 4, 2, '2025-01-23', '06:30:00', 3, 21, '2025-01-02 16:45:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (102, 242, 4, 3, 38, 25, '2025-01-23', '08:30:00', 1, 6, '2024-12-30 09:51:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (103, 114, 4, 4, 61, 25, '2025-01-23', '13:50:00', 3, 13, '2025-01-13 09:46:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (104, 133, 2, 1, 15, 20, '2025-01-23', '14:55:00', 1, 34, '2025-01-21 15:41:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (105, 220, 11, 10, 24, 26, '2025-01-23', '15:00:00', 1, 30, '2025-01-09 14:35:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (106, 10, 4, 1, 18, 3, '2025-01-24', '07:00:00', 1, 18, '2025-01-23 10:34:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (107, 94, 5, 1, 49, 24, '2025-01-24', '08:00:00', 1, 35, '2025-01-23 11:58:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (108, 160, 2, 3, 29, 25, '2025-01-24', '08:30:00', 1, 6, '2025-01-10 07:22:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (109, 156, 2, 1, 20, 24, '2025-01-24', '08:30:00', 2, 18, '2025-01-23 16:44:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (110, 199, 5, 4, 62, 25, '2025-01-24', '09:15:00', 1, 26, '2025-01-09 08:42:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (111, 35, 10, 10, 58, 25, '2025-01-24', '10:10:00', 1, 6, '2025-01-16 11:09:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (112, 147, 9, 1, 18, 39, '2025-01-24', '13:00:00', 2, 27, '2025-01-10 09:20:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (113, 283, 8, 4, 47, 10, '2025-01-24', '13:55:00', 1, 7, '2025-01-22 13:25:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (114, 37, 2, 3, 38, 10, '2025-01-24', '14:10:00', 1, 18, '2025-01-21 16:12:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (115, 244, 2, 10, 58, 25, '2025-01-24', '14:15:00', 1, 30, '2025-01-02 15:10:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (116, 25, 4, 4, 26, 10, '2025-01-25', '07:30:00', 1, 25, '2025-01-17 09:23:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (117, 103, 2, 3, 38, 25, '2025-01-25', '09:00:00', 1, 9, '2025-01-14 09:50:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (118, 222, 5, 1, 20, 39, '2025-01-27', '07:05:00', 2, 21, '2025-01-27 10:42:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (119, 207, 1, 3, 61, 25, '2025-01-27', '15:30:00', 1, 10, '2025-01-14 11:45:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (120, 16, 4, 10, 47, 10, '2025-01-28', '08:55:00', 3, 25, '2025-01-27 11:13:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (121, 218, 8, 4, 62, 25, '2025-01-28', '10:40:00', 1, 28, '2025-01-27 14:25:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (122, 57, 2, 3, 29, 27, '2025-01-28', '10:45:00', 1, 30, '2025-01-27 10:00:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (123, 102, 14, 1, 49, 22, '2025-01-28', '11:30:00', 3, 21, '2025-01-28 07:18:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (124, 61, 3, 4, 61, 25, '2025-01-28', '14:40:00', 1, 26, '2025-01-14 14:27:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (125, 149, 2, 7, 30, 31, '2025-01-28', '15:00:00', 1, 4, '2025-01-28 09:38:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (126, 252, 2, 1, 15, 37, '2025-01-28', '16:30:00', 1, 12, '2025-01-09 17:18:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (127, 111, 13, 10, 7, 25, '2025-01-29', '07:45:00', 1, 26, '2024-12-26 09:06:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (128, 275, 4, 10, 7, 25, '2025-01-29', '08:00:00', 1, 4, '2024-12-27 07:23:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (129, 62, 2, 10, 11, 13, '2025-01-29', '08:30:00', 1, 36, '2025-01-09 11:23:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (130, 125, 2, 4, 56, 25, '2025-01-29', '08:45:00', 1, 27, '2025-01-13 15:24:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (131, 145, 13, 1, 8, 4, '2025-01-29', '10:30:00', 2, 6, '2025-01-14 09:04:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (132, 73, 1, 1, 15, 39, '2025-01-29', '13:45:00', 2, 15, '2025-01-15 08:58:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (133, 97, 2, 7, 30, 31, '2025-01-29', '14:00:00', 1, 6, '2025-01-16 16:53:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (134, 72, 4, 4, 61, 25, '2025-01-29', '14:40:00', 3, 33, '2025-01-29 08:21:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (135, 121, 3, 4, 26, 10, '2025-01-29', '14:40:00', 1, 20, '2024-12-27 15:21:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (136, 146, 2, 4, 16, 30, '2025-01-29', '16:30:00', 1, 2, '2025-01-15 12:35:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (137, 110, 2, 7, 30, 31, '2025-01-30', '13:00:00', 1, 6, '2025-01-29 11:46:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (138, 195, 3, 4, 61, 15, '2025-01-30', '16:35:00', 1, 19, '2025-01-02 11:33:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (139, 264, 2, 1, 15, 3, '2025-01-31', '07:30:00', 1, 21, '2025-01-11 09:18:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (140, 227, 6, 4, 47, 10, '2025-01-31', '07:55:00', 1, 25, '2025-01-15 12:09:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (141, 285, 6, 10, 61, 25, '2025-01-31', '07:55:00', 1, 27, '2025-01-08 08:32:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (142, 280, 2, 1, 8, 4, '2025-01-31', '08:30:00', 1, 13, '2024-12-30 09:29:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (143, 14, 2, 3, 11, 10, '2025-01-31', '10:00:00', 1, 6, '2025-01-31 11:36:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (144, 243, 1, 4, 26, 10, '2025-01-31', '10:00:00', 1, 40, '2025-01-21 16:10:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (145, 266, 2, 5, 43, 27, '2025-01-31', '11:20:00', 3, 14, '2025-01-13 13:29:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (146, 279, 3, 4, 62, 25, '2025-01-31', '13:15:00', 1, 41, '2025-01-23 15:36:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (147, 284, 2, 10, 45, 25, '2025-01-31', '14:00:00', 3, 33, '2025-01-30 14:28:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (148, 209, 5, 1, 15, 3, '2025-01-31', '15:50:00', 2, 21, '2025-01-15 15:18:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (149, 269, 2, 7, 30, 31, '2025-01-31', '17:30:00', 1, 26, '2025-01-30 10:57:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (150, 20, 1, 1, 17, 22, '2025-02-01', '07:30:00', 1, 39, '2025-01-31 10:30:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (151, 219, 11, 1, 15, 20, '2025-02-01', '08:10:00', 3, 9, '2025-01-30 09:19:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (152, 1, 1, 4, 26, 10, '2025-02-01', '08:35:00', 1, 27, '2025-01-29 09:49:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (153, 75, 4, 4, 7, 25, '2025-02-01', '09:00:00', 1, 27, '2025-01-14 16:56:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (154, 91, 13, 10, 7, 25, '2025-02-03', '07:45:00', 3, 4, '2025-01-23 15:40:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (155, 177, 5, 4, 62, 25, '2025-02-03', '07:55:00', 1, 2, '2025-01-21 13:17:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (156, 265, 9, 4, 62, 25, '2025-02-03', '08:25:00', 3, 33, '2025-01-25 09:18:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (157, 256, 5, 1, 13, 16, '2025-02-03', '08:30:00', 1, 36, '2025-01-24 15:25:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (158, 144, 4, 10, 47, 11, '2025-02-03', '09:40:00', 1, 42, '2025-01-28 10:12:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (159, 19, 2, 6, 45, 27, '2025-02-03', '14:15:00', 1, 30, '2025-01-20 11:56:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (160, 22, 2, 1, 4, 2, '2025-02-04', '06:30:00', 1, 2, '2025-01-22 15:06:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (161, 173, 1, 1, 15, 3, '2025-02-04', '06:30:00', 1, 39, '2025-01-27 15:01:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (162, 172, 5, 6, 45, 25, '2025-02-04', '10:45:00', 1, 5, '2025-01-20 13:35:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (163, 17, 1, 1, 15, 37, '2025-02-04', '00:20:00', 2, 31, '2025-01-24 09:55:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (164, 260, 4, 4, 61, 25, '2025-02-04', '15:10:00', 1, 27, '2025-01-23 08:04:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (165, 4, 2, 4, 16, 30, '2025-02-04', '15:50:00', 1, 33, '2025-01-28 13:05:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (166, 135, 4, 10, 7, 10, '2025-02-05', '08:55:00', 1, 20, '2025-01-22 10:07:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (167, 51, 9, 3, 61, 25, '2025-02-05', '10:00:00', 3, 27, '2025-01-20 07:27:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (168, 124, 1, 2, 5, 8, '2025-02-05', '10:30:00', 1, 38, '2025-01-17 16:05:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (169, 66, 2, 10, 7, 25, '2025-02-05', '13:55:00', 1, 27, '2025-01-22 14:50:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (170, 36, 8, 4, 62, 25, '2025-02-05', '14:25:00', 1, 9, '2025-01-27 10:11:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (171, 31, 9, 10, 7, 25, '2025-02-05', '15:40:00', 1, 33, '2025-01-16 11:37:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (172, 259, 1, 1, 17, 23, '2025-02-06', '06:45:00', 1, 39, '2025-01-23 10:14:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (173, 228, 2, 3, 29, 27, '2025-02-06', '09:45:00', 3, 13, '2025-02-05 13:39:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (174, 24, 1, 4, 47, 25, '2025-02-06', '09:45:00', 1, 1, '2025-01-16 16:21:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (175, 164, 4, 10, 58, 25, '2025-02-06', '14:45:00', 1, 26, '2025-01-29 17:52:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (176, 215, 11, 3, 24, 26, '2025-02-06', '15:00:00', 2, 33, '2025-01-20 10:08:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (177, 186, 2, 4, 3, 7, '2025-02-06', '15:10:00', 1, 13, '2025-01-15 08:26:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (178, 214, 2, 10, 7, 25, '2025-02-06', '15:15:00', 1, 33, '2025-01-23 17:57:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (179, 2, 1, 10, 24, 11, '2025-02-06', '15:30:00', 1, 25, '2025-01-15 13:28:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (180, 179, 1, 1, 15, 37, '2025-02-07', '08:45:00', 2, 39, '2025-02-07 08:28:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (181, 126, 3, 10, 24, 12, '2025-02-07', '09:30:00', 1, 42, '2025-01-21 07:18:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (182, 251, 1, 1, 17, 22, '2025-02-07', '10:15:00', 1, 31, '2025-01-21 10:03:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (183, 56, 2, 3, 29, 27, '2025-02-07', '11:00:00', 1, 13, '2025-01-15 14:13:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (184, 106, 1, 1, 15, 37, '2025-02-07', '11:20:00', 2, 31, '2025-01-17 15:58:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (185, 273, 2, 1, 17, 24, '2025-02-07', '14:00:00', 3, 12, '2025-02-07 17:24:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (186, 81, 7, 7, 54, 30, '2025-02-07', '18:00:00', 1, 24, '2025-02-07 15:23:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (187, 253, 3, 4, 7, 25, '2025-02-08', '09:30:00', 1, 33, '2025-02-04 14:27:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (188, 131, 7, 7, 54, 30, '2025-02-08', '15:30:00', 1, 24, '2025-01-22 11:45:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (189, 26, 3, 4, 62, 25, '2025-02-10', '06:50:00', 1, 7, '2025-02-08 09:23:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (190, 88, 1, 1, 4, 2, '2025-02-10', '08:00:00', 1, 39, '2025-01-17 11:02:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (191, 113, 2, 1, 15, 39, '2025-02-10', '08:40:00', 2, 34, '2025-02-07 08:11:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (192, 55, 2, 4, 62, 11, '2025-02-10', '09:55:00', 1, 28, '2025-02-08 09:44:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (193, 119, 3, 10, 24, 10, '2025-02-10', '09:55:00', 1, 25, '2025-02-10 14:54:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (194, 59, 5, 4, 26, 10, '2025-02-10', '15:45:00', 1, 21, '2025-02-07 09:06:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (195, 154, 3, 4, 7, 12, '2025-02-11', '08:25:00', 1, 25, '2025-02-03 15:07:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (196, 79, 2, 6, 45, 27, '2025-02-11', '10:00:00', 1, 13, '2025-02-04 11:27:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (197, 191, 3, 6, 2, 10, '2025-02-11', '10:15:00', 2, 5, '2025-01-22 12:32:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (198, 122, 1, 10, 47, 25, '2025-02-11', '13:30:00', 1, 43, '2025-01-31 11:04:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (199, 141, 2, 5, 34, 30, '2025-02-11', '15:00:00', 1, 14, '2025-01-23 09:28:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (200, 44, 4, 4, 61, 25, '2025-02-11', '15:30:00', 1, 7, '2025-01-31 10:42:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (201, 212, 3, 3, 11, 9, '2025-02-11', '16:00:00', 1, 30, '2025-02-08 08:28:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (202, 38, 1, 1, 15, 39, '2025-02-11', '16:20:00', 1, 39, '2025-01-23 16:20:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (203, 32, 5, 4, 62, 25, '2025-02-12', '07:00:00', 1, 7, '2025-02-11 15:28:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (204, 235, 5, 3, 61, 25, '2025-02-12', '07:25:00', 1, 10, '2025-01-24 12:26:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (205, 274, 3, 4, 62, 25, '2025-02-12', '07:45:00', 1, 6, '2025-02-03 14:14:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (206, 150, 4, 10, 7, 36, '2025-02-12', '08:40:00', 1, 29, '2025-01-24 11:37:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (207, 196, 4, 10, 7, 25, '2025-02-12', '14:10:00', 1, 13, '2025-02-12 10:22:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (208, 202, 2, 10, 46, 27, '2025-02-13', '07:45:00', 1, 4, '2025-02-10 09:29:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (209, 217, 1, 4, 26, 19, '2025-02-13', '10:00:00', 1, 38, '2025-01-16 13:26:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (210, 184, 2, 1, 17, 22, '2025-02-13', '14:00:00', 1, 12, '2025-01-20 09:54:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (211, 198, 2, 3, 29, 25, '2025-02-13', '14:30:00', 1, 2, '2025-01-21 13:34:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (212, 247, 4, 4, 47, 10, '2025-02-13', '16:10:00', 1, 33, '2025-02-06 12:58:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (213, 229, 2, 7, 35, 31, '2025-02-14', '13:00:00', 1, 30, '2025-02-10 10:11:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (214, 105, 2, 9, 28, 27, '2025-02-14', '15:00:00', 1, 6, '2025-02-14 10:37:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (215, 176, 13, 1, 15, 37, '2025-02-14', '15:10:00', 2, 2, '2025-02-06 14:50:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (216, 189, 2, 7, 35, 31, '2025-02-14', '18:00:00', 1, 4, '2025-01-20 14:25:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (217, 70, 2, 3, 38, 25, '2025-02-15', '08:00:00', 1, 4, '2025-02-12 10:35:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (218, 82, 2, 3, 29, 27, '2025-02-15', '09:30:00', 2, 13, '2025-01-22 07:31:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (219, 165, 2, 3, 29, 27, '2025-02-15', '10:00:00', 1, 33, '2025-02-14 10:03:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (220, 129, 3, 4, 16, 30, '2025-02-15', '10:45:00', 1, 6, '2025-01-29 10:40:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (221, 50, 2, 3, 29, 25, '2025-02-17', '08:30:00', 1, 4, '2025-02-12 08:51:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (222, 134, 5, 4, 62, 25, '2025-02-17', '10:10:00', 1, 6, '2025-01-29 15:21:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (223, 245, 1, 1, 15, 37, '2025-02-17', '00:50:00', 2, 39, '2025-01-31 09:46:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (224, 43, 5, 1, 13, 16, '2025-02-17', '14:00:00', 4, 30, '2025-01-31 11:10:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (225, 5, 2, 8, 42, 31, '2025-02-17', '16:30:00', 1, 4, '2025-01-31 09:31:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (226, 152, 2, 3, 29, 27, '2025-02-18', '07:30:00', 3, 6, '2025-02-18 09:54:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (227, 3, 4, 4, 7, 10, '2025-02-18', '09:10:00', 1, 20, '2025-01-27 11:39:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (228, 250, 5, 4, 56, 25, '2025-02-18', '09:30:00', 1, 4, '2025-02-18 10:06:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (229, 128, 9, 7, 54, 30, '2025-02-18', '10:10:00', 4, 24, '2025-01-28 17:48:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (230, 33, 2, 3, 29, 27, '2025-02-18', '13:45:00', 1, 15, '2025-01-27 11:01:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (231, 224, 4, 4, 61, 25, '2025-02-18', '13:50:00', 1, 30, '2025-02-12 09:11:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (232, 95, 2, 7, 9, 31, '2025-02-18', '14:00:00', 1, 13, '2025-02-05 14:34:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (233, 286, 5, 1, 8, 4, '2025-02-18', '15:00:00', 2, 33, '2025-02-04 16:31:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (234, 249, 5, 4, 62, 25, '2025-02-19', '07:00:00', 1, 6, '2025-01-22 08:30:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (235, 170, 1, 3, 38, 38, '2025-02-19', '07:45:00', 1, 44, '2025-01-21 18:01:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (236, 140, 2, 3, 38, 27, '2025-02-19', '09:00:00', 1, 13, '2025-02-14 11:13:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (237, 223, 2, 9, 28, 27, '2025-02-19', '09:45:00', 1, 15, '2025-02-03 09:48:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (238, 115, 1, 1, 15, 3, '2025-02-19', '00:20:00', 1, 15, '2025-01-21 16:34:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (239, 109, 1, 2, 25, 5, '2025-02-19', '13:45:00', 1, 45, '2025-01-27 14:40:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (240, 48, 4, 10, 7, 25, '2025-02-19', '14:00:00', 2, 27, '2025-02-05 14:03:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (241, 52, 8, 1, 13, 16, '2025-02-19', '14:00:00', 1, 35, '2025-02-19 16:31:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (242, 271, 11, 10, 58, 12, '2025-02-19', '16:15:00', 1, 46, '2025-02-06 09:16:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (243, 138, 1, 1, 4, 2, '2025-02-20', '07:00:00', 1, 39, '2025-02-19 17:21:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (244, 40, 1, 3, 11, 13, '2025-02-20', '11:25:00', 1, 19, '2025-01-31 08:13:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (245, 41, 2, 1, 15, 37, '2025-02-20', '14:10:00', 2, 4, '2025-01-28 14:43:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (246, 71, 2, 4, 47, 25, '2025-02-20', '14:45:00', 1, 13, '2025-02-21 06:27:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (247, 158, 1, 1, 20, 39, '2025-02-21', '06:45:00', 1, 34, '2025-02-19 15:00:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (248, 60, 5, 4, 62, 14, '2025-02-21', '07:21:00', 2, 22, '2025-02-20 15:13:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (249, 270, 3, 3, 21, 28, '2025-02-21', '08:00:00', 2, 6, '2025-02-04 15:09:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (250, 42, 1, 1, 15, 32, '2025-02-21', '08:15:00', 1, 47, '2025-02-06 11:47:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (251, 193, 1, 1, 15, 39, '2025-02-21', '08:40:00', 2, 39, '2025-02-13 14:17:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (252, 68, 5, 6, 52, 30, '2025-02-21', '10:00:00', 2, 33, '2025-01-28 08:32:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (253, 87, 2, 3, 51, 30, '2025-02-21', '13:00:00', 2, 33, '2025-01-27 13:38:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (254, 203, 1, 1, 15, 20, '2025-02-21', '13:10:00', 1, 15, '2025-01-30 15:00:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (255, 27, 2, 1, 17, 24, '2025-02-21', '14:45:00', 2, 2, '2025-01-29 10:12:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (256, 216, 1, 10, 58, 25, '2025-02-21', '15:45:00', 1, 12, '2025-02-11 14:01:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (257, 233, 2, 3, 38, 10, '2025-02-21', '16:25:00', 1, 19, '2025-02-11 13:58:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (258, 287, 2, 3, 38, 13, '2025-02-22', '07:00:00', 1, 19, '2025-02-20 09:04:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (259, 18, 4, 4, 47, 10, '2025-02-22', '07:00:00', 1, 22, '2025-02-19 16:47:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (260, 76, 3, 1, 15, 39, '2025-02-22', '09:20:00', 1, 13, '2025-01-24 08:10:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (261, 278, 10, 10, 11, 11, '2025-02-22', '09:40:00', 3, 19, '2025-02-10 15:27:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (262, 123, 11, 4, 26, 12, '2025-02-24', '09:00:00', 1, 6, '2025-01-31 14:44:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (263, 239, 2, 3, 29, 27, '2025-02-24', '09:45:00', 1, 4, '2025-02-10 09:48:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (264, 54, 2, 2, 45, 27, '2025-02-24', '13:30:00', 1, 13, '2025-01-28 14:45:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (265, 166, 8, 3, 61, 25, '2025-02-24', '13:45:00', 2, 26, '2025-02-20 17:43:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (266, 39, 4, 10, 47, 34, '2025-02-24', '15:50:00', 1, 29, '2025-02-05 10:07:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (267, 157, 1, 1, 37, 18, '2025-02-25', '07:30:00', 1, 37, '2025-02-20 10:41:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (268, 120, 4, 4, 56, 25, '2025-02-25', '08:45:00', 1, 20, '2025-01-29 08:22:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (269, 282, 2, 3, 51, 30, '2025-02-25', '13:00:00', 2, 4, '2025-01-24 10:18:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (270, 63, 1, 1, 17, 24, '2025-02-25', '13:30:00', 2, 38, '2025-02-19 09:46:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (271, 277, 1, 3, 44, 34, '2025-02-25', '16:30:00', 1, 26, '2025-02-24 18:59:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (272, 185, 3, 1, 14, 33, '2025-02-26', '07:00:00', 2, 48, '2025-01-24 13:59:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (273, 240, 1, 1, 15, 32, '2025-02-26', '07:30:00', 1, 38, '2025-02-17 12:43:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (274, 108, 2, 9, 28, 27, '2025-02-26', '08:00:00', 4, 49, '2025-02-22 09:09:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (275, 11, 2, 1, 20, 39, '2025-02-26', '09:35:00', 2, 34, '2025-02-24 16:15:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (276, 90, 2, 5, 41, 30, '2025-02-26', '10:20:00', 2, 50, '2025-02-25 09:55:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (277, 261, 16, 4, 26, 36, '2025-02-26', '10:40:00', 2, 28, '2025-02-07 09:30:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (278, 248, 5, 1, 8, 4, '2025-02-26', '13:30:00', 3, 33, '2025-02-18 10:36:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (279, 180, 13, 3, 11, 9, '2025-02-26', '13:30:00', 2, 4, '2025-01-27 10:17:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (280, 190, 1, 1, 17, 24, '2025-02-27', '06:15:00', 3, 15, '2025-02-24 08:45:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (281, 15, 5, 4, 26, 10, '2025-02-27', '07:05:00', 2, 34, '2025-02-18 09:18:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (282, 254, 1, 10, 7, 34, '2025-02-27', '07:50:00', 2, 26, '2025-02-20 10:50:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (283, 192, 2, 9, 28, 27, '2025-02-27', '09:45:00', 2, 6, '2025-01-31 10:11:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (284, 86, 6, 10, 58, 25, '2025-02-27', '13:30:00', 2, 4, '2025-02-19 16:39:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (285, 99, 11, 4, 26, 12, '2025-02-27', '14:55:00', 2, 13, '2025-02-05 09:31:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (286, 161, 1, 2, 5, 6, '2025-02-28', '07:00:00', 2, 44, '2025-02-22 11:23:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (287, 67, 3, 10, 58, 12, '2025-02-28', '10:45:00', 2, 29, '2025-02-01 09:12:00') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".citas VALUES (288, 98, 1, 1, 17, 24, '2025-02-28', '15:45:00', 2, 12, '2025-02-20 17:43:00') ON CONFLICT DO NOTHING;


--
-- TOC entry 3540 (class 0 OID 1654785)
-- Dependencies: 265
-- Data for Name: consultorios; Type: TABLE DATA; Schema: William Uribe; Owner: Comfe_owner
--

INSERT INTO "William Uribe".consultorios VALUES (1, 'COTA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".consultorios VALUES (2, 'MODULO 7') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".consultorios VALUES (3, 'GLAUCOMA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".consultorios VALUES (4, 'SEDE INTERNACIONAL') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".consultorios VALUES (5, 'BARRANCABERMEJA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".consultorios VALUES (6, 'SAN GIL') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".consultorios VALUES (7, 'CACIQUE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".consultorios VALUES (8, 'PIEDECUESTA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".consultorios VALUES (9, 'MODULO 50') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".consultorios VALUES (10, 'PISO 9') ON CONFLICT DO NOTHING;


--
-- TOC entry 3534 (class 0 OID 1630342)
-- Dependencies: 228
-- Data for Name: convenios; Type: TABLE DATA; Schema: William Uribe; Owner: Comfe_owner
--

INSERT INTO "William Uribe".convenios VALUES (1, 'PGP OFTALMOFOS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".convenios VALUES (2, 'FOSCAL') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".convenios VALUES (3, 'PARTICULAR') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".convenios VALUES (4, 'PLAN SIGLO 21') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".convenios VALUES (5, 'ECOPETROL') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".convenios VALUES (6, 'AXA COLPATRIA MP') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".convenios VALUES (7, 'VIOPTICA PP') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".convenios VALUES (8, 'COLSANITAS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".convenios VALUES (9, 'SURAMERICANA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".convenios VALUES (10, 'ALLIANZ SEGUROS D...') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".convenios VALUES (11, 'PROGRAMA SOCIAL V...') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".convenios VALUES (12, 'MEDPLUS MP') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".convenios VALUES (13, 'COLMEDICA MP') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".convenios VALUES (14, 'COOMEVA MP') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".convenios VALUES (15, 'FONDEKIKES') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".convenios VALUES (16, 'COLPATRIA SEGUROS...') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".convenios VALUES (17, 'SEGUROS BOLIVAR') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".convenios VALUES (18, 'COMFENALCO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".convenios VALUES (19, 'UT RED INTEGRADA ...') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".convenios VALUES (20, 'CAFABA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".convenios VALUES (21, 'HDI SEGUROS COLOM...') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".convenios VALUES (22, 'MAPFRE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".convenios VALUES (23, 'CEDCO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".convenios VALUES (24, 'SINTRAELECOL BARB...') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".convenios VALUES (25, 'EMPLEADOS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".convenios VALUES (26, 'HDI SEGUROS DE VI...') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".convenios VALUES (27, 'UNIVERSIDAD INDUS...') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".convenios VALUES (28, 'BMI SEGUROS DE VI...') ON CONFLICT DO NOTHING;


--
-- TOC entry 3530 (class 0 OID 1630274)
-- Dependencies: 224
-- Data for Name: departamentos; Type: TABLE DATA; Schema: William Uribe; Owner: Comfe_owner
--

INSERT INTO "William Uribe".departamentos VALUES (1, 'BOGOTA D.C.') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".departamentos VALUES (2, 'ANTIOQUIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".departamentos VALUES (3, 'ATLANTICO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".departamentos VALUES (4, 'BOLIVAR') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".departamentos VALUES (5, 'BOYACA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".departamentos VALUES (6, 'CALDAS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".departamentos VALUES (7, 'CAQUETA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".departamentos VALUES (8, 'CASANARE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".departamentos VALUES (9, 'CAUCA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".departamentos VALUES (10, 'CESAR') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".departamentos VALUES (11, 'CHOCO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".departamentos VALUES (12, 'CORDOBA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".departamentos VALUES (13, 'CUNDINAMARCA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".departamentos VALUES (14, 'GUAINIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".departamentos VALUES (15, 'GUAVIARE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".departamentos VALUES (16, 'HUILA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".departamentos VALUES (17, 'LA GUAJIRA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".departamentos VALUES (18, 'MAGDALENA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".departamentos VALUES (19, 'META') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".departamentos VALUES (20, 'NARIÑO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".departamentos VALUES (21, 'NORTE DE SANTANDER') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".departamentos VALUES (22, 'PUTUMAYO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".departamentos VALUES (23, 'QUINDIO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".departamentos VALUES (24, 'RISARALDA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".departamentos VALUES (25, 'SAN ANDRES Y PROVIDENCIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".departamentos VALUES (26, 'SANTANDER') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".departamentos VALUES (27, 'SUCRE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".departamentos VALUES (28, 'TOLIMA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".departamentos VALUES (29, 'VALLE DEL CAUCA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".departamentos VALUES (30, 'VAUPES') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".departamentos VALUES (31, 'VICHADA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".departamentos VALUES (32, 'ARAUCA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".departamentos VALUES (33, 'AMAZONAS') ON CONFLICT DO NOTHING;


--
-- TOC entry 3544 (class 0 OID 1736705)
-- Dependencies: 295
-- Data for Name: est_cita; Type: TABLE DATA; Schema: William Uribe; Owner: Comfe_owner
--



--
-- TOC entry 3532 (class 0 OID 1630335)
-- Dependencies: 226
-- Data for Name: municipios; Type: TABLE DATA; Schema: William Uribe; Owner: Comfe_owner
--

INSERT INTO "William Uribe".municipios VALUES (1, 1, 'BOGOTA D.C.') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (2, 2, 'ABEJORRAL') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (3, 2, 'ABRIAQUI') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (4, 2, 'ALEJANDRIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (5, 2, 'AMAGA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (6, 2, 'AMALFI') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (7, 2, 'ANDES') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (8, 2, 'ANGELOPOLIS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (9, 2, 'ANGOSTURA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (10, 2, 'ANORI') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (11, 2, 'ANZA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (12, 2, 'APARTADO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (13, 2, 'ARBOLETES') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (14, 2, 'ARGELIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (15, 2, 'ARMENIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (16, 2, 'BARBOSA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (17, 2, 'BELLO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (18, 2, 'BELMIRA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (19, 2, 'BETANIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (20, 2, 'BETULIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (21, 2, 'BRICENO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (22, 2, 'BURITICA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (23, 2, 'CACERES') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (24, 2, 'CAICEDO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (25, 2, 'CALDAS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (26, 2, 'CAMPAMENTO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (27, 2, 'CANASGORDAS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (28, 2, 'CARACOLI') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (29, 2, 'CARAMANTA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (30, 2, 'CAREPA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (31, 2, 'CARMEN DE VIBORAL') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (32, 2, 'CAROLINA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (33, 2, 'CAUCASIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (34, 2, 'CHIGORODO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (35, 2, 'CISNEROS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (36, 2, 'CIUDAD BOLIVAR') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (37, 2, 'COCORNA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (38, 2, 'CONCEPCION') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (39, 2, 'CONCORDIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (40, 2, 'COPACABANA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (41, 2, 'DABEIBA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (42, 2, 'DON MATIAS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (43, 2, 'EBEJICO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (44, 2, 'EL BAGRE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (45, 2, 'ENTRERRIOS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (46, 2, 'ENVIGADO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (47, 2, 'FREDONIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (48, 2, 'FRONTINO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (49, 2, 'GIRALDO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (50, 2, 'GIRARDOTA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (51, 2, 'GOMEZ PLATA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (52, 2, 'GRANADA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (53, 2, 'GUADALUPE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (54, 2, 'GUARNE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (55, 2, 'GUATAPE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (56, 2, 'HELICONIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (57, 2, 'HISPANIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (58, 2, 'ITAGUI') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (59, 2, 'ITUANGO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (60, 2, 'JARDIN') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (61, 2, 'JERICO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (62, 2, 'LA CEJA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (63, 2, 'LA ESTRELLA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (64, 2, 'LA PINTADA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (65, 2, 'LA UNION') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (66, 2, 'LIBORINA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (67, 2, 'MACEO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (68, 2, 'MARINILLA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (69, 2, 'MEDELLIN') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (70, 2, 'MONTEBELLO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (71, 2, 'MURINDO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (72, 2, 'MUTATA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (73, 2, 'NARINO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (74, 2, 'NECHI') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (75, 2, 'NECOCLI') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (76, 2, 'OLAYA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (77, 2, 'PENOL') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (78, 2, 'PEQUE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (79, 2, 'PUEBLORRICO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (80, 2, 'PUERTO BERRIO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (81, 2, 'PUERTO NARE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (82, 2, 'PUERTO TRIUNFO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (83, 2, 'REMEDIOS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (84, 2, 'RETIRO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (85, 2, 'RIONEGRO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (86, 2, 'SABANALARGA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (87, 2, 'SABANETA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (88, 2, 'SALGAR') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (89, 2, 'SAN ANDRES') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (90, 2, 'SAN CARLOS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (91, 2, 'SAN FRANCISCO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (92, 2, 'SAN JERONIMO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (93, 2, 'SAN JOSE DE LA MONTANA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (94, 2, 'SAN JUAN DE URABA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (95, 2, 'SAN LUIS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (96, 2, 'SAN PEDRO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (97, 2, 'SAN PEDRO DE URABA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (98, 2, 'SAN RAFAEL') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (99, 2, 'SAN ROQUE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (100, 2, 'SAN VICENTE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (101, 2, 'SANTA BARBARA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (102, 2, 'SANTA ROSA DE OSOS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (103, 2, 'SANTAFE DE ANTIOQUIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (104, 2, 'SANTO DOMINGO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (105, 2, 'SANTUARIO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (106, 2, 'SEGOVIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (107, 2, 'SONSON') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (108, 2, 'SOPETRAN') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (109, 2, 'TAMESIS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (110, 2, 'TARAZA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (111, 2, 'TARSO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (112, 2, 'TITIRIBI') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (113, 2, 'TOLEDO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (114, 2, 'TURBO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (115, 2, 'URAMITA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (116, 2, 'URRAO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (117, 2, 'VALDIVIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (118, 2, 'VALPARAISO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (119, 2, 'VEGACHI') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (120, 2, 'VENECIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (121, 2, 'VIGIA DEL FUERTE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (122, 2, 'YALI') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (123, 2, 'YARUMAL') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (124, 2, 'YOLOMBO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (125, 2, 'YONDO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (126, 2, 'ZARAGOZA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (127, 3, 'BARANOA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (128, 3, 'BARRANQUILLA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (129, 3, 'CAMPO DE LA CRUZ') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (130, 3, 'CANDELARIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (131, 3, 'GALAPA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (132, 3, 'JUAN DE ACOSTA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (133, 3, 'LURUACO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (134, 3, 'MALAMBO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (135, 3, 'MANATI') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (136, 3, 'PALMAR DE VARELA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (137, 3, 'PIOJO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (138, 3, 'POLONUEVO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (139, 3, 'PONEDERA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (140, 3, 'PUERTO COLOMBIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (141, 3, 'REPELON') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (142, 3, 'SABANAGRANDE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (143, 3, 'SABANALARGA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (144, 3, 'SANTA LUCIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (145, 3, 'SANTO TOMAS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (146, 3, 'SOLEDAD') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (147, 3, 'SUAN') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (148, 3, 'TUBARA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (149, 3, 'USIACURI') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (150, 4, 'ACHI') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (151, 4, 'ALTOS DEL ROSARIO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (152, 4, 'ARENAL') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (153, 4, 'ARJONA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (154, 4, 'ARROYOHONDO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (155, 4, 'BARRANCO DE LOBA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (156, 4, 'CALAMAR') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (157, 4, 'CANTAGALLO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (158, 4, 'CARMEN DE BOLIVAR') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (159, 4, 'CARTAGENA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (160, 4, 'CICUCO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (161, 4, 'CLEMENCIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (162, 4, 'CORDOBA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (163, 4, 'EL GUAMO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (164, 4, 'EL PENON') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (165, 4, 'HATILLO DE LOBA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (166, 4, 'MAGANGUE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (167, 4, 'MAHATES') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (168, 4, 'MARGARITA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (169, 4, 'MARIA LA BAJA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (170, 4, 'MOMPOS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (171, 4, 'MONTECRISTO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (172, 4, 'MORALES') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (173, 4, 'PINILLOS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (174, 4, 'REGIDOR') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (175, 4, 'RIO VIEJO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (176, 4, 'SAN CRISTOBAL') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (177, 4, 'SAN ESTANISLAO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (178, 4, 'SAN FERNANDO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (179, 4, 'SAN JACINTO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (180, 4, 'SAN JACINTO DEL CAUCA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (181, 4, 'SAN JUAN NEPOMUCENO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (182, 4, 'SAN MARTIN DE LOBA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (183, 4, 'SAN PABLO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (184, 4, 'SANTA CATALINA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (185, 4, 'SANTA ROSA DE LIMA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (186, 4, 'SANTA ROSA DEL SUR') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (187, 4, 'SIMITI') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (188, 4, 'SOPLAVIENTO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (189, 4, 'TALAIGUA NUEVO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (190, 4, 'TIQUISIO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (191, 4, 'TURBACO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (192, 4, 'TURBANA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (193, 4, 'VILLANUEVA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (194, 4, 'ZAMBRANO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (195, 5, 'ALMEIDA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (196, 5, 'AQUITANIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (197, 5, 'ARCABUCO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (198, 5, 'BELEN') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (199, 5, 'BERBEO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (200, 5, 'BETEITIVA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (201, 5, 'BOAVITA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (202, 5, 'BOYACA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (203, 5, 'BRICENO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (204, 5, 'BUENAVISTA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (205, 5, 'BUSBANZA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (206, 5, 'CALDAS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (207, 5, 'CAMPOHERMOSO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (208, 5, 'CERINZA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (209, 5, 'CHINAVITA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (210, 5, 'CHIQUINQUIRA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (211, 5, 'CHIQUIZA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (212, 5, 'CHISCAS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (213, 5, 'CHITA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (214, 5, 'CHITARAQUE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (215, 5, 'CHIVATA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (216, 5, 'CHIVOR') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (217, 5, 'CIENEGA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (218, 5, 'COMBITA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (219, 5, 'COPER') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (220, 5, 'CORRALES') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (221, 5, 'COVARACHIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (222, 5, 'CUBARA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (223, 5, 'CUCAITA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (224, 5, 'CUITIVA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (225, 5, 'DUITAMA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (226, 5, 'EL COCUY') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (227, 5, 'EL ESPINO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (228, 5, 'FIRAVITOBA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (229, 5, 'FLORESTA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (230, 5, 'GACHANTIVA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (231, 5, 'GAMEZA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (232, 5, 'GARAGOA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (233, 5, 'GUACAMAYAS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (234, 5, 'GUATEQUE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (235, 5, 'GUAYATA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (236, 5, 'GUICAN') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (237, 5, 'IZA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (238, 5, 'JENESANO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (239, 5, 'JERICO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (240, 5, 'LA CAPILLA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (241, 5, 'LA UVITA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (242, 5, 'LA VICTORIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (243, 5, 'LABRANZAGRANDE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (244, 5, 'MACANAL') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (245, 5, 'MARIPI') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (246, 5, 'MIRAFLORES') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (247, 5, 'MONGUA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (248, 5, 'MONGUI') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (249, 5, 'MONIQUIRA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (250, 5, 'MOTAVITA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (251, 5, 'MUZO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (252, 5, 'NOBSA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (253, 5, 'NUEVO COLON') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (254, 5, 'OICATA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (255, 5, 'OTANCHE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (256, 5, 'PACHAVITA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (257, 5, 'PAEZ') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (258, 5, 'PAIPA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (259, 5, 'PAJARITO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (260, 5, 'PANQUEBA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (261, 5, 'PAUNA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (262, 5, 'PAYA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (263, 5, 'PAZ DE RIO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (264, 5, 'PESCA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (265, 5, 'PISBA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (266, 5, 'PUERTO BOYACA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (267, 5, 'QUIPAMA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (268, 5, 'RAMIRIQUI') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (269, 5, 'RAQUIRA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (270, 5, 'RONDON') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (271, 5, 'SABOYA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (272, 5, 'SACHICA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (273, 5, 'SAMACA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (274, 5, 'SAN EDUARDO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (275, 5, 'SAN JOSE DE PARE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (276, 5, 'SAN LUIS DE GACENO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (277, 5, 'SAN MATEO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (278, 5, 'SAN MIGUEL DE SEMA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (279, 5, 'SAN PABLO BORBUR') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (280, 5, 'SAN ROSA VITERBO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (281, 5, 'SANTA MARIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (282, 5, 'SANTA SOFIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (283, 5, 'SANTANA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (284, 5, 'SATIVANORTE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (285, 5, 'SATIVASUR') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (286, 5, 'SIACHOQUE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (287, 5, 'SOATA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (288, 5, 'SOCHA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (289, 5, 'SOCOTA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (290, 5, 'SOGAMOSO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (291, 5, 'SOMONDOCO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (292, 5, 'SORA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (293, 5, 'SORACA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (294, 5, 'SOTAQUIRA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (295, 5, 'SUSACON') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (296, 5, 'SUTAMARCHAN') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (297, 5, 'SUTATENZA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (298, 5, 'TASCO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (299, 5, 'TENZA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (300, 5, 'TIBANA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (301, 5, 'TIBASOSA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (302, 5, 'TINJACA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (303, 5, 'TIPACOQUE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (304, 5, 'TOCA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (305, 5, 'TOGUI') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (306, 5, 'TOPAGA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (307, 5, 'TOTA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (308, 5, 'TUNJA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (309, 5, 'TUNUNGUA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (310, 5, 'TURMEQUE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (311, 5, 'TUTA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (312, 5, 'TUTAZA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (313, 5, 'UMBITA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (314, 5, 'VENTAQUEMADA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (315, 5, 'VILLA DE LEYVA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (316, 5, 'VIRACACHA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (317, 5, 'ZETAQUIRA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (318, 6, 'AGUADAS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (319, 6, 'ANSERMA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (320, 6, 'ARANZAZU') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (321, 6, 'BELALCAZAR') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (322, 6, 'CHINCHINA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (323, 6, 'FILADELFIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (324, 6, 'LA DORADA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (325, 6, 'LA MERCED') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (326, 6, 'MANIZALES') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (327, 6, 'MANZANARES') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (328, 6, 'MARMATO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (329, 6, 'MARQUETALIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (330, 6, 'MARULANDA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (331, 6, 'NEIRA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (332, 6, 'NORCASIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (333, 6, 'PACORA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (334, 6, 'PALESTINA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (335, 6, 'PENSILVANIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (336, 6, 'RIOSUCIO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (337, 6, 'RISARALDA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (338, 6, 'SALAMINA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (339, 6, 'SAMANA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (340, 6, 'SAN JOSE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (341, 6, 'SUPIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (342, 6, 'VICTORIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (343, 6, 'VILLAMARIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (344, 6, 'VITERBO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (345, 7, 'ALBANIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (346, 7, 'BELEN DE LOS ANDAQUIES') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (347, 7, 'CARTAGENA DEL CHAIRA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (348, 7, 'CURRILLO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (349, 7, 'EL DONCELLO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (350, 7, 'EL PAUJIL') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (351, 7, 'FLORENCIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (352, 7, 'LA MONTANITA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (353, 7, 'MILAN') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (354, 7, 'MORELIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (355, 7, 'PUERTO RICO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (356, 7, 'SAN JOSE DEL FRAGUA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (357, 7, 'SAN VICENTE DEL CAGUAN') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (358, 7, 'SOLANO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (359, 7, 'SOLITA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (360, 7, 'VALPARAISO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (361, 8, 'AGUAZUL') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (362, 8, 'CHAMEZA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (363, 8, 'HATO COROZAL') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (364, 8, 'LA SALINA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (365, 8, 'MANI') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (366, 8, 'MONTERREY') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (367, 8, 'NUNCHIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (368, 8, 'OROCUE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (369, 8, 'PAZ DE ARIPORO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (370, 8, 'PORE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (371, 8, 'RECETOR') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (372, 8, 'SABANALARGA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (373, 8, 'SACAMA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (374, 8, 'SAN LUIS DE PALENQUE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (375, 8, 'TAMARA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (376, 8, 'TAURAMENA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (377, 8, 'TRINIDAD') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (378, 8, 'VILLANUEVA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (379, 8, 'YOPAL') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (380, 9, 'ALMAGUER') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (381, 9, 'ARGELIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (382, 9, 'BALBOA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (383, 9, 'BOLIVAR') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (384, 9, 'BUENOS AIRES') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (385, 9, 'CAJIBIO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (386, 9, 'CALDONO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (387, 9, 'CALOTO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (388, 9, 'CORINTO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (389, 9, 'EL TAMBO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (390, 9, 'FLORENCIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (391, 9, 'GUAPI') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (392, 9, 'INZA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (393, 9, 'JAMBALO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (394, 9, 'LA SIERRA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (395, 9, 'LA VEGA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (396, 9, 'LOPEZ') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (397, 9, 'MERCADERES') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (398, 9, 'MIRANDA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (399, 9, 'MORALES') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (400, 9, 'PADILLA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (401, 9, 'PAEZ') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (402, 9, 'PATIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (403, 9, 'PIAMONTE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (404, 9, 'PIENDAMO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (405, 9, 'POPAYAN') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (406, 9, 'PUERTO TEJADA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (407, 9, 'PURACE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (408, 9, 'ROSAS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (409, 9, 'SAN SEBASTIAN') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (410, 9, 'SANTA ROSA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (411, 9, 'SANTANDER DE QUILICHAO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (412, 9, 'SILVIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (413, 9, 'SOTARA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (414, 9, 'SUAREZ') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (415, 9, 'SUCRE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (416, 9, 'TIMBIO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (417, 9, 'TIMBIQUI') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (418, 9, 'TORIBIO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (419, 9, 'TOTORO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (420, 9, 'VILLA RICA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (421, 10, 'AGUACHICA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (422, 10, 'AGUSTIN CODAZZI') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (423, 10, 'ASTREA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (424, 10, 'BECERRIL') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (425, 10, 'BOSCONIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (426, 10, 'CHIMICHAGUA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (427, 10, 'CHIRIGUANA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (428, 10, 'CURUMANI') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (429, 10, 'EL COPEY') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (430, 10, 'EL PASO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (431, 10, 'GAMARRA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (432, 10, 'GONZALEZ') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (433, 10, 'LA GLORIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (434, 10, 'LA JAGUA DE IBIRICO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (435, 10, 'LA PAZ') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (436, 10, 'MANAURE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (437, 10, 'PAILITAS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (438, 10, 'PELAYA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (439, 10, 'PUEBLO BELLO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (440, 10, 'RIO DE ORO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (441, 10, 'SAN ALBERTO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (442, 10, 'SAN DIEGO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (443, 10, 'SAN MARTIN') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (444, 10, 'TAMALAMEQUE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (445, 10, 'VALLEDUPAR') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (446, 11, 'ACANDI') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (447, 11, 'ALTO BAUDO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (448, 11, 'ATRATO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (449, 11, 'BAGADO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (450, 11, 'BAHIA SOLANO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (451, 11, 'BAJO BAUDO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (452, 11, 'BELEN DE BAJIRA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (453, 11, 'BOJAYA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (454, 11, 'CANTON DE SAN PABLO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (455, 11, 'CARMEN DEL DARIEN') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (456, 11, 'CERTEGUI') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (457, 11, 'CONDOTO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (458, 11, 'EL CARMEN DE ATRATO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (459, 11, 'EL LITORAL DEL SAN JUAN') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (460, 11, 'ITSMINA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (461, 11, 'JURADO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (462, 11, 'LLORO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (463, 11, 'MEDIO ATRATO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (464, 11, 'MEDIO BAUDO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (465, 11, 'MEDIO SAN JUAN') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (466, 11, 'NOVITA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (467, 11, 'NUQUI') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (468, 11, 'QUIBDO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (469, 11, 'RIO FRIO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (470, 11, 'RIO QUITO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (471, 11, 'RIOSUCIO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (472, 11, 'SAN JOSE DEL PALMAR') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (473, 11, 'SIPI') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (474, 11, 'TADO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (475, 11, 'UNGUIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (476, 11, 'UNION PANAMERICANA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (477, 12, 'AYAPEL') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (478, 12, 'BUENAVISTA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (479, 12, 'CANALETE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (480, 12, 'CERETE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (481, 12, 'CHIMA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (482, 12, 'CHINU') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (483, 12, 'CIENAGA DE ORO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (484, 12, 'COTORRA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (485, 12, 'LA APARTADA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (486, 12, 'LORICA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (487, 12, 'LOS CORDOBAS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (488, 12, 'MOMIL') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (489, 12, 'MONTELIBANO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (490, 12, 'MONTERIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (491, 12, 'MONITOS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (492, 12, 'PLANETA RICA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (493, 12, 'PUEBLO NUEVO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (494, 12, 'PUERTO ESCONDIDO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (495, 12, 'PUERTO LIBERTADOR') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (496, 12, 'PURISIMA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (497, 12, 'SAHAGUN') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (498, 12, 'SAN ANDRES SOTAVENTO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (499, 12, 'SAN ANTERO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (500, 12, 'SAN BERNARDO DEL VIENTO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (501, 12, 'SAN CARLOS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (502, 12, 'SAN PELAYO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (503, 12, 'TIERRALTA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (504, 12, 'VALENCIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (505, 13, 'AGUA DE DIOS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (506, 13, 'ALBAN') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (507, 13, 'ANAPOIMA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (508, 13, 'ANOLAIMA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (509, 13, 'APULO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (510, 13, 'ARBELAEZ') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (511, 13, 'BELTRAN') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (512, 13, 'BITUIMA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (513, 13, 'BOJACA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (514, 13, 'CABRERA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (515, 13, 'CACHIPAY') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (516, 13, 'CAJICA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (517, 13, 'CAPARRAPI') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (518, 13, 'CAQUEZA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (519, 13, 'CARMEN DE CARUPA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (520, 13, 'CHAGUANI') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (521, 13, 'CHIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (522, 13, 'CHIPAQUE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (523, 13, 'CHOACHI') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (524, 13, 'CHOCONTA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (525, 13, 'COGUA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (526, 13, 'COTA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (527, 13, 'CUCUNUBA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (528, 13, 'EL COLEGIO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (529, 13, 'EL PENON') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (530, 13, 'EL ROSAL') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (531, 13, 'FACATATIVA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (532, 13, 'FOMEQUE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (533, 13, 'FOSCA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (534, 13, 'FUNZA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (535, 13, 'FUQUENE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (536, 13, 'FUSAGASUGA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (537, 13, 'GACHALA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (538, 13, 'GACHANCIPA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (539, 13, 'GACHETA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (540, 13, 'GAMA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (541, 13, 'GIRARDOT') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (542, 13, 'GRANADA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (543, 13, 'GUACHETA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (544, 13, 'GUADUAS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (545, 13, 'GUASCA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (546, 13, 'GUATAQUI') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (547, 13, 'GUATAVITA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (548, 13, 'GUAYABAL DE SIQUIMA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (549, 13, 'GUAYABETAL') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (550, 13, 'GUTIERREZ') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (551, 13, 'JERUSALEN') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (552, 13, 'JUNIN') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (553, 13, 'LA CALERA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (554, 13, 'LA MESA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (555, 13, 'LA PALMA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (556, 13, 'LA PENA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (557, 13, 'LA VEGA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (558, 13, 'LENGUAZAQUE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (559, 13, 'MACHETA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (560, 13, 'MADRID') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (561, 13, 'MANTA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (562, 13, 'MEDINA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (563, 13, 'MOSQUERA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (564, 13, 'NARINO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (565, 13, 'NEMOCON') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (566, 13, 'NILO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (567, 13, 'NIMAIMA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (568, 13, 'NOCAIMA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (569, 13, 'PACHO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (570, 13, 'PAIME') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (571, 13, 'PANDI') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (572, 13, 'PARATEBUENO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (573, 13, 'PASCA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (574, 13, 'PUERTO SALGAR') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (575, 13, 'PULI') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (576, 13, 'QUEBRADANEGRA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (577, 13, 'QUETAME') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (578, 13, 'QUIPILE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (579, 13, 'RICAURTE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (580, 13, 'SAN ANTONIO DE TEQUENDAMA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (581, 13, 'SAN BERNARDO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (582, 13, 'SAN CAYETANO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (583, 13, 'SAN FRANCISCO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (584, 13, 'SAN JUAN DE RIO SECO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (585, 13, 'SASAIMA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (586, 13, 'SESQUILE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (587, 13, 'SIBATE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (588, 13, 'SILVANIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (589, 13, 'SIMIJACA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (590, 13, 'SOACHA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (591, 13, 'SOPO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (592, 13, 'SUBACHOQUE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (593, 13, 'SUESCA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (594, 13, 'SUPATA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (595, 13, 'SUSA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (596, 13, 'SUTATAUSA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (597, 13, 'TABIO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (598, 13, 'TAUSA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (599, 13, 'TENA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (600, 13, 'TENJO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (601, 13, 'TIBACUY') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (602, 13, 'TIBIRITA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (603, 13, 'TOCAIMA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (604, 13, 'TOCANCIPA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (605, 13, 'TOPAIPI') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (606, 13, 'UBALA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (607, 13, 'UBAQUE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (608, 13, 'UBATE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (609, 13, 'UNE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (610, 13, 'UTICA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (611, 13, 'VENECIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (612, 13, 'VERGARA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (613, 13, 'VIANI') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (614, 13, 'VILLAGOMEZ') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (615, 13, 'VILLAPINZON') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (616, 13, 'VILLETA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (617, 13, 'VIOTA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (618, 13, 'YACOPI') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (619, 13, 'ZIPACON') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (620, 13, 'ZIPAQUIRA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (621, 14, 'BARRANCO MINA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (622, 14, 'CACAHUAL') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (623, 14, 'INIRIDA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (624, 14, 'LA GUADALUPE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (625, 14, 'MAPIRIPAN') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (626, 14, 'MORICHAL') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (627, 14, 'PANA PANA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (628, 14, 'PUERTO COLOMBIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (629, 14, 'SAN FELIPE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (630, 15, 'CALAMAR') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (631, 15, 'EL RETORNO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (632, 15, 'MIRAFLORES') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (633, 15, 'SAN JOSE DEL GUAVIARE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (634, 16, 'ACEVEDO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (635, 16, 'AGRADO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (636, 16, 'AIPE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (637, 16, 'ALGECIRAS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (638, 16, 'ALTAMIRA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (639, 16, 'BARAYA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (640, 16, 'CAMPOALEGRE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (641, 16, 'COLOMBIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (642, 16, 'ELIAS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (643, 16, 'GARZON') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (644, 16, 'GIGANTE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (645, 16, 'GUADALUPE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (646, 16, 'HOBO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (647, 16, 'IQUIRA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (648, 16, 'ISNOS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (649, 16, 'LA ARGENTINA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (650, 16, 'LA PLATA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (651, 16, 'NATAGA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (652, 16, 'NEIVA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (653, 16, 'OPORAPA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (654, 16, 'PAICOL') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (655, 16, 'PALERMO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (656, 16, 'PALESTINA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (657, 16, 'PITAL') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (658, 16, 'PITALITO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (659, 16, 'RIVERA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (660, 16, 'SALADOBLANCO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (661, 16, 'SAN AGUSTIN') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (662, 16, 'SANTA MARIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (663, 16, 'SUAZA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (664, 16, 'TARQUI') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (665, 16, 'TELLO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (666, 16, 'TERUEL') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (667, 16, 'TESALIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (668, 16, 'TIMANA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (669, 16, 'VILLAVIEJA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (670, 16, 'YAGUARA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (671, 17, 'ALBANIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (672, 17, 'BARRANCAS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (673, 17, 'DIBULLA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (674, 17, 'DISTRACCION') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (675, 17, 'EL MOLINO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (676, 17, 'FONSECA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (677, 17, 'HATONUEVO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (678, 17, 'LA JAGUA DEL PILAR') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (679, 17, 'MAICAO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (680, 17, 'MANAURE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (681, 17, 'RIOHACHA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (682, 17, 'SAN JUAN DEL CESAR') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (683, 17, 'URIBIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (684, 17, 'URUMITA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (685, 17, 'VILLANUEVA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (686, 18, 'ALGARROBO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (687, 18, 'ARACATACA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (688, 18, 'ARIGUANI') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (689, 18, 'CERRO SAN ANTONIO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (690, 18, 'CHIBOLO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (691, 18, 'CIENAGA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (692, 18, 'CONCORDIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (693, 18, 'EL BANCO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (694, 18, 'EL PINON') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (695, 18, 'EL RETEN') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (696, 18, 'FUNDACION') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (697, 18, 'GUAMAL') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (698, 18, 'NUEVA GRANADA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (699, 18, 'PEDRAZA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (700, 18, 'PIJINO DEL CARMEN') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (701, 18, 'PIVIJAY') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (702, 18, 'PLATO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (703, 18, 'PUEBLO VIEJO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (704, 18, 'REMOLINO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (705, 18, 'SABANAS DE SAN ANGEL') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (706, 18, 'SALAMINA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (707, 18, 'SAN SEBASTIAN DE BUENAVISTA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (708, 18, 'SAN ZENON') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (709, 18, 'SANTA ANA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (710, 18, 'SANTA BARBARA DE PINTO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (711, 18, 'SANTA MARTA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (712, 18, 'SITIONUEVO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (713, 18, 'TENERIFE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (714, 18, 'ZAPAYAN') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (715, 18, 'ZONA BANANERA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (716, 19, 'ACACIAS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (717, 19, 'BARRANCA DE UPIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (718, 19, 'CABUYARO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (719, 19, 'CASTILLA LA NUEVA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (720, 19, 'CUMARAL') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (721, 19, 'EL CALVARIO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (722, 19, 'EL CASTILLO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (723, 19, 'EL DORADO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (724, 19, 'FUENTE DE ORO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (725, 19, 'GRANADA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (726, 19, 'GUAMAL') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (727, 19, 'LA MACARENA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (728, 19, 'LA URIBE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (729, 19, 'LEJANIAS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (730, 19, 'MAPIRIPAN') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (731, 19, 'MESETAS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (732, 19, 'PUERTO CONCORDIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (733, 19, 'PUERTO GAITAN') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (734, 19, 'PUERTO LLERAS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (735, 19, 'PUERTO LOPEZ') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (736, 19, 'PUERTO RICO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (737, 19, 'RESTREPO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (738, 19, 'SAN CARLOS GUAROA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (739, 19, 'SAN JUAN DE ARAMA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (740, 19, 'SAN JUANITO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (741, 19, 'SAN LUIS DE CUBARRAL') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (742, 19, 'SAN MARTIN') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (743, 19, 'VILLAVICENCIO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (744, 19, 'VISTA HERMOSA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (745, 20, 'ALBAN') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (746, 20, 'ALDANA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (747, 20, 'ANCUYA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (748, 20, 'ARBOLEDA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (749, 20, 'BARBACOAS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (750, 20, 'BELEN') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (751, 20, 'BUESACO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (752, 20, 'CHACHAGUI') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (753, 20, 'COLON') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (754, 20, 'CONSACA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (755, 20, 'CONTADERO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (756, 20, 'CORDOBA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (757, 20, 'CUASPUD') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (758, 20, 'CUMBAL') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (759, 20, 'CUMBITARA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (760, 20, 'EL CHARCO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (761, 20, 'EL PENOL') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (762, 20, 'EL ROSARIO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (763, 20, 'EL TABLON DE GOMEZ') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (764, 20, 'EL TAMBO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (765, 20, 'FRANCISCO PIZARRO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (766, 20, 'FUNES') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (767, 20, 'GUACHUCAL') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (768, 20, 'GUAITARILLA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (769, 20, 'GUALMATAN') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (770, 20, 'ILES') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (771, 20, 'IMUES') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (772, 20, 'IPIALES') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (773, 20, 'LA CRUZ') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (774, 20, 'LA FLORIDA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (775, 20, 'LA LLANADA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (776, 20, 'LA TOLA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (777, 20, 'LA UNION') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (778, 20, 'LEIVA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (779, 20, 'LINARES') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (780, 20, 'LOS ANDES') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (781, 20, 'MAGUI') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (782, 20, 'MALLAMA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (783, 20, 'MOSQUERA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (784, 20, 'NARINO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (785, 20, 'OLAYA HERRERA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (786, 20, 'OSPINA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (787, 20, 'PASTO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (788, 20, 'POLICARPA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (789, 20, 'POTOSI') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (790, 20, 'PROVIDENCIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (791, 20, 'PUERRES') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (792, 20, 'PUPIALES') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (793, 20, 'RICAURTE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (794, 20, 'ROBERTO PAYAN') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (795, 20, 'SAMANIEGO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (796, 20, 'SAN BERNARDO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (797, 20, 'SAN LORENZO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (798, 20, 'SAN PABLO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (799, 20, 'SAN PEDRO DE CARTAGO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (800, 20, 'SANDONA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (801, 20, 'SANTA BARBARA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (802, 20, 'SANTA CRUZ') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (803, 20, 'SAPUYES') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (804, 20, 'TAMINANGO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (805, 20, 'TANGUA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (806, 20, 'TUMACO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (807, 20, 'TUQUERRES') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (808, 20, 'YACUANQUER') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (809, 21, 'ABREGO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (810, 21, 'ARBOLEDAS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (811, 21, 'BOCHALEMA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (812, 21, 'BUCARASICA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (813, 21, 'CACHIRA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (814, 21, 'CACOTA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (815, 21, 'CHINACOTA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (816, 21, 'CHITAGA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (817, 21, 'CONVENCION') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (818, 21, 'CUCUTA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (819, 21, 'CUCUTILLA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (820, 21, 'DURANIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (821, 21, 'EL CARMEN') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (822, 21, 'EL TARRA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (823, 21, 'EL ZULIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (824, 21, 'GRAMALOTE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (825, 21, 'HACARI') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (826, 21, 'HERRAN') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (827, 21, 'LA ESPERANZA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (828, 21, 'LA PLAYA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (829, 21, 'LABATECA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (830, 21, 'LOS PATIOS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (831, 21, 'LOURDES') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (832, 21, 'MUTISCUA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (833, 21, 'OCANA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (834, 21, 'PAMPLONA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (835, 21, 'PAMPLONITA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (836, 21, 'PUERTO SANTANDER') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (837, 21, 'RAGONVALIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (838, 21, 'SALAZAR') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (839, 21, 'SAN CALIXTO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (840, 21, 'SAN CAYETANO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (841, 21, 'SANTIAGO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (842, 21, 'SARDINATA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (843, 21, 'SILOS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (844, 21, 'TEORAMA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (845, 21, 'TIBU') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (846, 21, 'TOLEDO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (847, 21, 'VILLA CARO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (848, 21, 'VILLA DEL ROSARIO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (849, 22, 'COLON') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (850, 22, 'MOCOA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (851, 22, 'ORITO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (852, 22, 'PUERTO ASIS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (853, 22, 'PUERTO CAICEDO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (854, 22, 'PUERTO GUZMAN') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (855, 22, 'PUERTO LEGUIZAMO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (856, 22, 'SAN FRANCISCO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (857, 22, 'SAN MIGUEL') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (858, 22, 'SANTIAGO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (859, 22, 'SIBUNDOY') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (860, 22, 'VALLE DEL GUAMUEZ') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (861, 22, 'VILLA GARZON') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (862, 23, 'ARMENIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (863, 23, 'BUENAVISTA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (864, 23, 'CALARCA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (865, 23, 'CIRCASIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (866, 23, 'CORDOBA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (867, 23, 'FILANDIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (868, 23, 'GENOVA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (869, 23, 'LA TEBAIDA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (870, 23, 'MONTENGRO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (871, 23, 'PIJAO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (872, 23, 'QUIMBAYA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (873, 23, 'SALENTO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (874, 24, 'APIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (875, 24, 'BALBOA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (876, 24, 'BELEN DE UMBRIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (877, 24, 'DOSQUEBRADAS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (878, 24, 'GUATICA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (879, 24, 'LA CELIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (880, 24, 'LA VIRGINIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (881, 24, 'MARSELLA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (882, 24, 'MISTRATO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (883, 24, 'PEREIRA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (884, 24, 'PUEBLO RICO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (885, 24, 'QUINCHIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (886, 24, 'SANTA ROSA DE CABAL') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (887, 24, 'SANTUARIO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (888, 25, 'PROVIDENCIA Y SANTA CATALINA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (889, 25, 'SAN ANDRES') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (890, 26, 'AGUADA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (891, 26, 'ALBANIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (892, 26, 'ARATOCA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (893, 26, 'BARBOSA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (894, 26, 'BARICHARA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (895, 26, 'BARRANCABERMEJA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (896, 26, 'BETULIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (897, 26, 'BOLIVAR') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (898, 26, 'BUCARAMANGA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (899, 26, 'CABRERA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (900, 26, 'CALIFORNIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (901, 26, 'CAPITANEJO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (902, 26, 'CARCASI') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (903, 26, 'CEPITA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (904, 26, 'CERRITO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (905, 26, 'CHARALA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (906, 26, 'CHARTA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (907, 26, 'CHIMA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (908, 26, 'CHIPATA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (909, 26, 'CIMITARRA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (910, 26, 'CONCEPCION') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (911, 26, 'CONFINES') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (912, 26, 'CONTRATACION') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (913, 26, 'COROMORO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (914, 26, 'CURITI') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (915, 26, 'EL CARMEN DE CHUCURI') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (916, 26, 'EL GUACAMAYO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (917, 26, 'EL PENON') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (918, 26, 'EL PLAYON') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (919, 26, 'ENCINO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (920, 26, 'ENCISO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (921, 26, 'FLORIAN') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (922, 26, 'FLORIDABLANCA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (923, 26, 'GALAN') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (924, 26, 'GAMBITA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (925, 26, 'GIRON') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (926, 26, 'GUACA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (927, 26, 'GUADALUPE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (928, 26, 'GUAPOTA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (929, 26, 'GUAVATA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (930, 26, 'GUEPSA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (931, 26, 'HATO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (932, 26, 'JESUS MARIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (933, 26, 'JORDAN') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (934, 26, 'LA BELLEZA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (935, 26, 'LA PAZ') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (936, 26, 'LANDAZURI') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (937, 26, 'LEBRIJA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (938, 26, 'LOS SANTOS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (939, 26, 'MACARAVITA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (940, 26, 'MALAGA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (941, 26, 'MATANZA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (942, 26, 'MOGOTES') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (943, 26, 'MOLAGAVITA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (944, 26, 'OCAMONTE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (945, 26, 'OIBA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (946, 26, 'ONZAGA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (947, 26, 'PALMAR') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (948, 26, 'PALMAS DEL SOCORRO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (949, 26, 'PARAMO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (950, 26, 'PIEDECUESTA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (951, 26, 'PINCHOTE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (952, 26, 'PUENTE NACIONAL') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (953, 26, 'PUERTO PARRA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (954, 26, 'PUERTO WILCHES') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (955, 26, 'RIONEGRO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (956, 26, 'SABANA DE TORRES') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (957, 26, 'SAN ANDRES') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (958, 26, 'SAN BENITO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (959, 26, 'SAN GIL') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (960, 26, 'SAN JOAQUIN') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (961, 26, 'SAN JOSE DE MIRANDA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (962, 26, 'SAN MIGUEL') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (963, 26, 'SAN VICENTE DE CHUCURI') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (964, 26, 'SANTA BARBARA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (965, 26, 'SANTA HELENA DEL OPON') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (966, 26, 'SIMACOTA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (967, 26, 'SOCORRO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (968, 26, 'SUAITA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (969, 26, 'SUCRE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (970, 26, 'SURATA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (971, 26, 'TONA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (972, 26, 'VALLE DE SAN JOSE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (973, 26, 'VELEZ') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (974, 26, 'VETAS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (975, 26, 'VILLANUEVA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (976, 26, 'ZAPATOCA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (977, 27, 'BUENAVISTA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (978, 27, 'CAIMITO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (979, 27, 'CHALAN') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (980, 27, 'COLOSO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (981, 27, 'COROZAL') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (982, 27, 'COVENAS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (983, 27, 'EL ROBLE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (984, 27, 'GALERAS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (985, 27, 'GUARANDA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (986, 27, 'LA UNION') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (987, 27, 'LOS PALMITOS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (988, 27, 'MAJAGUAL') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (989, 27, 'MORROA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (990, 27, 'OVEJAS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (991, 27, 'PALMITO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (992, 27, 'SAMPUES') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (993, 27, 'SAN BENITO ABAD') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (994, 27, 'SAN JUAN BETULIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (995, 27, 'SAN MARCOS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (996, 27, 'SAN ONOFRE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (997, 27, 'SAN PEDRO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (998, 27, 'SANTIAGO DE TOLU') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (999, 27, 'SINCE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1000, 27, 'SINCELEJO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1001, 27, 'SUCRE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1002, 27, 'TOLU VIEJO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1003, 28, 'ALPUJARRA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1004, 28, 'ALVARADO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1005, 28, 'AMBALEMA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1006, 28, 'ANZOATEGUI') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1007, 28, 'ARMERO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1008, 28, 'ATACO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1009, 28, 'CAJAMARCA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1010, 28, 'CARMEN DE APICALA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1011, 28, 'CASABIANCA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1012, 28, 'CHAPARRAL') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1013, 28, 'COELLO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1014, 28, 'COYAIMA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1015, 28, 'CUNDAY') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1016, 28, 'DOLORES') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1017, 28, 'ESPINAL') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1018, 28, 'FALAN') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1019, 28, 'FLANDES') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1020, 28, 'FRESNO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1021, 28, 'GUAMO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1022, 28, 'HERVEO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1023, 28, 'HONDA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1024, 28, 'IBAGUE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1025, 28, 'ICONONZO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1026, 28, 'LERIDA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1027, 28, 'LIBANO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1028, 28, 'MARIQUITA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1029, 28, 'MELGAR') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1030, 28, 'MURILLO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1031, 28, 'NATAGAIMA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1032, 28, 'ORTEGA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1033, 28, 'PALOCABILDO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1034, 28, 'PIEDRAS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1035, 28, 'PLANADAS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1036, 28, 'PRADO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1037, 28, 'PURIFICACION') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1038, 28, 'RIOBLANCO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1039, 28, 'RONCESVALLES') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1040, 28, 'ROVIRA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1041, 28, 'SALDANA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1042, 28, 'SAN ANTONIO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1043, 28, 'SAN LUIS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1044, 28, 'SANTA ISABEL') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1045, 28, 'SUAREZ') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1046, 28, 'VALLE DE SAN JUAN') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1047, 28, 'VENADILLO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1048, 28, 'VILLAHERMOSA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1049, 28, 'VILLARRICA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1050, 29, 'ALCALA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1051, 29, 'ANDALUCIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1052, 29, 'ANSERMANUEVO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1053, 29, 'ARGELIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1054, 29, 'BOLIVAR') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1055, 29, 'BUENAVENTURA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1056, 29, 'BUGA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1057, 29, 'BUGALAGRANDE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1058, 29, 'CAICEDONIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1059, 29, 'CALI') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1060, 29, 'CALIMA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1061, 29, 'CANDELARIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1062, 29, 'CARTAGO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1063, 29, 'DAGUA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1064, 29, 'EL AGUILA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1065, 29, 'EL CAIRO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1066, 29, 'EL CERRITO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1067, 29, 'EL DOVIO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1068, 29, 'FLORIDA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1069, 29, 'GINEBRA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1070, 29, 'GUACARI') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1071, 29, 'JAMUNDI') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1072, 29, 'LA CUMBRE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1073, 29, 'LA UNION') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1074, 29, 'LA VICTORIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1075, 29, 'OBANDO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1076, 29, 'PALMIRA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1077, 29, 'PRADERA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1078, 29, 'RESTREPO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1079, 29, 'RIOFRIO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1080, 29, 'ROLDANILLO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1081, 29, 'SAN PEDRO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1082, 29, 'SEVILLA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1083, 29, 'TORO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1084, 29, 'TRUJILLO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1085, 29, 'TULUA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1086, 29, 'ULLOA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1087, 29, 'VERSALLES') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1088, 29, 'VIJES') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1089, 29, 'YOTOCO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1090, 29, 'YUMBO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1091, 29, 'ZARZAL') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1092, 30, 'CARURU') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1093, 30, 'MITU') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1094, 30, 'PACOA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1095, 30, 'PAPUNAHUA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1096, 30, 'TARAIRA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1097, 30, 'YAVARATE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1098, 31, 'CUMARIBO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1099, 31, 'LA PRIMAVERA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1100, 31, 'PUERTO CARRENO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1101, 31, 'SANTA ROSALIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1102, 32, 'ARAUCA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1103, 32, 'ARAUQUITA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1104, 32, 'CRAVO NORTE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1105, 32, 'FORTUL') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1106, 32, 'PUERTO RONDON') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1107, 32, 'SARAVENA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1108, 32, 'TAME') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1109, 33, 'EL ENCANTO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1110, 33, 'LA CHORRERA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1111, 33, 'LA PEDRERA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1112, 33, 'LA VICTORIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1113, 33, 'LETICIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1114, 33, 'MIRITI - PARANA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1115, 33, 'PUERTO ALEGRIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1116, 33, 'PUERTO ARICA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1117, 33, 'PUERTO NARINO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1118, 33, 'PUERTO SANTANDER') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".municipios VALUES (1119, 33, 'TARAPACA') ON CONFLICT DO NOTHING;


--
-- TOC entry 3528 (class 0 OID 1630254)
-- Dependencies: 222
-- Data for Name: pacientes; Type: TABLE DATA; Schema: William Uribe; Owner: Comfe_owner
--

INSERT INTO "William Uribe".pacientes VALUES (1, 'CC', '37802942', 'ADELINA MANOSALVA', '6076363601', 26, 922, 'Calle 1 #1-01') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (2, 'CC', '28133956', 'ADELINA SARMIENTO', '3144633079', 1, 1, 'Carrera 2 #2-02') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (3, 'CC', '13371125', 'ADOLFO AMAYA', '3012317516', 26, 898, 'Calle 3 #3-03') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (4, 'CC', '43653995', 'ADRIANA CECILIA GOMEZ', '3205760135', 26, 895, 'Carrera 4 #4-04') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (5, 'CC', '28034056', 'ADRIANA ISABEL MUNOZ', '3208035741', 21, 834, 'Calle 5 #5-05') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (6, 'CC', '27937160', 'ALBERTINA BLANCO', '3182961056', 26, 895, 'Carrera 6 #6-06') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (7, 'CC', '63431102', 'ALCIRA PINZON', '3186943737', 26, 895, 'Calle 7 #7-07') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (8, 'CC', '28239206', 'ALCIRA SANCHEZ', '3176813724', 26, 895, 'Carrera 8 #8-08') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (9, 'CC', '28291859', 'ALCIRA SANCHEZ', '3183974480', 21, 834, 'Calle 9 #9-09') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (10, 'CC', '28295395', 'ALDANA PIMIENTO', '3143303438', 21, 834, 'Carrera 10 #10-10') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (11, 'CC', '13516603', 'ALEXIS DURAN', '3103185933', 21, 834, 'Calle 11 #11-11') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (12, 'CC', '28328653', 'ALICIA SANCHEZ', '3504608924', 26, 895, 'Carrera 12 #12-12') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (13, 'CC', '1065205509', 'ALINSON DE LA HOZ', '3127727258', 26, 895, 'Calle 13 #13-13') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (14, 'CC', '63361534', 'ALIX CORZO', '3174043516', 21, 833, 'Carrera 14 #14-14') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (15, 'CC', '13214970', 'ALVARO LANDAZABAL', '3163019406', 26, 895, 'Calle 15 #15-15') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (16, 'CC', '63477797', 'AMPARO COLMENARES', '3143034077', 26, 895, 'Carrera 16 #16-16') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (17, 'CC', '63280462', 'ANA BELEN SERRANO', '3012628104', 26, 895, 'Calle 17 #17-17') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (18, 'CC', '37833225', 'ANA DE DIOS CARRILLO', '3144412027', 1, 1, 'Carrera 18 #18-18') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (19, 'CC', '28373219', 'ANA DOLORES BAYONA', '3124662058', 26, 895, 'Calle 19 #19-19') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (20, 'CC', '28298535', 'ANA ELVIA NAVAS', '3142381620', 26, 895, 'Carrera 20 #20-20') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (21, 'CC', '27950262', 'ANA FRANCISCA GUARIN', '6076940043', 26, 895, 'Calle 21 #21-21') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (22, 'CC', '28011366', 'ANA ISABEL NORIEGA', '3168211931', 21, 833, 'Carrera 22 #22-22') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (23, 'CC', '27934627', 'ANA MARIA GUTIERREZ', '3107786583', 26, 895, 'Calle 23 #23-23') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (24, 'CC', '30204805', 'ANA ROSA LUQUE', '3107840970', 26, 895, 'Carrera 24 #24-24') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (25, 'CC', '1005330611', 'ANDRES FELIPE MANCILLA', '3178544102', 26, 895, 'Calle 25 #25-25') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (26, 'CC', '91519720', 'ANDRES GIOANNY OLARTE', '3158465820', 26, 895, 'Carrera 26 #26-26') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (27, 'CC', '13845146', 'ANGEL MARIA PINZON', '3174932002', 26, 895, 'Calle 27 #27-27') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (28, 'CE', '79550', 'ANGEL MIGUEL NEIRA', '3176768860', 26, 895, 'Carrera 28 #28-28') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (29, 'CC', '1005241567', 'ANGELLY BARBA', '3045879350', 26, 895, 'Calle 29 #29-29') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (30, 'CC', '1005150337', 'ANGIE PAOLA SANCHEZ', '3228187421', 26, 895, 'Carrera 30 #30-30') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (31, 'CC', '91510992', 'ANTONIO VEGA', '3014373680', 26, 898, 'Calle 31 #31-31') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (32, 'CC', '5555230', 'AURELIO FRANCO', '3024789940', 26, 898, 'Carrera 32 #32-32') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (33, 'CC', '42489104', 'BERTHA RODRIGUEZ', '3215392940', 26, 898, 'Calle 33 #33-33') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (34, 'CC', '37823789', 'BERTILDA ANTOLINEZ', '3012138756', 26, 898, 'Carrera 34 #34-34') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (35, 'CC', '45478956', 'BEVERLY MARGARETH DUARTE', '3204767571', 1, 1, 'Calle 35 #35-35') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (36, 'TI', '1098716087', 'BIBIANA ARIZA', '3002455866', 26, 898, 'Carrera 36 #36-36') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (37, 'CC', '28168166', 'BLANCA ADELA FRANCO', '3173630546', 26, 898, 'Calle 37 #37-37') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (38, 'CC', '63318271', 'BLANCA PATRICIA SUAREZ', '3158476173', 21, 833, 'Carrera 38 #38-38') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (39, 'CC', '1007193724', 'BRANDON ENRIQUE PEREZ', '3115014968', 26, 898, 'Calle 39 #39-39') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (40, 'CE', '2099251', 'CARLOS ALBERTO PINILLA', '3015815385', 26, 898, 'Carrera 40 #40-40') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (41, 'CC', '13884676', 'CARLOS JULIO CASTILLO', '3212857411', 26, 898, 'Calle 41 #41-41') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (42, 'CC', '91201898', 'CARLOS MIGUEL PEREZ', '3162290594', 26, 898, 'Carrera 42 #42-42') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (43, 'CC', '28015625', 'CARLOTA AGUILAR', '3106741327', 26, 898, 'Calle 43 #43-43') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (44, 'CC', '37240265', 'CARMEN ALICIA PATERNINA', '3003759848', 26, 898, 'Carrera 44 #44-44') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (45, 'CC', '29688307', 'CARMEN ISABEL RIOS', '3163931453', 26, 898, 'Calle 45 #45-45') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (46, 'CC', '27954981', 'CARMEN NELLY MENESES', '3185309364', 26, 898, 'Carrera 46 #46-46') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (47, 'CC', '27785152', 'CARMEN SOFIA ESPINEL', '3108672520', 26, 898, 'Calle 47 #47-47') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (48, 'CC', '1091677550', 'CAROLINA OSORIO', '3135719146', 26, 898, 'Carrera 48 #48-48') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (49, 'TI', '1098661385', 'CECILIA JIMENEZ', '3175387739', 26, 898, 'Calle 49 #49-49') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (50, 'CC', '22396762', 'CIELO ESTHER SIERRA', '3102029902', 26, 898, 'Carrera 50 #50-50') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (51, 'CC', '63503539', 'CLARA MARGARITA RESTREPO', '3108788564', 26, 898, 'Calle 51 #51-51') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (52, 'CC', '63281483', 'CLAUDIA LUCIA DUARTE', '3102629880', 26, 898, 'Carrera 52 #52-52') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (53, 'CC', '37659071', 'CLAUDIA PATRICIA GOMEZ', '3202430972', 21, 834, 'Calle 53 #53-53') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (54, 'CC', '37812664', 'CLAUDINA CACERES', '3132583497', 21, 834, 'Carrera 54 #54-54') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (55, 'CC', '49550176', 'CLOTILDE RODRIGUEZ', '3143578244', 21, 834, 'Calle 55 #55-55') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (56, 'CC', '52710560', 'CRISTINA ANDREA REYES', '3208546073', 1, 1, 'Carrera 56 #56-56') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (57, 'CC', '28296548', 'DAIRIS MARIA GUERRA', '3174761998', 21, 834, 'Calle 57 #57-57') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (58, 'CC', '26900003', 'DAISY DEL CARMEN GUTIERREZ', '3135286624', 21, 834, 'Carrera 58 #58-58') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (59, 'CC', '5637616', 'DANIEL PATINO', '3153258421', 26, 898, 'Calle 59 #59-59') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (60, 'TI', '1193138588', 'DANIEL ANDRES RODRIGUEZ', '3214695902', 26, 898, 'Carrera 60 #60-60') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (61, 'CC', '13351992', 'DARIO ALBERTO CADAVID', '3105599904', 26, 898, 'Calle 61 #61-61') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (62, 'CC', '39015217', 'DAYRIS PACHECO', '3145182658', 26, 898, 'Carrera 62 #62-62') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (63, 'CC', '63287956', 'DECCI MARIA QUINTERO', '3168620190', 26, 898, 'Calle 63 #63-63') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (64, 'CC', '37510909', 'DELIA ZUSELTH MORENO', '3187931513', 21, 833, 'Carrera 64 #64-64') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (65, 'TI', '1098663624', 'DIEGO ANDRES JIMENEZ', '3178268076', 26, 898, 'Calle 65 #65-65') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (66, 'TI', '1098721195', 'DIEGO ARMANDO VILLAMIZAR', '3163350827', 26, 898, 'Carrera 66 #66-66') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (67, 'CC', '1095843177', 'DIEGO FERNANDO ORDONEZ', '3183697762', 26, 895, 'Calle 67 #67-67') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (68, 'CC', '28378414', 'DIOCELINA CUADROS', '3152208815', 26, 895, 'Carrera 68 #68-68') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (69, 'CC', '37238800', 'DORALICES CECILIA ORTIZ', '3137864481', 26, 895, 'Calle 69 #69-69') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (70, 'CC', '37832200', 'DORIS BERNAL', '3184228677', 26, 895, 'Carrera 70 #70-70') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (71, 'CC', '63453069', 'DORIS PATRICIA AYALA', '3166739890', 26, 895, 'Calle 71 #71-71') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (72, 'CC', '63275841', 'DURLEY ZULUAGA', '3214139148', 26, 895, 'Carrera 72 #72-72') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (73, 'CC', '13817836', 'EDELBERTO GARCIA', '3204700813', 26, 895, 'Calle 73 #73-73') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (74, 'CC', '49653192', 'EDITH CAAMANO', '3136677248', 26, 895, 'Carrera 74 #74-74') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (75, 'CC', '28195775', 'ELISABETH CARRILLO', '3108650904', 26, 895, 'Calle 75 #75-75') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (76, 'CC', '1005258515', 'ELISEO NAVAS', '3142595238', 26, 895, 'Carrera 76 #76-76') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (77, 'CC', '41779833', 'ELIZABETH MORENO', '3156380100', 26, 895, 'Calle 77 #77-77') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (78, 'CC', '37749810', 'ELIZABETH SARMIENTO', '3187519827', 26, 895, 'Carrera 78 #78-78') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (79, 'CC', '40010963', 'ELSA EMILIA CASTELLANOS', '3114553183', 1, 1, 'Calle 79 #79-79') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (80, 'CC', '63335152', 'ELVIRA MERCHAN', '3202583546', 26, 895, 'Carrera 80 #80-80') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (81, 'CC', '1097495064', 'EMELING SOFIA SARABI', '3184908380', 21, 833, 'Calle 81 #81-81') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (82, 'CC', '31799266', 'EMILIA CARDOZO', '3053402872', 26, 895, 'Carrera 82 #82-82') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (83, 'CC', '1097134586', 'EMILIE LUCIANA LEGUIZAMON', '3177987584', 26, 895, 'Calle 83 #83-83') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (84, 'CC', '19299362', 'EMIRO SUAREZ', '3135709718', 26, 895, 'Carrera 84 #84-84') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (85, 'CC', '1093300953', 'EMMANUEL CABALLERO', '3112282204', 26, 895, 'Calle 85 #85-85') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (86, 'CC', '63511215', 'ENITHSABETH CARO', '3142662109', 26, 898, 'Carrera 86 #86-86') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (87, 'CC', '28237149', 'ERNESTINA MEJIA', '3175247484', 26, 898, 'Calle 87 #87-87') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (88, 'CC', '63306382', 'ESPERANZA JAIMES', '3107885637', 26, 922, 'Carrera 88 #88-88') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (89, 'CC', '1018453003', 'ESTEBAN ALMEIDA', '3178536220', 26, 922, 'Calle 89 #89-89') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (90, 'CC', '28011054', 'ESTHER JULIA SEPULVEDA', '3156560361', 26, 922, 'Carrera 90 #90-90') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (91, 'CC', '91072542', 'EUCLIDES TIRIA', '3203485874', 26, 922, 'Calle 91 #91-91') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (92, 'CC', '37821331', 'EVELIA GOMEZ', '3143410730', 26, 922, 'Carrera 92 #92-92') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (93, 'CC', '13801689', 'FABIO HUMBERTO DIAZ', '3016430414', 26, 922, 'Calle 93 #93-93') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (94, 'CC', '22994688', 'FATIMA TURIZO', '3118111809', 26, 922, 'Carrera 94 #94-94') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (95, 'CC', '6752009', 'FLAVIO GAMBOA', '3024119682', 26, 922, 'Calle 95 #95-95') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (96, 'CC', '28238096', 'FLOR ELBA SANCHEZ', '3164984882', 26, 922, 'Carrera 96 #96-96') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (97, 'CC', '37832380', 'FLOR MARIA ARAQUE', '3133861892', 26, 922, 'Calle 97 #97-97') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (98, 'CC', '1096197410', 'FRANCIA MILENA NAVARRO', '3246705778', 26, 922, 'Carrera 98 #98-98') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (99, 'CC', '1004353567', 'FREDY ANDRES MARTINEZ', '3246803693', 26, 922, 'Calle 99 #99-99') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (100, 'CC', '91134379', 'GABRIEL ANDRES DIAZ', '3177939332', 1, 1, 'Carrera 100 #100-100') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (101, 'CC', '1096700386', 'GABRIEL DARIO ESPINOSA', '3133963725', 26, 922, 'Calle 101 #101-101') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (102, 'CC', '17054388', 'GILBERTO ACEVEDO', '3106300453', 26, 922, 'Carrera 102 #102-102') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (103, 'CC', '13219896', 'GILBERTO SANCHEZ', '3123596150', 21, 833, 'Calle 103 #103-103') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (104, 'CC', '37928593', 'GILMA RIOS', '3105517616', 26, 922, 'Carrera 104 #104-104') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (105, 'CC', '37655551', 'GLADYS GOMEZ', '3112311216', 1, 1, 'Calle 105 #105-105') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (106, 'CC', '37805328', 'GLADYS ORTIZ', '3114496933', 26, 922, 'Carrera 106 #106-106') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (107, 'CC', '37942522', 'GLADYS ELENA URREA', '3214758411', 26, 922, 'Calle 107 #107-107') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (108, 'CC', '63286597', 'GLADYS EMILSE JAIMES', '3167424024', 26, 922, 'Carrera 108 #108-108') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (109, 'CC', '27944761', 'GLORIA CADAVID', '3156329224', 26, 922, 'Calle 109 #109-109') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (110, 'CC', '37815984', 'GLORIA INES DIAZ', '3154257032', 26, 898, 'Carrera 110 #110-110') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (111, 'CC', '63321228', 'HELENA HERNANDEZ', '3113581198', 26, 898, 'Calle 111 #111-111') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (112, 'CC', '91110926', 'HENRY ROBERTO SAAVEDRA', '3222898962', 26, 898, 'Carrera 112 #112-112') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (113, 'CC', '37888123', 'HERCILIA DIAZ', '3174835464', 26, 898, 'Calle 113 #113-113') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (114, 'CC', '91513359', 'HERNAN PRADA', '3153984488', 26, 898, 'Carrera 114 #114-114') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (115, 'CC', '28213022', 'HILDA RAMIREZ', '3163968219', 26, 898, 'Calle 115 #115-115') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (116, 'CC', '27616411', 'HILDA ROSA OVALLOS', '3112642310', 26, 898, 'Carrera 116 #116-116') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (117, 'CC', '45503582', 'HIRINA NIEBES', '3212160991', 26, 898, 'Calle 117 #117-117') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (118, 'CC', '91232255', 'HUMBERTO JIMENEZ', '3153746144', 26, 898, 'Carrera 118 #118-118') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (119, 'CC', '37791023', 'INES TELLEZ', '3173747445', 26, 898, 'Calle 119 #119-119') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (120, 'CC', '1098620839', 'INGRIT KATERINE OLARTE', '3183519010', 21, 833, 'Carrera 120 #120-120') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (121, 'TI', '1102635447', 'ISNELDY JOHANA NINO', '3185675171', 26, 898, 'Calle 121 #121-121') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (122, 'TI', '1098752054', 'JAVIER ALBERTO REYES', '3175767934', 26, 898, 'Carrera 122 #122-122') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (123, 'TI', '1098775538', 'JEIMY TATIANA DIAZ', '3106089745', 26, 898, 'Calle 123 #123-123') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (124, 'CC', '1096243194', 'JEISSON MAURICIO ARDILA', '3232830352', 21, 818, 'Carrera 124 #124-124') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (125, 'CC', '1098649343', 'JESSICA NEWTON CASTELLANOS', '3156638544', 21, 818, 'Calle 125 #125-125') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (126, 'CC', '1096063028', 'JESSICA YULIETH MORENO', '3144032812', 21, 818, 'Carrera 126 #126-126') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (127, 'CC', '1095822478', 'JESUS ALBERTO MUNOZ', '3003752337', 26, 898, 'Calle 127 #127-127') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (128, 'CE', '5084683', 'JHONNY PEINADO', '3229038954', 26, 895, 'Carrera 128 #128-128') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (129, 'CC', '37843939', 'JOHANA SMITH SEPULVEDA', '3152035511', 26, 895, 'Calle 129 #129-129') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (130, 'TI', '1098662950', 'JORGE ALBERTO ZIPAMONCHA', '3124865532', 26, 950, 'Carrera 130 #130-130') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (131, 'CC', '13721690', 'JORGE ALVERTO PARRA', '3174231936', 26, 950, 'Calle 131 #131-131') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (132, 'TI', '1101758186', 'JORGE ANDREY BARBOSA', '3177262597', 26, 950, 'Carrera 132 #132-132') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (133, 'CC', '13809099', 'JORGE ELIECER GUERRERO', '3158008221', 26, 950, 'Calle 133 #133-133') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (134, 'CC', '5742288', 'JOSE DE JESUS WANDURRAGA', '3505034404', 26, 950, 'Carrera 134 #134-134') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (135, 'CC', '17043530', 'JOSE DEL CARMEN AMAYA', '3242823241', 21, 833, 'Calle 135 #135-135') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (136, 'CE', '5552820', 'JOSE DIXON NUNEZ', '3178436628', 26, 950, 'Carrera 136 #136-136') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (137, 'CC', '13259750', 'JOSE ISAI HERNADEZ', '3132965853', 26, 950, 'Calle 137 #137-137') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (138, 'CC', '91250356', 'JOSE LUIS CARRERO', '3168512998', 26, 950, 'Carrera 138 #138-138') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (139, 'CC', '1095818502', 'JOSY ESTEBAN LEON', '3168167128', 26, 950, 'Calle 139 #139-139') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (140, 'CC', '10065528', 'JUAN BUENAVENTURA ORTIZ', '3135993555', 26, 950, 'Carrera 140 #140-140') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (141, 'CC', '1096252203', 'JUAN KAMILO ESTRADA', '3114826816', 21, 818, 'Calle 141 #141-141') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (142, 'CC', '1096514847', 'JUAN SEBAASTIAN HERNANDEZ', '3223232341', 21, 834, 'Carrera 142 #142-142') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (143, 'CC', '37826311', 'JULIA RAMIREZ', '3178240213', 26, 950, 'Calle 143 #143-143') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (144, 'TI', '1098755401', 'JULIETH KATHERINE POLO', '3023466152', 26, 950, 'Carrera 144 #144-144') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (145, 'CC', '1083007891', 'JULIETH PAOLA GOMEZ', '3013874548', 21, 834, 'Calle 145 #145-145') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (146, 'CE', '3983761', 'JULIO ROSA MIER', '3209244560', 26, 950, 'Carrera 146 #146-146') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (147, 'CC', '1006409574', 'KAREN DANIELA CORONEL', '3146694188', 26, 950, 'Calle 147 #147-147') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (148, 'TI', '1098735219', 'KAREN JULIETH MARTINEZ', '3007710197', 21, 833, 'Carrera 148 #148-148') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (149, 'TI', '1099748933', 'KEREN THALIANA OVALLOS', '3118651010', 26, 950, 'Calle 149 #149-149') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (150, 'TI', '1098752588', 'KERRY STEFANNIE GUERRERO', '3183905101', 26, 950, 'Carrera 150 #150-150') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (151, 'CC', '63550755', 'LAURA ELOINA TARAZONA', '3185786851', 26, 950, 'Calle 151 #151-151') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (152, 'CC', '63304517', 'LAURA ISABEL ALVIAR', '3102788247', 26, 950, 'Carrera 152 #152-152') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (153, 'CC', '1097781411', 'LAURA JULIANA LOBO', '3184020955', 26, 895, 'Calle 153 #153-153') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (154, 'CC', '1055333440', 'LAURA YANETH FORERO', '3212009551', 26, 895, 'Carrera 154 #154-154') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (155, 'CC', '1010105869', 'LEIDY ALEXANDRA VILLABONA', '3125549409', 26, 895, 'Calle 155 #155-155') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (156, 'CC', '37809765', 'LETICIA GOMEZ', '3173811673', 26, 895, 'Carrera 156 #156-156') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (157, 'CC', '28148754', 'LETICIA MANTILLA', '3164646414', 26, 895, 'Calle 157 #157-157') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (158, 'CC', '37803259', 'LIBIA DELGADO', '6076166866', 21, 818, 'Carrera 158 #158-158') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (159, 'CC', '39558024', 'LIDIA ALEJANDRINA QUIEROGA', '3125731054', 21, 818, 'Calle 159 #159-159') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (160, 'CC', '28239955', 'LIGIA STHER RODRIGUEZ', '3102008699', 21, 818, 'Carrera 160 #160-160') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (161, 'TI', '1098801554', 'LINA LIZETH HERRERA', '3157986537', 21, 818, 'Calle 161 #161-161') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (162, 'CC', '1055272755', 'LINA PAOLA CHINOME', '3124751805', 26, 895, 'Carrera 162 #162-162') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (163, 'CC', '8831087', 'LIOVIGILDO JOSE GARCIA', '3118816489', 26, 895, 'Calle 163 #163-163') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (164, 'CC', '1097104505', 'LORNA SOFIA RODRIGUEZ', '3166511184', 21, 833, 'Carrera 164 #164-164') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (165, 'CC', '63357364', 'LUCERO MEJIA', '3166958208', 26, 895, 'Calle 165 #165-165') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (166, 'CC', '1095915316', 'LUCIA CRISTINA AMAYA', '3142543649', 26, 895, 'Carrera 166 #166-166') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (167, 'CC', '63300892', 'LUDY ZAPATA', '3043902377', 26, 895, 'Calle 167 #167-167') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (168, 'CC', '13894743', 'LUIS ALEJANDRO MARQUEZ', '3175412037', 26, 895, 'Carrera 168 #168-168') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (169, 'TI', '1100968614', 'LUIS ALEJANDRO PINA', '3153351978', 26, 898, 'Calle 169 #169-169') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (170, 'CC', '91229646', 'LUIS ALFREDO PINZON', '3155653981', 26, 898, 'Carrera 170 #170-170') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (171, 'CE', '4299458', 'LUIS ALONSO GOMEZ', '3183751714', 26, 898, 'Calle 171 #171-171') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (172, 'CE', '2884224', 'LUIS EMIGDIO QUIROGA', '3014458783', 26, 898, 'Carrera 172 #172-172') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (173, 'CE', '5555049', 'LUIS ENRIQUE ANGARITA', '3168464053', 26, 898, 'Calle 173 #173-173') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (174, 'CC', '17589577', 'LUIS ENRIQUE DAVILA', '3157639501', 21, 833, 'Carrera 174 #174-174') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (175, 'CC', '5638306', 'LUIS FRANCISCO CANAS', '3213150889', 26, 898, 'Calle 175 #175-175') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (176, 'CC', '5560213', 'LUIS FRANCISCO CHAPARRO', '3105673032', 21, 834, 'Carrera 176 #176-176') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (177, 'CC', '13887708', 'LUIS HUMBERTO MORENO', '3175166701', 21, 834, 'Calle 177 #177-177') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (178, 'CE', '2169882', 'LUIS JOAQUIN SIERRA', '3175359641', 26, 898, 'Carrera 178 #178-178') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (179, 'CC', '21473165', 'LUZ DARY DE LA TRINIDAD CASTELLANOS', '3175486995', 26, 898, 'Calle 179 #179-179') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (180, 'CC', '63281304', 'LUZ MARINA OSORIO', '3158303343', 26, 898, 'Carrera 180 #180-180') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (181, 'CC', '63293076', 'LUZ MARINA RINCON', '3123535708', 26, 898, 'Calle 181 #181-181') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (182, 'CC', '26733570', 'LUZ MARINA TORRES', '3217766311', 26, 898, 'Carrera 182 #182-182') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (183, 'CC', '21949621', 'MAGALY DE JESUS SALCEDO', '3204114764', 26, 922, 'Calle 183 #183-183') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (184, 'CE', '3550027', 'MANUEL JOSE LOPEZ', '3107471017', 26, 922, 'Carrera 184 #184-184') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (185, 'CC', '122905854', 'MARC ANTHONY OSORIO', '7502183180', 26, 925, 'Calle 185 #185-185') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (186, 'CC', '37259531', 'MARGARITA CARDENAS', '3183480710', 21, 833, 'Carrera 186 #186-186') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (187, 'CC', '28295672', 'MARIA DE LA CRUZ BAUTISTA', '3008601721', 26, 925, 'Calle 187 #187-187') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (188, 'CC', '21843058', 'MARIA ELISA BLANCO', '3208589527', 26, 925, 'Carrera 188 #188-188') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (189, 'CC', '37655316', 'MARIA EMERITA GONZALEZ', '3223542407', 26, 925, 'Calle 189 #189-189') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (190, 'CC', '26735086', 'MARIA EMMA RINCON', '3162211595', 26, 925, 'Carrera 190 #190-190') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (191, 'TI', '1100951100', 'MARIA ESPERANZA MEJIA', '3152079554', 26, 925, 'Calle 191 #191-191') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (192, 'CC', '28479026', 'MARIA EVA SERRANO', '3144003651', 26, 925, 'Carrera 192 #192-192') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (193, 'CC', '27982086', 'MARIA FANNY WANDURRAGA', '3165637292', 26, 925, 'Calle 193 #193-193') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (194, 'CC', '63320507', 'MARIA JACKELINE ACUNA', '3118409144', 26, 925, 'Carrera 194 #194-194') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (195, 'TI', '1098824523', 'MARIA LUCIA TARAZONA', '3163738637', 26, 925, 'Calle 195 #195-195') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (196, 'CC', '28331294', 'MARIA LUCY PENALOZA', '3108818062', 26, 925, 'Carrera 196 #196-196') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (197, 'CC', '40510361', 'MARIA LUISA CASTRILLON', '3105773493', 26, 925, 'Calle 197 #197-197') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (198, 'CC', '28161061', 'MARIA OCTAVIA TARAZONA', '3143770622', 26, 925, 'Carrera 198 #198-198') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (199, 'CC', '27946711', 'MARIA OLGA PRADA', '3222184229', 21, 833, 'Calle 199 #199-199') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (200, 'CC', '41484418', 'MARIA OLINDA CAMACHO', '3006885357', 26, 925, 'Carrera 200 #200-200') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (201, 'CC', '37889444', 'MARIA TERESA ALONSO', '3115857391', 26, 925, 'Calle 201 #201-201') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (202, 'CC', '28355822', 'MARIA TERESA BUENO', '3187717269', 21, 818, 'Carrera 202 #202-202') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (203, 'CC', '63299088', 'MARIELA RIVERA', '3004613077', 21, 818, 'Calle 203 #203-203') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (204, 'CC', '5730511', 'MARIO GARZON', '3153705579', 21, 818, 'Carrera 204 #204-204') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (205, 'CC', '37835310', 'MARLENE HERNANDEZ', '3163355812', 21, 818, 'Calle 205 #205-205') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (206, 'CC', '37916351', 'MARLENE PEREZ', '3104686069', 26, 895, 'Carrera 206 #206-206') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (207, 'CC', '63347713', 'MARTHA CECILIA GUERRERO', '3184609838', 26, 895, 'Calle 207 #207-207') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (208, 'CC', '63294449', 'MARTHA CECILIA MENDOZA', '3133779094', 26, 895, 'Carrera 208 #208-208') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (209, 'CC', '37829731', 'MARTHA CECILIA RAMIREZ', '3002329863', 26, 895, 'Calle 209 #209-209') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (210, 'CC', '63349823', 'MARTHA LUCIA GAMARRA', '3173803975', 26, 895, 'Carrera 210 #210-210') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (211, 'CC', '23780212', 'MARTHA LUCIA GUERRERO', '3166824704', 26, 895, 'Calle 211 #211-211') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (212, 'CC', '91323877', 'MAURICIO RAMIREZ', '3123109804', 21, 833, 'Carrera 212 #212-212') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (213, 'CC', '1095917789', 'MAURICIO SANTOS', '3153395621', 26, 895, 'Calle 213 #213-213') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (214, 'CC', '23148133', 'MAVIS SOFIA CHAVEZ', '3115934481', 26, 895, 'Carrera 214 #214-214') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (215, 'CC', '37542604', 'MAYELIDT ROJAS', '3223452627', 26, 895, 'Calle 215 #215-215') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (216, 'CC', '1070946366', 'MAYRA ALEJANDRA BARON', '3103448636', 26, 895, 'Carrera 216 #216-216') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (217, 'CC', '37315353', 'MILDRED CARRASCAL', '3163763227', 26, 895, 'Calle 217 #217-217') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (218, 'CC', '37808651', 'MILENA GARCIA', '3102793412', 26, 895, 'Carrera 218 #218-218') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (219, 'TI', '1098767490', 'MONICA LIZETH MEDINA', '3193156143', 26, 925, 'Calle 219 #219-219') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (220, 'CC', '1095921942', 'MONICA MILENA LOZANO', '3044084655', 26, 925, 'Carrera 220 #220-220') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (221, 'CC', '28015711', 'NANCY DANIELA RUIZ', '3118109608', 26, 925, 'Calle 221 #221-221') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (222, 'CC', '63349194', 'NANCY JAIDIVE URIBE', '3103092409', 21, 833, 'Carrera 222 #222-222') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (223, 'CC', '1096222422', 'NATALIA ISABEL RAMOS', '3022644384', 26, 950, 'Calle 223 #223-223') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (224, 'CC', '1005209754', 'NATALIA MARIA ESCOBAR', '3165794512', 26, 950, 'Carrera 224 #224-224') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (225, 'CC', '28411525', 'NATIVIDAD COLMENARES', '3187596181', 26, 950, 'Calle 225 #225-225') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (226, 'CC', '28156843', 'NELCY SEQUEDA', '3046441672', 21, 834, 'Carrera 226 #226-226') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (227, 'CC', '37794355', 'NELLY CECILIA PENAGOS', '3153564714', 21, 834, 'Calle 227 #227-227') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (228, 'CC', '91448439', 'NESTOR CARAZO', '3145545607', 21, 834, 'Carrera 228 #228-228') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (229, 'CC', '40792554', 'NEYLA DEL PILAR ONATE', '3003028016', 21, 834, 'Calle 229 #229-229') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (230, 'TI', '1098703391', 'NIKOL DANIELA DIAZ', '3156747619', 21, 834, 'Carrera 230 #230-230') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (231, 'CC', '13375103', 'NOEL SANCHEZ', '3222853966', 26, 950, 'Calle 231 #231-231') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (232, 'CC', '63441616', 'NOHEMY CABALLERO', '3123167399', 26, 898, 'Carrera 232 #232-232') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (233, 'CC', '28342542', 'NORHA CASTRO', '3134397732', 26, 898, 'Calle 233 #233-233') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (234, 'CC', '27789931', 'NUBIA ESPERANZA LATORRE', '3193393731', 26, 898, 'Carrera 234 #234-234') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (235, 'CC', '51697497', 'ODILIA RUEDA', '3118123397', 26, 898, 'Calle 235 #235-235') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (236, 'CC', '41585853', 'ODILIA SERRANO', '3153916903', 26, 898, 'Carrera 236 #236-236') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (237, 'CE', '516976', 'OLEG GOLOMBEK', '3013669245', 26, 898, 'Calle 237 #237-237') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (238, 'CC', '27763436', 'OLGA FLOREZ', '3174191936', 26, 898, 'Carrera 238 #238-238') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (239, 'CC', '41647603', 'OLGA NANCY NINO', '3125410246', 26, 898, 'Calle 239 #239-239') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (240, 'CC', '37822664', 'OLIVA RUEDA', '3165750434', 26, 898, 'Carrera 240 #240-240') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (241, 'CC', '28495111', 'OMAIRA RUEDA', '3002119368', 21, 818, 'Calle 241 #241-241') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (242, 'CC', '26676904', 'ORFANELLY CANAS', '3172313623', 26, 898, 'Carrera 242 #242-242') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (243, 'CC', '49650250', 'ORFILIA TRIVINO', '3102954777', 26, 898, 'Calle 243 #243-243') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (244, 'CC', '91289149', 'OSCAR LEONARDO DIAZ', '3132100410', 26, 898, 'Carrera 244 #244-244') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (245, 'CC', '13829503', 'PABLO BENAVIDES', '3177726893', 26, 898, 'Calle 245 #245-245') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (246, 'CE', '4164348', 'PABLO ENRIQUE BERNAL', '3114406235', 26, 898, 'Carrera 246 #246-246') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (247, 'CC', '63277591', 'PATRICIA ISABEL GOMEZ', '3124820376', 26, 898, 'Calle 247 #247-247') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (248, 'CC', '91150393', 'PEDRO VICENTE CASTRO', '3156244758', 26, 898, 'Carrera 248 #248-248') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (249, 'CC', '91226952', 'RAFAEL JARABA', '3126988037', 26, 898, 'Calle 249 #249-249') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (250, 'CC', '13818567', 'RAFAEL MANTILLA', '3013712770', 26, 898, 'Carrera 250 #250-250') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (251, 'CC', '5744340', 'RAFAEL ANTONIO ACOSTA', '3138133730', 26, 898, 'Calle 251 #251-251') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (252, 'CC', '13806426', 'RAMIRO CHAPARRO', '3005202071', 26, 898, 'Carrera 252 #252-252') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (253, 'CC', '91473533', 'RAMIRO PINZON', '3172260699', 26, 898, 'Calle 253 #253-253') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (254, 'CC', '91100688', 'RAMON LEON', '3165790234', 26, 898, 'Carrera 254 #254-254') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (255, 'CC', '63451185', 'RAQUEL LILIANA BULLA', '3154018986', 26, 898, 'Calle 255 #255-255') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (256, 'CC', '28418780', 'REBECA RUEDA', '3176768860', 26, 898, 'Carrera 256 #256-256') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (257, 'CC', '19332903', 'RICARDO CARDOZO', '3023507533', 26, 898, 'Calle 257 #257-257') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (258, 'CC', '91223125', 'RICARDO RODRIGUEZ', '3163793146', 26, 898, 'Carrera 258 #258-258') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (259, 'CC', '5687004', 'RITO ANTONIO TORRES', '3142582122', 26, 898, 'Calle 259 #259-259') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (260, 'CC', '91459195', 'ROBINSON ALEXANDER ALVARADO', '3186234107', 26, 898, 'Carrera 260 #260-260') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (261, 'TI', '1098793344', 'RODRIGO MANRIQUE', '3219536839', 26, 898, 'Calle 261 #261-261') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (262, 'CC', '37705986', 'ROSA BAUTISTA', '3202086875', 26, 898, 'Carrera 262 #262-262') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (263, 'CC', '37239382', 'ROSA ELVIA CARVAJAL', '3156730549', 26, 898, 'Calle 263 #263-263') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (264, 'CC', '28294042', 'ROSALBA MENDEZ', '3142628362', 26, 898, 'Carrera 264 #264-264') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (265, 'CC', '41440980', 'ROSAURA ORDONEZ', '3108757404', 26, 898, 'Calle 265 #265-265') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (266, 'CC', '63455618', 'ROSILVIA BORJA', '3045732674', 26, 898, 'Carrera 266 #266-266') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (267, 'CC', '52259051', 'RUTH FABIOLA SUAREZ', '3164741390', 26, 898, 'Calle 267 #267-267') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (268, 'CC', '34561606', 'SANDRA ESMERALDA NOGUERA', '3122081524', 26, 950, 'Carrera 268 #268-268') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (269, 'RC', '1098758853', 'SANDRA MILENA GUEVARA', '3208280258', 26, 895, 'Calle 269 #269-269') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (270, 'CC', '1067615882', 'SARA ELIZA BENAVIDES', '3006744191', 26, 895, 'Carrera 270 #270-270') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (271, 'RC', '1098783472', 'SARAH CAMACHO', '3142773009', 21, 818, 'Calle 271 #271-271') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (272, 'CC', '1005189926', 'SEBASTIAN GAVIRIA', '3164076647', 21, 818, 'Carrera 272 #272-272') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (273, 'CC', '1050546472', 'SMITH PEDROZO', '3123030771', 21, 818, 'Calle 273 #273-273') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (274, 'CC', '1097282027', 'SONIA QUINTERO', '3202205509', 21, 818, 'Carrera 274 #274-274') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (275, 'RC', '1098822921', 'STEPHANY PAOLA FIGUEROA', '3208203721', 21, 818, 'Calle 275 #275-275') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (276, 'CC', '49663573', 'STHELLA JAIMES', '3158268516', 21, 818, 'Carrera 276 #276-276') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (277, 'RC', '1127663736', 'THALIA GUADALUPE GARCIA', '3204133599', 26, 895, 'Calle 277 #277-277') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (278, 'CC', '12522218', 'VICTOR EUSEBIO DELPORTILLO', '3183740285', 26, 895, 'Carrera 278 #278-278') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (279, 'CC', '1095794166', 'VICTOR MANUEL LIZARAZO', '3156903049', 26, 895, 'Calle 279 #279-279') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (280, 'CC', '11788365', 'WILFRIDO RIOS', '3175161425', 26, 895, 'Carrera 280 #280-280') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (281, 'RC', '1098750980', 'YADY CAROLINA SANCHEZ', '3168966298', 26, 895, 'Calle 281 #281-281') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (282, 'CC', '28193714', 'YOLANDA ARIZA', '3133921755', 26, 895, 'Carrera 282 #282-282') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (283, 'CC', '37836760', 'YOLANDA CARRENO', '3153441687', 26, 895, 'Calle 283 #283-283') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (284, 'CC', '27649936', 'YOLANDA FLOREZ', '3115459046', 26, 895, 'Carrera 284 #284-284') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (285, 'CC', '37178776', 'YOLANDA MONSALVE', '3112261587', 26, 950, 'Calle 285 #285-285') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (286, 'CC', '63310904', 'YOLANDA NINO', '3112022346', 26, 950, 'Carrera 286 #286-286') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".pacientes VALUES (287, 'CC', '28268014', 'ZENAIDA CARDENAS', '3132154008', 26, 950, 'Calle 287 #287-287') ON CONFLICT DO NOTHING;


--
-- TOC entry 3536 (class 0 OID 1630356)
-- Dependencies: 232
-- Data for Name: profesionales; Type: TABLE DATA; Schema: William Uribe; Owner: Comfe_owner
--

INSERT INTO "William Uribe".profesionales VALUES (1, 'ALEJANDROTELLO HERNANDEZ', 'OFTALMOLOGIA', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (2, 'ANA MILENAVALDES RINCON', 'OFTALMOLOGIA', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (3, 'ANGELA JULIANAHIGUERA MARTINEZ', 'OFTALMOLOGIA', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (4, 'ANGIOGRAFIASOPT', 'ANGIOGRAFIAS', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (5, 'BAJA VISIONY ORTOPTICA', 'OFTALMOLOGIA', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (6, 'BEATRIZTIBADUIZA VARGAS', 'OFTALMOLOGIA', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (7, 'CAMILO ANDRESNINO MORENO', 'OFTALMOLOGIA', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (8, 'CAMPOSVISUALES', 'OFTALMOLOGIA', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (9, 'CARLOS FAHIRROJAS BARAJAS', 'OFTALMOLOGIA', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (10, 'CARLOS JULIANRODRIGUEZ VIVIESCAS', 'OFTALMOLOGIA', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (11, 'CARLOS MARIORANGEL GUALDRON', 'OFTALMOLOGIA', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (12, 'CLAUDIA LILIANACORONEL RAMIREZ', 'OFTALMOLOGIA', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (13, 'DEMODEXCOTA', 'DEMODEX', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (14, 'ELECTROFISIOLOGIAOPT', 'ELECTROFISIOLOGIA', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (15, 'EXAMENES COTAGENERAL', 'EXAMENES', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (16, 'EXAMENES Y OPTOMETRIASEDE INTERNACIONAL', 'EXAMENES', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (17, 'EXAMENESCOTA - 0CT', 'EXAMENES', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (18, 'EXAMENESCOTA COMPLEM.', 'EXAMENES', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (19, 'EXAMENESSAN GIL', 'EXAMENES', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (20, 'EXAMREMIT. INTERN.', 'EXAMENES', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (21, 'FEDERICOVELEZ', 'OFTALMOLOGIA', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (22, 'FELIXLEIVA FAJARDO', 'OFTALMOLOGIA', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (23, 'FELLOW IRIDOTOMIASCOTA', 'IRIDOTOMIA', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (24, 'FELLOW1', 'OPTOMETRIA', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (25, 'FELLOW2 IRID Y CAPS', 'IRIDOTOMIA', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (26, 'FELLOWSEDE INTERNACIONAL', 'OPTOMETRIA', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (27, 'FELLOWGLAUCOMA', 'GLAUCOMA', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (28, 'FELLOWMOD 50', 'OFTALMOLOGIA', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (29, 'GERMAN HUMBERTOSOTO REY', 'ORTOPTICA', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (33, 'KAROL DAYANNAQUINTERO ALCANTAR', 'OCUPLASTIA', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (34, 'LAURA XIMENAROA REYES', 'OCUPLASTIA', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (35, 'LEIDY PAOLAGONZALEZ RODRIGUEZ', 'OPTOMETRIA', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (36, 'MARCELACIANCI PENARANDA', 'OPTOMETRIA', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (37, 'MARIA ALEJANDRAGOMEZ ROCHA', 'OPTOMETRIA', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (38, 'MARIA FERNANDAACUNA VESGA', 'OPTOMETRIA', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (39, 'MARIA ISMENIATAPIAS RUIZ', 'OCUPLASTIA', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (40, 'MARIA MARGARITAPARRA CASTILLO', 'OCUPLASTIA', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (41, 'MAYERLICALDERON RUEDA', 'OCUPLASTIA', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (42, 'MELISSA JULIETHOJEDA SALAZAR', 'OCUPLASTIA', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (49, 'OCTCOTA', 'VARIOS', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (53, 'PARTICULARESBARRANCA', 'VARIOS', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (54, 'PARTICULARESCACIQUE', 'VARIOS', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (55, 'PARTICULARESDE LA CUESTA', 'VARIOS', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (56, 'PEDRO LUISCARDENAS ANGELONE', 'OPTOMETRIA', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (57, 'RAFAEL ENRIQUEDURAN PRADA', 'OFTALMOLOGIA', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (58, 'RUBEN DANIELBERROSPI SALCEDO', 'OFTALMOLOGIA', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (59, 'SANDRA MILENABELTRAN CEDIEL', 'OFTALMOLOGIA', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (60, 'SMITH LARITZALEAL MEDINA', 'OFTALMOLOGIA', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (61, 'VICTOR HUGOSERNA VILLEGAS', 'OFTALMOLOGIA', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (62, 'JOSE FERNANDO GALVIS RAMIREZ', 'OFTALMOLOGIA', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (63, 'VIVIANA ANDREALOPEZ COVALEDA', 'OPTOMETRIA', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (64, 'VIVIANA ROCIOFIGUEROA MORALES', 'OPTOMETRIA', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (65, 'YUDY MILENARANGEL DUARTE', 'OPTOMETRIA', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (66, 'YURLEISYPICON MARINO', 'OPTOMETRIA', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (30, 'GERMAN RENEAMADOR ARANDA', 'RETINOLOGIA', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (31, 'JOHANNAFUQUEN ROJAS', 'RETINOLOGIA', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (32, 'JUAN SEBASTIANABRIL TOSCANO', 'RETINOLOGIA', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (43, 'MIGUEL ANDRESSILVA MUNOZ', 'RETINOLOGIA', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (44, 'NATALIACORREA VENEGAS', 'RETINOLOGIA', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (45, 'NATHALIA JULIANAMORENO CASTRO', 'RETINOLOGIA', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (46, 'NELSON AUGUSTOVELASQUEZ GOMEZ', 'RETINOLOGIA', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (47, 'NESTOR IVANCARRENO JAIMES', 'RETINOLOGIA', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (48, 'NICOLASRIVERO CARDENAS', 'RETINOLOGIA', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (50, 'OPTOMETRACITAS Y EXAMENES', 'OPTOMETRIA', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (51, 'OPTOMETRIACOTA GLAUCOMA', 'GLAUCOMA', true) ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".profesionales VALUES (52, 'OPTOMETRIASAN GIL', 'OPTOMETRIA', true) ON CONFLICT DO NOTHING;


--
-- TOC entry 3538 (class 0 OID 1630419)
-- Dependencies: 242
-- Data for Name: tipos_citas; Type: TABLE DATA; Schema: William Uribe; Owner: Comfe_owner
--

INSERT INTO "William Uribe".tipos_citas VALUES (1, 'ABERROMETRIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".tipos_citas VALUES (2, 'ANGIOGRAFIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".tipos_citas VALUES (3, 'BIOMETRIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".tipos_citas VALUES (4, 'CAMPO VISUAL') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".tipos_citas VALUES (5, 'CAPSULOTOMIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".tipos_citas VALUES (6, 'CONSULTA DE BAJA VISION') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".tipos_citas VALUES (7, 'CONSULTA DE OCULOPLASTIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".tipos_citas VALUES (8, 'CONSULTA DE ORTOPTICA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".tipos_citas VALUES (9, 'CONSULTA DE RETINA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".tipos_citas VALUES (10, 'CONTROL') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".tipos_citas VALUES (11, 'CONTROL CON OPTOMETRIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".tipos_citas VALUES (12, 'CONTROL LASER') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".tipos_citas VALUES (13, 'CONTROL POP') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".tipos_citas VALUES (14, 'CONTROL POP CON OPTOMETRIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".tipos_citas VALUES (15, 'CONTROL POP LASIK') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".tipos_citas VALUES (16, 'DEMODEX') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".tipos_citas VALUES (17, 'EXAMENES') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".tipos_citas VALUES (18, 'FOTOCOAGULACION') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".tipos_citas VALUES (19, 'FOTOS DE SEGMENTO ANTERIOR') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".tipos_citas VALUES (20, 'FOTOS DE SEGMENTO POSTERIOR') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".tipos_citas VALUES (21, 'IRIDOTOMIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".tipos_citas VALUES (22, 'OCT - ANGIOGRAFIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".tipos_citas VALUES (23, 'OCT MACULAR') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".tipos_citas VALUES (24, 'OCT CAPA DE FIBRAS NERVIOSAS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".tipos_citas VALUES (25, 'OFTALMOLOGIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".tipos_citas VALUES (26, 'OFTALMOLOGIA CON EXAMENES') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".tipos_citas VALUES (27, 'OFTALMOLOGIA EVENTO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".tipos_citas VALUES (28, 'OFTALMOLOGIA PEDIATRICA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".tipos_citas VALUES (29, 'OFTALMOLOGIA SAN GIL') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".tipos_citas VALUES (30, 'OPTOMETRIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".tipos_citas VALUES (31, 'OPTOMETRIA EVENTO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".tipos_citas VALUES (32, 'PAQUIMETRIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".tipos_citas VALUES (33, 'POTENCIALES EVOCADOS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".tipos_citas VALUES (34, 'PREQUIRURGICA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".tipos_citas VALUES (35, 'PREQUIRURGICA CATARATA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".tipos_citas VALUES (36, 'PREQUIRURGICA LASER') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".tipos_citas VALUES (37, 'RECUENTO ENDOTELIAL') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".tipos_citas VALUES (38, 'TONOGRAFIA CON PRUEBAS PROVOCATIVAS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".tipos_citas VALUES (39, 'TOPOGRAFIA') ON CONFLICT DO NOTHING;


--
-- TOC entry 3546 (class 0 OID 1753093)
-- Dependencies: 297
-- Data for Name: usuarios; Type: TABLE DATA; Schema: William Uribe; Owner: Comfe_owner
--

INSERT INTO "William Uribe".usuarios VALUES (1, 'JUAN FRANCISCO MEJIA MEJIA', 'J.MEJIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".usuarios VALUES (2, 'NEYLA ROCIO GOMEZ FERREIRA', 'N.GOMEZ') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".usuarios VALUES (3, 'ANA MARIA CARVAJAL CASANOVA', 'A.CARVAJAL') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".usuarios VALUES (4, 'JENNIFER TATIANA RIANO SARMIENTO', 'J.RIANO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".usuarios VALUES (5, 'MARIA ESPERANZA MEJIA OTERO', 'M.MEJIA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".usuarios VALUES (6, 'SNEIDER VELOZA CALDERON', 'S.CALDERON') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".usuarios VALUES (7, 'BLEIDY YULIANA GALLO MUNOZ', 'B.GALLO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".usuarios VALUES (8, 'JUAN SEBASTIAN ARDILA LASCARRO', 'J.ARDILA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".usuarios VALUES (9, 'BLANCA MELENDEZ ARIAS', 'B.ARIAS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".usuarios VALUES (10, 'DAYIDIS RODRIGUEZ SANCHEZ', 'D.SANCHEZ') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".usuarios VALUES (11, 'GLADYS YANETH MANRIQUE BALLESTEROS', 'G.MANRIQUE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".usuarios VALUES (12, 'SANDRA CUADROS', 'S.CUADROS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".usuarios VALUES (13, 'OLGA LUCIA PINZON AYALA', 'O.PINZON') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".usuarios VALUES (14, 'MILENA RAFAELA ESTRADA MORA', 'M.ESTRADA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".usuarios VALUES (15, 'CAMILA ANDREA PLATA URIBE', 'C.PLATA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".usuarios VALUES (16, 'HECTOR ALONSO GUTIERREZ RODRIGUEZ', 'H.GUTIERREZ') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".usuarios VALUES (17, 'LINA GIZETH MURILLO MANTILLA', 'L.MURILLO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".usuarios VALUES (18, 'YURLEY TATIANA CARDENAS LEON', 'Y.CARDENAS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".usuarios VALUES (19, 'LEIDY ALEJANDRA MUNOZ AVILA', 'L.MUNOZ') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".usuarios VALUES (20, 'OLGA MILENA GUALDRON BASTILLA', 'O.GUALDRON') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".usuarios VALUES (21, 'DANIELA ZULEIMY PINZON TOLOZA', 'D.PINZON') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".usuarios VALUES (22, 'NICOLAS GOMEZ RUEDA', 'N.RUEDA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".usuarios VALUES (23, 'TAREAS AUTOMATICAS', 'T.AUTOMATICAS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".usuarios VALUES (24, 'JOHAN SEBASTIAN CASANOVA SOTELO', 'J.CASANOVA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".usuarios VALUES (25, 'MAYERLYN VANESSA VERA VARGAS', 'M.VERA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".usuarios VALUES (26, 'JENNIFER VANESSA DIAZ AVILA', 'J.DIAZ') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".usuarios VALUES (27, 'LUCERO SANABRIA ROMERO', 'L.ROMERO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".usuarios VALUES (28, 'ELCIDA LOPEZ CARRENO', 'E.CARRENO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".usuarios VALUES (29, 'LILIANA VEGA MENDOZA', 'L.MENDOZA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".usuarios VALUES (30, 'HAROL JHIOSETH CHINOMES CACERES', 'H.CHINOMES') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".usuarios VALUES (31, 'OLGA ROCIO RIOS MERCHAN', 'O.RIOS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".usuarios VALUES (32, 'LUZ KARINE HERNANDEZ MONTANEZ', 'L.HERNANDEZ') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".usuarios VALUES (33, 'STEPHANIE CARDENAS PINZON', 'S.PINZON') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".usuarios VALUES (34, 'LEYDI MARCELA RANGEL BARRERA', 'L.RANGEL') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".usuarios VALUES (35, 'YORLEY BIBIANA CONDE PENA', 'Y.CONDE') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".usuarios VALUES (36, 'XIMENA MARTINEZ ALVAREZ', 'X.ALVAREZ') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".usuarios VALUES (37, 'DIANA MARCELA ARCHILA TELLEZ', 'D.ARCHILA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".usuarios VALUES (38, 'LISSET TATIANA QUINONEZ CRISTANCHO', 'L.QUINONEZ') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".usuarios VALUES (39, 'CINDY JOHANNA SANCHEZ OJEDA', 'C.SANCHEZ') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".usuarios VALUES (40, 'NORMA ROCIO PICO AYALA', 'N.PICO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".usuarios VALUES (41, 'NICOLAS RIVERO CARDENAS', 'N.CARDENAS') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".usuarios VALUES (42, 'YEIMY LILIANA SERRANO VELASCO', 'Y.SERRANO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".usuarios VALUES (43, 'BREILY ZARETH CAMACHO CASTILLO', 'B.CAMACHO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".usuarios VALUES (44, 'MILAGROS NAMIBIA MARTINEZ SUAREZ', 'M.MARTINEZ') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".usuarios VALUES (45, 'MAYERLY MONCADA NORENA', 'M.NORENA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".usuarios VALUES (46, 'JHOINER ANTONIO ESQUIVEL NAVARRO', 'J.ESQUIVEL') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".usuarios VALUES (47, 'LAURA MARCELA RODRIGUEZ APARICIO', 'L.RODRIGUEZ') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".usuarios VALUES (48, 'SANDRA MILENA CARMONA ARIAS', 'S.CARMONA') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".usuarios VALUES (49, 'LENI JOHANA SINUCO MARTINEZ', 'L.SINUCO') ON CONFLICT DO NOTHING;
INSERT INTO "William Uribe".usuarios VALUES (50, 'INGRID PIEDAD PADILLA CONTRERAS', 'I.PADILLA') ON CONFLICT DO NOTHING;


--
-- TOC entry 3563 (class 0 OID 0)
-- Dependencies: 267
-- Name: citas_id_seq; Type: SEQUENCE SET; Schema: William Uribe; Owner: Comfe_owner
--

SELECT pg_catalog.setval('"William Uribe".citas_id_seq', 1, false);


--
-- TOC entry 3564 (class 0 OID 0)
-- Dependencies: 264
-- Name: consultorios_id_seq; Type: SEQUENCE SET; Schema: William Uribe; Owner: Comfe_owner
--

SELECT pg_catalog.setval('"William Uribe".consultorios_id_seq', 1, true);


--
-- TOC entry 3565 (class 0 OID 0)
-- Dependencies: 227
-- Name: convenios_id_seq; Type: SEQUENCE SET; Schema: William Uribe; Owner: Comfe_owner
--

SELECT pg_catalog.setval('"William Uribe".convenios_id_seq', 1, false);


--
-- TOC entry 3566 (class 0 OID 0)
-- Dependencies: 223
-- Name: departamento_id_seq; Type: SEQUENCE SET; Schema: William Uribe; Owner: Comfe_owner
--

SELECT pg_catalog.setval('"William Uribe".departamento_id_seq', 33, true);


--
-- TOC entry 3567 (class 0 OID 0)
-- Dependencies: 241
-- Name: especialidades_id_seq; Type: SEQUENCE SET; Schema: William Uribe; Owner: Comfe_owner
--

SELECT pg_catalog.setval('"William Uribe".especialidades_id_seq', 1, false);


--
-- TOC entry 3568 (class 0 OID 0)
-- Dependencies: 294
-- Name: est_cita_id_seq; Type: SEQUENCE SET; Schema: William Uribe; Owner: Comfe_owner
--

SELECT pg_catalog.setval('"William Uribe".est_cita_id_seq', 1, false);


--
-- TOC entry 3569 (class 0 OID 0)
-- Dependencies: 225
-- Name: municipios_id_seq; Type: SEQUENCE SET; Schema: William Uribe; Owner: Comfe_owner
--

SELECT pg_catalog.setval('"William Uribe".municipios_id_seq', 1, false);


--
-- TOC entry 3570 (class 0 OID 0)
-- Dependencies: 221
-- Name: pacientes_id_seq; Type: SEQUENCE SET; Schema: William Uribe; Owner: Comfe_owner
--

SELECT pg_catalog.setval('"William Uribe".pacientes_id_seq', 1, false);


--
-- TOC entry 3571 (class 0 OID 0)
-- Dependencies: 231
-- Name: profesionales_id_seq; Type: SEQUENCE SET; Schema: William Uribe; Owner: Comfe_owner
--

SELECT pg_catalog.setval('"William Uribe".profesionales_id_seq', 1, false);


--
-- TOC entry 3572 (class 0 OID 0)
-- Dependencies: 296
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: William Uribe; Owner: Comfe_owner
--

SELECT pg_catalog.setval('"William Uribe".usuarios_id_seq', 1, false);


--
-- TOC entry 3379 (class 2606 OID 1654804)
-- Name: citas citas_pkey; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".citas
    ADD CONSTRAINT citas_pkey PRIMARY KEY (id);


--
-- TOC entry 3377 (class 2606 OID 1654790)
-- Name: consultorios consultorios_pkey; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".consultorios
    ADD CONSTRAINT consultorios_pkey PRIMARY KEY (id);


--
-- TOC entry 3371 (class 2606 OID 1630347)
-- Name: convenios convenios_pkey; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".convenios
    ADD CONSTRAINT convenios_pkey PRIMARY KEY (id);


--
-- TOC entry 3367 (class 2606 OID 1630279)
-- Name: departamentos departamento_pkey; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".departamentos
    ADD CONSTRAINT departamento_pkey PRIMARY KEY (id);


--
-- TOC entry 3375 (class 2606 OID 1630424)
-- Name: tipos_citas especialidades_pkey; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".tipos_citas
    ADD CONSTRAINT especialidades_pkey PRIMARY KEY (id);


--
-- TOC entry 3381 (class 2606 OID 1736710)
-- Name: est_cita est_cita_pkey; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".est_cita
    ADD CONSTRAINT est_cita_pkey PRIMARY KEY (id);


--
-- TOC entry 3369 (class 2606 OID 1630340)
-- Name: municipios municipios_pkey; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".municipios
    ADD CONSTRAINT municipios_pkey PRIMARY KEY (id);


--
-- TOC entry 3365 (class 2606 OID 1630259)
-- Name: pacientes pacientes_pkey; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".pacientes
    ADD CONSTRAINT pacientes_pkey PRIMARY KEY (id);


--
-- TOC entry 3373 (class 2606 OID 1630361)
-- Name: profesionales profesionales_pkey; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".profesionales
    ADD CONSTRAINT profesionales_pkey PRIMARY KEY (id);


--
-- TOC entry 3361 (class 2606 OID 1712197)
-- Name: consultorios solo_mayusc_consult; Type: CHECK CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE "William Uribe".consultorios
    ADD CONSTRAINT solo_mayusc_consult CHECK ((upper((nombre_consultorio)::text) = (nombre_consultorio)::text)) NOT VALID;


--
-- TOC entry 3358 (class 2606 OID 1712206)
-- Name: convenios solo_mayusc_convenio; Type: CHECK CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE "William Uribe".convenios
    ADD CONSTRAINT solo_mayusc_convenio CHECK ((upper((nom_convenio)::text) = (nom_convenio)::text)) NOT VALID;


--
-- TOC entry 3356 (class 2606 OID 1712207)
-- Name: departamentos solo_mayusc_depto; Type: CHECK CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE "William Uribe".departamentos
    ADD CONSTRAINT solo_mayusc_depto CHECK ((upper((nom_dpto)::text) = (nom_dpto)::text)) NOT VALID;


--
-- TOC entry 3362 (class 2606 OID 1744896)
-- Name: est_cita solo_mayusc_estado; Type: CHECK CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE "William Uribe".est_cita
    ADD CONSTRAINT solo_mayusc_estado CHECK ((upper((estado)::text) = (estado)::text)) NOT VALID;


--
-- TOC entry 3357 (class 2606 OID 1712216)
-- Name: municipios solo_mayusc_municp; Type: CHECK CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE "William Uribe".municipios
    ADD CONSTRAINT solo_mayusc_municp CHECK ((upper((nom_municip)::text) = (nom_municip)::text)) NOT VALID;


--
-- TOC entry 3359 (class 2606 OID 1712219)
-- Name: profesionales solo_mayusc_nombre_prof; Type: CHECK CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE "William Uribe".profesionales
    ADD CONSTRAINT solo_mayusc_nombre_prof CHECK ((upper((nombre_prof)::text) = (nombre_prof)::text)) NOT VALID;


--
-- TOC entry 3355 (class 2606 OID 1712217)
-- Name: pacientes solo_mayusc_paciente_nomb; Type: CHECK CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE "William Uribe".pacientes
    ADD CONSTRAINT solo_mayusc_paciente_nomb CHECK ((upper((nombre_completo)::text) = (nombre_completo)::text)) NOT VALID;


--
-- TOC entry 3360 (class 2606 OID 1712220)
-- Name: profesionales solo_mayusc_profesion; Type: CHECK CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE "William Uribe".profesionales
    ADD CONSTRAINT solo_mayusc_profesion CHECK ((upper((profesion)::text) = (profesion)::text)) NOT VALID;


--
-- TOC entry 3383 (class 2606 OID 1753099)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


-- Completed on 2025-03-01 19:43:17

--
-- PostgreSQL database dump complete
--


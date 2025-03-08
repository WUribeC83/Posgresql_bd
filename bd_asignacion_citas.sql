--
-- PostgreSQL database dump
--

-- Dumped from database version 16.8
-- Dumped by pg_dump version 17.2

-- Started on 2025-03-07 21:24:09

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
-- TOC entry 3658 (class 0 OID 0)
-- Dependencies: 8
-- Name: SCHEMA "William Uribe"; Type: COMMENT; Schema: -; Owner: Comfe_owner
--

COMMENT ON SCHEMA "William Uribe" IS 'BD  Asignacion Citas,  para IPS especializada en temas de salud visual, ubicada en la ciudad de Bucaramanga, para tener el record de las citas asignadas en la misma.';


--
-- TOC entry 327 (class 1255 OID 1769549)
-- Name: convertir_a_colombia(timestamp without time zone); Type: FUNCTION; Schema: William Uribe; Owner: Comfe_owner
--

CREATE FUNCTION "William Uribe".convertir_a_colombia(fecha_utc timestamp without time zone) RETURNS timestamp without time zone
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN fecha_utc AT TIME ZONE 'UTC' AT TIME ZONE 'America/Bogota';
END;
$$;


ALTER FUNCTION "William Uribe".convertir_a_colombia(fecha_utc timestamp without time zone) OWNER TO "Comfe_owner";

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 259 (class 1259 OID 1654791)
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
    fecha_reg timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE "William Uribe".citas OWNER TO "Comfe_owner";

--
-- TOC entry 260 (class 1259 OID 1654798)
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
-- TOC entry 3659 (class 0 OID 0)
-- Dependencies: 260
-- Name: citas_id_seq; Type: SEQUENCE OWNED BY; Schema: William Uribe; Owner: Comfe_owner
--

ALTER SEQUENCE "William Uribe".citas_id_seq OWNED BY "William Uribe".citas.id;


--
-- TOC entry 258 (class 1259 OID 1654785)
-- Name: consultorios; Type: TABLE; Schema: William Uribe; Owner: Comfe_owner
--

CREATE TABLE "William Uribe".consultorios (
    id integer NOT NULL,
    nombre_consultorio character varying(30) NOT NULL
);


ALTER TABLE "William Uribe".consultorios OWNER TO "Comfe_owner";

--
-- TOC entry 257 (class 1259 OID 1654784)
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
-- TOC entry 3660 (class 0 OID 0)
-- Dependencies: 257
-- Name: consultorios_id_seq; Type: SEQUENCE OWNED BY; Schema: William Uribe; Owner: Comfe_owner
--

ALTER SEQUENCE "William Uribe".consultorios_id_seq OWNED BY "William Uribe".consultorios.id;


--
-- TOC entry 226 (class 1259 OID 1630342)
-- Name: convenios; Type: TABLE; Schema: William Uribe; Owner: Comfe_owner
--

CREATE TABLE "William Uribe".convenios (
    id integer NOT NULL,
    nom_convenio character varying(20) NOT NULL
);


ALTER TABLE "William Uribe".convenios OWNER TO "Comfe_owner";

--
-- TOC entry 225 (class 1259 OID 1630341)
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
-- TOC entry 3661 (class 0 OID 0)
-- Dependencies: 225
-- Name: convenios_id_seq; Type: SEQUENCE OWNED BY; Schema: William Uribe; Owner: Comfe_owner
--

ALTER SEQUENCE "William Uribe".convenios_id_seq OWNED BY "William Uribe".convenios.id;


--
-- TOC entry 222 (class 1259 OID 1630274)
-- Name: departamentos; Type: TABLE; Schema: William Uribe; Owner: Comfe_owner
--

CREATE TABLE "William Uribe".departamentos (
    id integer NOT NULL,
    nom_dpto character varying(30)
);


ALTER TABLE "William Uribe".departamentos OWNER TO "Comfe_owner";

--
-- TOC entry 221 (class 1259 OID 1630273)
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
-- TOC entry 3662 (class 0 OID 0)
-- Dependencies: 221
-- Name: departamento_id_seq; Type: SEQUENCE OWNED BY; Schema: William Uribe; Owner: Comfe_owner
--

ALTER SEQUENCE "William Uribe".departamento_id_seq OWNED BY "William Uribe".departamentos.id;


--
-- TOC entry 240 (class 1259 OID 1630419)
-- Name: tipos_citas; Type: TABLE; Schema: William Uribe; Owner: Comfe_owner
--

CREATE TABLE "William Uribe".tipos_citas (
    id integer NOT NULL,
    tipo_cita character varying(50)
);


ALTER TABLE "William Uribe".tipos_citas OWNER TO "Comfe_owner";

--
-- TOC entry 239 (class 1259 OID 1630418)
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
-- TOC entry 3663 (class 0 OID 0)
-- Dependencies: 239
-- Name: especialidades_id_seq; Type: SEQUENCE OWNED BY; Schema: William Uribe; Owner: Comfe_owner
--

ALTER SEQUENCE "William Uribe".especialidades_id_seq OWNED BY "William Uribe".tipos_citas.id;


--
-- TOC entry 288 (class 1259 OID 1736705)
-- Name: est_cita; Type: TABLE; Schema: William Uribe; Owner: Comfe_owner
--

CREATE TABLE "William Uribe".est_cita (
    id integer NOT NULL,
    estado character varying(15)
);


ALTER TABLE "William Uribe".est_cita OWNER TO "Comfe_owner";

--
-- TOC entry 287 (class 1259 OID 1736704)
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
-- TOC entry 3664 (class 0 OID 0)
-- Dependencies: 287
-- Name: est_cita_id_seq; Type: SEQUENCE OWNED BY; Schema: William Uribe; Owner: Comfe_owner
--

ALTER SEQUENCE "William Uribe".est_cita_id_seq OWNED BY "William Uribe".est_cita.id;


--
-- TOC entry 224 (class 1259 OID 1630335)
-- Name: municipios; Type: TABLE; Schema: William Uribe; Owner: Comfe_owner
--

CREATE TABLE "William Uribe".municipios (
    id integer NOT NULL,
    departamentos_id integer,
    nom_municip character varying(30)
);


ALTER TABLE "William Uribe".municipios OWNER TO "Comfe_owner";

--
-- TOC entry 223 (class 1259 OID 1630334)
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
-- TOC entry 3665 (class 0 OID 0)
-- Dependencies: 223
-- Name: municipios_id_seq; Type: SEQUENCE OWNED BY; Schema: William Uribe; Owner: Comfe_owner
--

ALTER SEQUENCE "William Uribe".municipios_id_seq OWNED BY "William Uribe".municipios.id;


--
-- TOC entry 304 (class 1259 OID 1769534)
-- Name: pacientes; Type: TABLE; Schema: William Uribe; Owner: Comfe_owner
--

CREATE TABLE "William Uribe".pacientes (
    id integer NOT NULL,
    tipo_doc_id integer,
    nro_doc character varying(20) NOT NULL,
    nombre_completo character varying(100) NOT NULL,
    tel_contacto character varying(10),
    departamentos_id integer,
    municipios_id integer,
    direccion_residencia character varying(100)
);


ALTER TABLE "William Uribe".pacientes OWNER TO "Comfe_owner";

--
-- TOC entry 305 (class 1259 OID 1769537)
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
-- TOC entry 3666 (class 0 OID 0)
-- Dependencies: 305
-- Name: pacientes_id_seq; Type: SEQUENCE OWNED BY; Schema: William Uribe; Owner: Comfe_owner
--

ALTER SEQUENCE "William Uribe".pacientes_id_seq OWNED BY "William Uribe".pacientes.id;


--
-- TOC entry 230 (class 1259 OID 1630356)
-- Name: profesionales; Type: TABLE; Schema: William Uribe; Owner: Comfe_owner
--

CREATE TABLE "William Uribe".profesionales (
    id integer NOT NULL,
    nombre_prof character varying(50) NOT NULL,
    activo boolean DEFAULT true NOT NULL,
    profesiones_id integer
);


ALTER TABLE "William Uribe".profesionales OWNER TO "Comfe_owner";

--
-- TOC entry 229 (class 1259 OID 1630355)
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
-- TOC entry 3667 (class 0 OID 0)
-- Dependencies: 229
-- Name: profesionales_id_seq; Type: SEQUENCE OWNED BY; Schema: William Uribe; Owner: Comfe_owner
--

ALTER SEQUENCE "William Uribe".profesionales_id_seq OWNED BY "William Uribe".profesionales.id;


--
-- TOC entry 300 (class 1259 OID 1769481)
-- Name: profesiones; Type: TABLE; Schema: William Uribe; Owner: Comfe_owner
--

CREATE TABLE "William Uribe".profesiones (
    id integer NOT NULL,
    profesion character varying(40)
);


ALTER TABLE "William Uribe".profesiones OWNER TO "Comfe_owner";

--
-- TOC entry 299 (class 1259 OID 1769480)
-- Name: profesiones_id_seq; Type: SEQUENCE; Schema: William Uribe; Owner: Comfe_owner
--

CREATE SEQUENCE "William Uribe".profesiones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "William Uribe".profesiones_id_seq OWNER TO "Comfe_owner";

--
-- TOC entry 3668 (class 0 OID 0)
-- Dependencies: 299
-- Name: profesiones_id_seq; Type: SEQUENCE OWNED BY; Schema: William Uribe; Owner: Comfe_owner
--

ALTER SEQUENCE "William Uribe".profesiones_id_seq OWNED BY "William Uribe".profesiones.id;


--
-- TOC entry 303 (class 1259 OID 1769500)
-- Name: tipo_doc; Type: TABLE; Schema: William Uribe; Owner: Comfe_owner
--

CREATE TABLE "William Uribe".tipo_doc (
    id integer NOT NULL,
    tipo_doc character varying(3)
);


ALTER TABLE "William Uribe".tipo_doc OWNER TO "Comfe_owner";

--
-- TOC entry 302 (class 1259 OID 1769499)
-- Name: tipo_doc_id_seq; Type: SEQUENCE; Schema: William Uribe; Owner: Comfe_owner
--

CREATE SEQUENCE "William Uribe".tipo_doc_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "William Uribe".tipo_doc_id_seq OWNER TO "Comfe_owner";

--
-- TOC entry 3669 (class 0 OID 0)
-- Dependencies: 302
-- Name: tipo_doc_id_seq; Type: SEQUENCE OWNED BY; Schema: William Uribe; Owner: Comfe_owner
--

ALTER SEQUENCE "William Uribe".tipo_doc_id_seq OWNED BY "William Uribe".tipo_doc.id;


--
-- TOC entry 290 (class 1259 OID 1753093)
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
-- TOC entry 289 (class 1259 OID 1753092)
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
-- TOC entry 3670 (class 0 OID 0)
-- Dependencies: 289
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: William Uribe; Owner: Comfe_owner
--

ALTER SEQUENCE "William Uribe".usuarios_id_seq OWNED BY "William Uribe".usuarios.id;


--
-- TOC entry 321 (class 1259 OID 1794167)
-- Name: v_informe_detallado; Type: VIEW; Schema: William Uribe; Owner: Comfe_owner
--

CREATE VIEW "William Uribe".v_informe_detallado AS
 SELECT ct.fecha_cita,
    ct.hora_cita,
    tc.tipo_doc AS tipo_docum,
    pc.nro_doc AS nro_documento,
    pc.nombre_completo AS nombre_paciente,
    cs.nombre_consultorio AS lugar,
    pf.nombre_prof AS profesional,
    tic.tipo_cita
   FROM (((((("William Uribe".citas ct
     JOIN "William Uribe".pacientes pc ON ((ct.pacientes_id = pc.id)))
     JOIN "William Uribe".tipo_doc tc ON ((pc.tipo_doc_id = tc.id)))
     JOIN "William Uribe".consultorios cs ON ((ct.consultorios_id = cs.id)))
     JOIN "William Uribe".convenios con ON ((ct.convenios_id = con.id)))
     JOIN "William Uribe".profesionales pf ON ((ct.profesionales_id = pf.id)))
     JOIN "William Uribe".tipos_citas tic ON ((ct.tipos_citas_id = tic.id)));


ALTER VIEW "William Uribe".v_informe_detallado OWNER TO "Comfe_owner";

--
-- TOC entry 3671 (class 0 OID 0)
-- Dependencies: 321
-- Name: VIEW v_informe_detallado; Type: COMMENT; Schema: William Uribe; Owner: Comfe_owner
--

COMMENT ON VIEW "William Uribe".v_informe_detallado IS 'Informe Detalllado de Citas';


--
-- TOC entry 323 (class 1259 OID 1794177)
-- Name: v_ranking_profesional; Type: VIEW; Schema: William Uribe; Owner: Comfe_owner
--

CREATE VIEW "William Uribe".v_ranking_profesional AS
 SELECT EXTRACT(month FROM fecha_cita) AS mes,
    profesional,
    count(*) AS cant
   FROM "William Uribe".v_informe_detallado vis
  GROUP BY (EXTRACT(month FROM fecha_cita)), profesional;


ALTER VIEW "William Uribe".v_ranking_profesional OWNER TO "Comfe_owner";

--
-- TOC entry 3672 (class 0 OID 0)
-- Dependencies: 323
-- Name: VIEW v_ranking_profesional; Type: COMMENT; Schema: William Uribe; Owner: Comfe_owner
--

COMMENT ON VIEW "William Uribe".v_ranking_profesional IS 'Ranking Por profesional y mes';


--
-- TOC entry 3412 (class 2604 OID 1654799)
-- Name: citas id; Type: DEFAULT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".citas ALTER COLUMN id SET DEFAULT nextval('"William Uribe".citas_id_seq'::regclass);


--
-- TOC entry 3411 (class 2604 OID 1654788)
-- Name: consultorios id; Type: DEFAULT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".consultorios ALTER COLUMN id SET DEFAULT nextval('"William Uribe".consultorios_id_seq'::regclass);


--
-- TOC entry 3407 (class 2604 OID 1630345)
-- Name: convenios id; Type: DEFAULT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".convenios ALTER COLUMN id SET DEFAULT nextval('"William Uribe".convenios_id_seq'::regclass);


--
-- TOC entry 3405 (class 2604 OID 1630277)
-- Name: departamentos id; Type: DEFAULT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".departamentos ALTER COLUMN id SET DEFAULT nextval('"William Uribe".departamento_id_seq'::regclass);


--
-- TOC entry 3414 (class 2604 OID 1736708)
-- Name: est_cita id; Type: DEFAULT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".est_cita ALTER COLUMN id SET DEFAULT nextval('"William Uribe".est_cita_id_seq'::regclass);


--
-- TOC entry 3406 (class 2604 OID 1630338)
-- Name: municipios id; Type: DEFAULT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".municipios ALTER COLUMN id SET DEFAULT nextval('"William Uribe".municipios_id_seq'::regclass);


--
-- TOC entry 3418 (class 2604 OID 1769538)
-- Name: pacientes id; Type: DEFAULT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".pacientes ALTER COLUMN id SET DEFAULT nextval('"William Uribe".pacientes_id_seq'::regclass);


--
-- TOC entry 3408 (class 2604 OID 1630359)
-- Name: profesionales id; Type: DEFAULT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".profesionales ALTER COLUMN id SET DEFAULT nextval('"William Uribe".profesionales_id_seq'::regclass);


--
-- TOC entry 3416 (class 2604 OID 1769484)
-- Name: profesiones id; Type: DEFAULT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".profesiones ALTER COLUMN id SET DEFAULT nextval('"William Uribe".profesiones_id_seq'::regclass);


--
-- TOC entry 3417 (class 2604 OID 1769503)
-- Name: tipo_doc id; Type: DEFAULT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".tipo_doc ALTER COLUMN id SET DEFAULT nextval('"William Uribe".tipo_doc_id_seq'::regclass);


--
-- TOC entry 3410 (class 2604 OID 1630422)
-- Name: tipos_citas id; Type: DEFAULT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".tipos_citas ALTER COLUMN id SET DEFAULT nextval('"William Uribe".especialidades_id_seq'::regclass);


--
-- TOC entry 3415 (class 2604 OID 1753096)
-- Name: usuarios id; Type: DEFAULT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".usuarios ALTER COLUMN id SET DEFAULT nextval('"William Uribe".usuarios_id_seq'::regclass);


--
-- TOC entry 3641 (class 0 OID 1654791)
-- Dependencies: 259
-- Data for Name: citas; Type: TABLE DATA; Schema: William Uribe; Owner: Comfe_owner
--

INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (1, 85, 9, 4, 47, 25, '2025-01-02', '09:10:00', 1, 1, '2025-01-02 07:54:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (2, 159, 2, 1, 15, 32, '2025-01-02', '11:35:00', 2, 2, '2024-12-30 09:46:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (3, 188, 2, 4, 16, 30, '2025-01-02', '15:45:00', 1, 2, '2024-12-20 16:02:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (4, 234, 2, 2, 45, 27, '2025-01-03', '08:00:00', 1, 3, '2024-12-30 15:05:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (5, 236, 2, 2, 45, 25, '2025-01-03', '09:15:00', 3, 4, '2024-12-30 15:03:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (6, 89, 3, 6, 2, 29, '2025-01-03', '10:45:00', 1, 5, '2025-01-03 07:28:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (7, 93, 5, 1, 18, 39, '2025-01-03', '11:40:00', 2, 6, '2024-12-12 10:23:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (8, 262, 1, 4, 58, 10, '2025-01-04', '07:40:00', 1, 7, '2025-01-04 07:48:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (9, 276, 7, 8, 9, 31, '2025-01-05', '10:30:00', 1, 8, '2025-01-05 10:23:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (10, 84, 2, 6, 2, 27, '2025-01-07', '10:30:00', 3, 9, '2024-12-18 15:06:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (11, 213, 1, 1, 17, 22, '2025-01-07', '13:00:00', 1, 10, '2024-12-27 11:33:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (12, 201, 3, 6, 52, 30, '2025-01-08', '08:40:00', 3, 11, '2024-12-30 10:37:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (13, 237, 2, 6, 52, 31, '2025-01-08', '11:40:00', 3, 9, '2024-12-17 09:10:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (14, 200, 1, 1, 15, 3, '2025-01-08', '00:00:00', 1, 12, '2024-12-27 07:42:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (15, 83, 2, 3, 44, 28, '2025-01-08', '14:45:00', 1, 13, '2025-01-02 11:34:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (16, 272, 2, 5, 41, 30, '2025-01-08', '15:00:00', 1, 14, '2025-01-02 11:04:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (17, 236, 2, 6, 45, 25, '2025-01-08', '15:15:00', 1, 4, '2024-12-30 15:07:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (18, 153, 10, 10, 7, 25, '2025-01-08', '15:30:00', 1, 13, '2025-01-07 15:38:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (19, 208, 1, 1, 15, 1, '2025-01-09', '07:50:00', 1, 15, '2024-12-31 11:01:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (20, 171, 1, 10, 24, 25, '2025-01-09', '08:00:00', 1, 16, '2025-01-09 07:45:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (21, 210, 2, 4, 61, 25, '2025-01-09', '14:45:00', 1, 13, '2024-12-23 09:59:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (22, 116, 3, 10, 7, 25, '2025-01-09', '15:10:00', 1, 17, '2025-01-08 08:50:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (23, 197, 2, 3, 11, 9, '2025-01-10', '08:00:00', 1, 6, '2024-12-17 09:37:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (24, 162, 2, 1, 20, 39, '2025-01-10', '08:00:00', 1, 18, '2025-01-10 10:23:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (25, 174, 2, 3, 11, 9, '2025-01-10', '08:55:00', 1, 19, '2025-01-08 08:19:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (26, 112, 9, 1, 17, 24, '2025-01-10', '10:25:00', 1, 18, '2025-01-07 09:22:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (27, 12, 1, 1, 15, 37, '2025-01-10', '11:10:00', 2, 15, '2024-12-28 10:01:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (28, 13, 4, 4, 47, 10, '2025-01-10', '13:20:00', 1, 20, '2025-01-10 10:20:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (29, 137, 3, 6, 52, 30, '2025-01-10', '15:20:00', 3, 5, '2025-01-08 09:41:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (30, 74, 2, 3, 51, 30, '2025-01-10', '16:00:00', 1, 2, '2024-12-19 09:33:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (31, 267, 8, 3, 38, 25, '2025-01-11', '07:30:00', 1, 2, '2024-12-27 10:40:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (32, 117, 4, 10, 47, 25, '2025-01-11', '08:15:00', 1, 4, '2024-12-26 09:27:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (33, 204, 8, 1, 15, 39, '2025-01-11', '09:40:00', 2, 21, '2025-01-10 10:25:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (34, 169, 3, 6, 2, 10, '2025-01-13', '07:00:00', 1, 5, '2025-01-10 07:14:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (35, 69, 5, 4, 26, 35, '2025-01-13', '09:00:00', 2, 22, '2025-01-08 15:30:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (36, 130, 3, 4, 26, 12, '2025-01-13', '09:30:00', 1, 4, '2025-01-03 13:56:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (37, 281, 4, 10, 57, 17, '2025-01-13', '15:00:00', 1, 23, '2025-01-13 15:38:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (38, 23, 5, 10, 47, 25, '2025-01-13', '15:30:00', 1, 4, '2025-01-09 11:03:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (39, 232, 2, 3, 29, 25, '2025-01-13', '16:00:00', 1, 4, '2024-12-26 14:31:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (40, 92, 2, 6, 52, 30, '2025-01-14', '07:20:00', 1, 5, '2025-01-02 11:15:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (41, 230, 7, 7, 54, 30, '2025-01-14', '08:30:00', 1, 24, '2025-01-14 07:27:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (42, 151, 4, 4, 61, 10, '2025-01-14', '14:25:00', 1, 25, '2025-01-07 12:07:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (43, 49, 13, 4, 61, 25, '2025-01-14', '15:40:00', 1, 26, '2025-01-13 09:25:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (44, 78, 2, 3, 29, 27, '2025-01-14', '15:45:00', 1, 27, '2025-01-02 12:27:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (45, 263, 2, 3, 51, 30, '2025-01-15', '07:00:00', 2, 4, '2025-01-13 16:24:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (46, 100, 17, 1, 49, 24, '2025-01-15', '07:00:00', 2, 21, '2025-01-14 10:03:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (47, 178, 1, 2, 5, 6, '2025-01-15', '07:30:00', 1, 15, '2025-01-02 09:26:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (48, 194, 5, 3, 61, 25, '2025-01-15', '07:45:00', 3, 6, '2024-12-31 08:17:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (49, 118, 3, 4, 26, 34, '2025-01-15', '07:55:00', 2, 28, '2025-01-14 09:15:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (50, 255, 3, 4, 62, 25, '2025-01-15', '08:00:00', 1, 26, '2025-01-03 14:55:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (51, 65, 4, 10, 7, 36, '2025-01-15', '08:10:00', 1, 29, '2025-01-08 10:58:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (52, 183, 4, 1, 15, 3, '2025-01-15', '09:30:00', 1, 30, '2025-01-08 14:18:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (53, 6, 8, 4, 62, 25, '2025-01-15', '16:15:00', 1, 13, '2025-01-07 07:16:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (54, 64, 1, 2, 5, 30, '2025-01-16', '07:00:00', 3, 31, '2025-01-02 11:06:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (55, 45, 2, 3, 38, 25, '2025-01-16', '07:45:00', 1, 4, '2024-12-30 07:29:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (56, 9, 2, 3, 38, 10, '2025-01-16', '10:30:00', 1, 2, '2025-01-02 16:42:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (57, 258, 6, 10, 7, 25, '2025-01-16', '13:40:00', 1, 2, '2025-01-08 17:02:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (58, 257, 1, 4, 47, 25, '2025-01-16', '14:00:00', 1, 32, '2024-12-26 14:14:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (59, 107, 2, 6, 45, 27, '2025-01-16', '15:00:00', 3, 13, '2025-01-15 11:04:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (60, 58, 2, 4, 16, 30, '2025-01-16', '16:00:00', 3, 27, '2024-12-23 15:44:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (61, 21, 2, 8, 42, 31, '2025-01-16', '16:40:00', 1, 27, '2024-12-10 09:05:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (62, 132, 4, 10, 58, 12, '2025-01-17', '09:40:00', 1, 29, '2025-01-16 15:21:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (63, 238, 2, 1, 15, 3, '2025-01-17', '09:50:00', 1, 30, '2025-01-15 15:39:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (64, 47, 2, 3, 29, 27, '2025-01-17', '16:00:00', 1, 30, '2025-01-15 11:17:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (65, 101, 2, 3, 29, 27, '2025-01-17', '16:15:00', 3, 33, '2024-12-26 08:55:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (66, 226, 4, 10, 61, 25, '2025-01-18', '07:30:00', 1, 34, '2025-01-02 09:59:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (67, 139, 4, 10, 61, 25, '2025-01-18', '07:40:00', 1, 6, '2025-01-16 15:47:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (68, 211, 4, 4, 11, 9, '2025-01-18', '08:00:00', 2, 26, '2024-12-28 09:11:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (69, 28, 5, 1, 17, 22, '2025-01-18', '08:15:00', 2, 35, '2025-01-16 15:57:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (70, 241, 5, 4, 47, 10, '2025-01-18', '10:50:00', 1, 4, '2025-01-15 07:35:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (71, 225, 1, 4, 11, 18, '2025-01-18', '11:15:00', 1, 19, '2025-01-17 10:50:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (72, 8, 2, 3, 29, 27, '2025-01-20', '09:00:00', 1, 2, '2025-01-09 10:43:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (73, 206, 5, 1, 18, 37, '2025-01-20', '09:25:00', 2, 17, '2025-01-16 08:53:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (74, 96, 2, 3, 29, 27, '2025-01-20', '10:15:00', 1, 27, '2025-01-02 07:37:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (75, 104, 2, 5, 34, 30, '2025-01-20', '10:20:00', 1, 14, '2025-01-15 16:18:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (76, 80, 1, 1, 15, 37, '2025-01-20', '10:35:00', 2, 26, '2025-01-16 17:03:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (77, 246, 3, 6, 2, 29, '2025-01-20', '00:00:00', 1, 5, '2025-01-18 08:19:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (78, 167, 9, 1, 18, 39, '2025-01-20', '14:15:00', 2, 6, '2025-01-17 08:07:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (79, 155, 3, 1, 48, 17, '2025-01-20', '14:45:00', 1, 23, '2025-01-20 15:31:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (80, 168, 5, 4, 62, 10, '2025-01-20', '15:00:00', 1, 30, '2025-01-03 14:34:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (81, 182, 4, 10, 47, 34, '2025-01-20', '15:20:00', 1, 25, '2025-01-14 14:55:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (82, 34, 5, 3, 3, 7, '2025-01-21', '07:30:00', 3, 36, '2025-01-14 07:44:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (83, 187, 1, 2, 25, 21, '2025-01-21', '08:15:00', 1, 37, '2024-11-29 10:10:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (84, 148, 11, 4, 26, 36, '2025-01-21', '08:15:00', 1, 19, '2025-01-21 07:39:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (85, 181, 2, 1, 20, 37, '2025-01-21', '08:20:00', 2, 18, '2025-01-21 07:53:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (86, 7, 1, 1, 17, 22, '2025-01-21', '09:15:00', 1, 15, '2025-01-08 11:06:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (87, 143, 2, 1, 14, 33, '2025-01-21', '10:00:00', 1, 13, '2025-01-20 08:11:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (88, 268, 3, 4, 62, 10, '2025-01-21', '10:25:00', 1, 22, '2025-01-20 17:55:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (89, 231, 3, 4, 62, 25, '2025-01-21', '10:30:00', 3, 20, '2025-01-20 16:40:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (90, 46, 1, 1, 15, 37, '2025-01-21', '13:40:00', 1, 38, '2025-01-14 14:25:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (91, 29, 4, 10, 47, 25, '2025-01-21', '14:00:00', 3, 2, '2024-12-30 15:56:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (92, 127, 2, 8, 42, 31, '2025-01-21', '17:40:00', 1, 6, '2025-01-13 10:44:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (93, 53, 1, 2, 5, 6, '2025-01-22', '07:30:00', 1, 39, '2025-01-07 12:15:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (94, 136, 1, 1, 20, 39, '2025-01-22', '08:05:00', 2, 21, '2025-01-21 10:10:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (95, 77, 2, 10, 11, 13, '2025-01-22', '08:15:00', 2, 36, '2024-12-27 07:20:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (96, 30, 4, 3, 61, 36, '2025-01-22', '09:50:00', 1, 29, '2025-01-14 09:18:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (97, 163, 2, 1, 15, 3, '2025-01-22', '13:05:00', 1, 38, '2025-01-09 14:18:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (98, 175, 1, 10, 7, 25, '2025-01-22', '13:55:00', 1, 1, '2025-01-22 07:29:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (99, 142, 2, 1, 14, 33, '2025-01-22', '14:00:00', 1, 1, '2025-01-16 17:55:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (100, 205, 3, 1, 18, 39, '2025-01-22', '14:55:00', 1, 13, '2025-01-22 08:34:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (101, 221, 4, 1, 4, 2, '2025-01-23', '06:30:00', 3, 21, '2025-01-02 16:45:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (102, 242, 4, 3, 38, 25, '2025-01-23', '08:30:00', 1, 6, '2024-12-30 09:51:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (103, 114, 4, 4, 61, 25, '2025-01-23', '13:50:00', 3, 13, '2025-01-13 09:46:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (104, 133, 2, 1, 15, 20, '2025-01-23', '14:55:00', 1, 34, '2025-01-21 15:41:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (105, 220, 11, 10, 24, 26, '2025-01-23', '15:00:00', 1, 30, '2025-01-09 14:35:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (106, 10, 4, 1, 18, 3, '2025-01-24', '07:00:00', 1, 18, '2025-01-23 10:34:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (107, 94, 5, 1, 49, 24, '2025-01-24', '08:00:00', 1, 35, '2025-01-23 11:58:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (108, 160, 2, 3, 29, 25, '2025-01-24', '08:30:00', 1, 6, '2025-01-10 07:22:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (109, 156, 2, 1, 20, 24, '2025-01-24', '08:30:00', 2, 18, '2025-01-23 16:44:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (110, 199, 5, 4, 62, 25, '2025-01-24', '09:15:00', 1, 26, '2025-01-09 08:42:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (111, 35, 10, 10, 58, 25, '2025-01-24', '10:10:00', 1, 6, '2025-01-16 11:09:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (112, 147, 9, 1, 18, 39, '2025-01-24', '13:00:00', 2, 27, '2025-01-10 09:20:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (113, 283, 8, 4, 47, 10, '2025-01-24', '13:55:00', 1, 7, '2025-01-22 13:25:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (114, 37, 2, 3, 38, 10, '2025-01-24', '14:10:00', 1, 18, '2025-01-21 16:12:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (115, 244, 2, 10, 58, 25, '2025-01-24', '14:15:00', 1, 30, '2025-01-02 15:10:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (116, 25, 4, 4, 26, 10, '2025-01-25', '07:30:00', 1, 25, '2025-01-17 09:23:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (117, 103, 2, 3, 38, 25, '2025-01-25', '09:00:00', 1, 9, '2025-01-14 09:50:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (118, 222, 5, 1, 20, 39, '2025-01-27', '07:05:00', 2, 21, '2025-01-27 10:42:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (119, 207, 1, 3, 61, 25, '2025-01-27', '15:30:00', 1, 10, '2025-01-14 11:45:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (120, 16, 4, 10, 47, 10, '2025-01-28', '08:55:00', 3, 25, '2025-01-27 11:13:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (121, 218, 8, 4, 62, 25, '2025-01-28', '10:40:00', 1, 28, '2025-01-27 14:25:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (122, 57, 2, 3, 29, 27, '2025-01-28', '10:45:00', 1, 30, '2025-01-27 10:00:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (123, 102, 14, 1, 49, 22, '2025-01-28', '11:30:00', 3, 21, '2025-01-28 07:18:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (124, 61, 3, 4, 61, 25, '2025-01-28', '14:40:00', 1, 26, '2025-01-14 14:27:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (125, 149, 2, 7, 30, 31, '2025-01-28', '15:00:00', 1, 4, '2025-01-28 09:38:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (126, 252, 2, 1, 15, 37, '2025-01-28', '16:30:00', 1, 12, '2025-01-09 17:18:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (127, 111, 13, 10, 7, 25, '2025-01-29', '07:45:00', 1, 26, '2024-12-26 09:06:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (128, 275, 4, 10, 7, 25, '2025-01-29', '08:00:00', 1, 4, '2024-12-27 07:23:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (129, 62, 2, 10, 11, 13, '2025-01-29', '08:30:00', 1, 36, '2025-01-09 11:23:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (130, 125, 2, 4, 56, 25, '2025-01-29', '08:45:00', 1, 27, '2025-01-13 15:24:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (131, 145, 13, 1, 8, 4, '2025-01-29', '10:30:00', 2, 6, '2025-01-14 09:04:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (132, 73, 1, 1, 15, 39, '2025-01-29', '13:45:00', 2, 15, '2025-01-15 08:58:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (133, 97, 2, 7, 30, 31, '2025-01-29', '14:00:00', 1, 6, '2025-01-16 16:53:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (134, 72, 4, 4, 61, 25, '2025-01-29', '14:40:00', 3, 33, '2025-01-29 08:21:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (135, 121, 3, 4, 26, 10, '2025-01-29', '14:40:00', 1, 20, '2024-12-27 15:21:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (136, 146, 2, 4, 16, 30, '2025-01-29', '16:30:00', 1, 2, '2025-01-15 12:35:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (137, 110, 2, 7, 30, 31, '2025-01-30', '13:00:00', 1, 6, '2025-01-29 11:46:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (138, 195, 3, 4, 61, 15, '2025-01-30', '16:35:00', 1, 19, '2025-01-02 11:33:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (139, 264, 2, 1, 15, 3, '2025-01-31', '07:30:00', 1, 21, '2025-01-11 09:18:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (140, 227, 6, 4, 47, 10, '2025-01-31', '07:55:00', 1, 25, '2025-01-15 12:09:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (141, 285, 6, 10, 61, 25, '2025-01-31', '07:55:00', 1, 27, '2025-01-08 08:32:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (142, 280, 2, 1, 8, 4, '2025-01-31', '08:30:00', 1, 13, '2024-12-30 09:29:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (143, 14, 2, 3, 11, 10, '2025-01-31', '10:00:00', 1, 6, '2025-01-31 11:36:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (144, 243, 1, 4, 26, 10, '2025-01-31', '10:00:00', 1, 40, '2025-01-21 16:10:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (145, 266, 2, 5, 43, 27, '2025-01-31', '11:20:00', 3, 14, '2025-01-13 13:29:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (146, 279, 3, 4, 62, 25, '2025-01-31', '13:15:00', 1, 41, '2025-01-23 15:36:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (147, 284, 2, 10, 45, 25, '2025-01-31', '14:00:00', 3, 33, '2025-01-30 14:28:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (148, 209, 5, 1, 15, 3, '2025-01-31', '15:50:00', 2, 21, '2025-01-15 15:18:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (149, 269, 2, 7, 30, 31, '2025-01-31', '17:30:00', 1, 26, '2025-01-30 10:57:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (150, 20, 1, 1, 17, 22, '2025-02-01', '07:30:00', 1, 39, '2025-01-31 10:30:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (151, 219, 11, 1, 15, 20, '2025-02-01', '08:10:00', 3, 9, '2025-01-30 09:19:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (152, 1, 1, 4, 26, 10, '2025-02-01', '08:35:00', 1, 27, '2025-01-29 09:49:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (153, 75, 4, 4, 7, 25, '2025-02-01', '09:00:00', 1, 27, '2025-01-14 16:56:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (154, 91, 13, 10, 7, 25, '2025-02-03', '07:45:00', 3, 4, '2025-01-23 15:40:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (155, 177, 5, 4, 62, 25, '2025-02-03', '07:55:00', 1, 2, '2025-01-21 13:17:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (156, 265, 9, 4, 62, 25, '2025-02-03', '08:25:00', 3, 33, '2025-01-25 09:18:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (157, 256, 5, 1, 13, 16, '2025-02-03', '08:30:00', 1, 36, '2025-01-24 15:25:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (158, 144, 4, 10, 47, 11, '2025-02-03', '09:40:00', 1, 42, '2025-01-28 10:12:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (159, 19, 2, 6, 45, 27, '2025-02-03', '14:15:00', 1, 30, '2025-01-20 11:56:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (160, 22, 2, 1, 4, 2, '2025-02-04', '06:30:00', 1, 2, '2025-01-22 15:06:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (161, 173, 1, 1, 15, 3, '2025-02-04', '06:30:00', 1, 39, '2025-01-27 15:01:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (162, 172, 5, 6, 45, 25, '2025-02-04', '10:45:00', 1, 5, '2025-01-20 13:35:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (163, 17, 1, 1, 15, 37, '2025-02-04', '00:20:00', 2, 31, '2025-01-24 09:55:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (164, 260, 4, 4, 61, 25, '2025-02-04', '15:10:00', 1, 27, '2025-01-23 08:04:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (165, 4, 2, 4, 16, 30, '2025-02-04', '15:50:00', 1, 33, '2025-01-28 13:05:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (166, 135, 4, 10, 7, 10, '2025-02-05', '08:55:00', 1, 20, '2025-01-22 10:07:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (167, 51, 9, 3, 61, 25, '2025-02-05', '10:00:00', 3, 27, '2025-01-20 07:27:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (168, 124, 1, 2, 5, 8, '2025-02-05', '10:30:00', 1, 38, '2025-01-17 16:05:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (169, 66, 2, 10, 7, 25, '2025-02-05', '13:55:00', 1, 27, '2025-01-22 14:50:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (170, 36, 8, 4, 62, 25, '2025-02-05', '14:25:00', 1, 9, '2025-01-27 10:11:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (171, 31, 9, 10, 7, 25, '2025-02-05', '15:40:00', 1, 33, '2025-01-16 11:37:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (172, 259, 1, 1, 17, 23, '2025-02-06', '06:45:00', 1, 39, '2025-01-23 10:14:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (173, 228, 2, 3, 29, 27, '2025-02-06', '09:45:00', 3, 13, '2025-02-05 13:39:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (174, 24, 1, 4, 47, 25, '2025-02-06', '09:45:00', 1, 1, '2025-01-16 16:21:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (175, 164, 4, 10, 58, 25, '2025-02-06', '14:45:00', 1, 26, '2025-01-29 17:52:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (176, 215, 11, 3, 24, 26, '2025-02-06', '15:00:00', 2, 33, '2025-01-20 10:08:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (177, 186, 2, 4, 3, 7, '2025-02-06', '15:10:00', 1, 13, '2025-01-15 08:26:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (178, 214, 2, 10, 7, 25, '2025-02-06', '15:15:00', 1, 33, '2025-01-23 17:57:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (179, 2, 1, 10, 24, 11, '2025-02-06', '15:30:00', 1, 25, '2025-01-15 13:28:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (180, 179, 1, 1, 15, 37, '2025-02-07', '08:45:00', 2, 39, '2025-02-07 08:28:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (181, 126, 3, 10, 24, 12, '2025-02-07', '09:30:00', 1, 42, '2025-01-21 07:18:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (182, 251, 1, 1, 17, 22, '2025-02-07', '10:15:00', 1, 31, '2025-01-21 10:03:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (183, 56, 2, 3, 29, 27, '2025-02-07', '11:00:00', 1, 13, '2025-01-15 14:13:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (184, 106, 1, 1, 15, 37, '2025-02-07', '11:20:00', 2, 31, '2025-01-17 15:58:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (185, 273, 2, 1, 17, 24, '2025-02-07', '14:00:00', 3, 12, '2025-02-07 17:24:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (186, 81, 7, 7, 54, 30, '2025-02-07', '18:00:00', 1, 24, '2025-02-07 15:23:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (187, 253, 3, 4, 7, 25, '2025-02-08', '09:30:00', 1, 33, '2025-02-04 14:27:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (188, 131, 7, 7, 54, 30, '2025-02-08', '15:30:00', 1, 24, '2025-01-22 11:45:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (189, 26, 3, 4, 62, 25, '2025-02-10', '06:50:00', 1, 7, '2025-02-08 09:23:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (190, 88, 1, 1, 4, 2, '2025-02-10', '08:00:00', 1, 39, '2025-01-17 11:02:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (191, 113, 2, 1, 15, 39, '2025-02-10', '08:40:00', 2, 34, '2025-02-07 08:11:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (192, 55, 2, 4, 62, 11, '2025-02-10', '09:55:00', 1, 28, '2025-02-08 09:44:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (193, 119, 3, 10, 24, 10, '2025-02-10', '09:55:00', 1, 25, '2025-02-10 14:54:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (194, 59, 5, 4, 26, 10, '2025-02-10', '15:45:00', 1, 21, '2025-02-07 09:06:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (195, 154, 3, 4, 7, 12, '2025-02-11', '08:25:00', 1, 25, '2025-02-03 15:07:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (196, 79, 2, 6, 45, 27, '2025-02-11', '10:00:00', 1, 13, '2025-02-04 11:27:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (197, 191, 3, 6, 2, 10, '2025-02-11', '10:15:00', 2, 5, '2025-01-22 12:32:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (198, 122, 1, 10, 47, 25, '2025-02-11', '13:30:00', 1, 43, '2025-01-31 11:04:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (199, 141, 2, 5, 34, 30, '2025-02-11', '15:00:00', 1, 14, '2025-01-23 09:28:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (200, 44, 4, 4, 61, 25, '2025-02-11', '15:30:00', 1, 7, '2025-01-31 10:42:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (201, 212, 3, 3, 11, 9, '2025-02-11', '16:00:00', 1, 30, '2025-02-08 08:28:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (202, 38, 1, 1, 15, 39, '2025-02-11', '16:20:00', 1, 39, '2025-01-23 16:20:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (203, 32, 5, 4, 62, 25, '2025-02-12', '07:00:00', 1, 7, '2025-02-11 15:28:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (204, 235, 5, 3, 61, 25, '2025-02-12', '07:25:00', 1, 10, '2025-01-24 12:26:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (205, 274, 3, 4, 62, 25, '2025-02-12', '07:45:00', 1, 6, '2025-02-03 14:14:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (206, 150, 4, 10, 7, 36, '2025-02-12', '08:40:00', 1, 29, '2025-01-24 11:37:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (207, 196, 4, 10, 7, 25, '2025-02-12', '14:10:00', 1, 13, '2025-02-12 10:22:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (208, 202, 2, 10, 46, 27, '2025-02-13', '07:45:00', 1, 4, '2025-02-10 09:29:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (209, 217, 1, 4, 26, 19, '2025-02-13', '10:00:00', 1, 38, '2025-01-16 13:26:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (210, 184, 2, 1, 17, 22, '2025-02-13', '14:00:00', 1, 12, '2025-01-20 09:54:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (211, 198, 2, 3, 29, 25, '2025-02-13', '14:30:00', 1, 2, '2025-01-21 13:34:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (212, 247, 4, 4, 47, 10, '2025-02-13', '16:10:00', 1, 33, '2025-02-06 12:58:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (213, 229, 2, 7, 35, 31, '2025-02-14', '13:00:00', 1, 30, '2025-02-10 10:11:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (214, 105, 2, 9, 28, 27, '2025-02-14', '15:00:00', 1, 6, '2025-02-14 10:37:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (215, 176, 13, 1, 15, 37, '2025-02-14', '15:10:00', 2, 2, '2025-02-06 14:50:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (216, 189, 2, 7, 35, 31, '2025-02-14', '18:00:00', 1, 4, '2025-01-20 14:25:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (217, 70, 2, 3, 38, 25, '2025-02-15', '08:00:00', 1, 4, '2025-02-12 10:35:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (218, 82, 2, 3, 29, 27, '2025-02-15', '09:30:00', 2, 13, '2025-01-22 07:31:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (219, 165, 2, 3, 29, 27, '2025-02-15', '10:00:00', 1, 33, '2025-02-14 10:03:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (220, 129, 3, 4, 16, 30, '2025-02-15', '10:45:00', 1, 6, '2025-01-29 10:40:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (221, 50, 2, 3, 29, 25, '2025-02-17', '08:30:00', 1, 4, '2025-02-12 08:51:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (222, 134, 5, 4, 62, 25, '2025-02-17', '10:10:00', 1, 6, '2025-01-29 15:21:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (223, 245, 1, 1, 15, 37, '2025-02-17', '00:50:00', 2, 39, '2025-01-31 09:46:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (224, 43, 5, 1, 13, 16, '2025-02-17', '14:00:00', 4, 30, '2025-01-31 11:10:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (225, 5, 2, 8, 42, 31, '2025-02-17', '16:30:00', 1, 4, '2025-01-31 09:31:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (226, 152, 2, 3, 29, 27, '2025-02-18', '07:30:00', 3, 6, '2025-02-18 09:54:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (227, 3, 4, 4, 7, 10, '2025-02-18', '09:10:00', 1, 20, '2025-01-27 11:39:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (228, 250, 5, 4, 56, 25, '2025-02-18', '09:30:00', 1, 4, '2025-02-18 10:06:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (229, 128, 9, 7, 54, 30, '2025-02-18', '10:10:00', 4, 24, '2025-01-28 17:48:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (230, 33, 2, 3, 29, 27, '2025-02-18', '13:45:00', 1, 15, '2025-01-27 11:01:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (231, 224, 4, 4, 61, 25, '2025-02-18', '13:50:00', 1, 30, '2025-02-12 09:11:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (232, 95, 2, 7, 9, 31, '2025-02-18', '14:00:00', 1, 13, '2025-02-05 14:34:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (233, 286, 5, 1, 8, 4, '2025-02-18', '15:00:00', 2, 33, '2025-02-04 16:31:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (234, 249, 5, 4, 62, 25, '2025-02-19', '07:00:00', 1, 6, '2025-01-22 08:30:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (235, 170, 1, 3, 38, 38, '2025-02-19', '07:45:00', 1, 44, '2025-01-21 18:01:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (236, 140, 2, 3, 38, 27, '2025-02-19', '09:00:00', 1, 13, '2025-02-14 11:13:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (237, 223, 2, 9, 28, 27, '2025-02-19', '09:45:00', 1, 15, '2025-02-03 09:48:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (238, 115, 1, 1, 15, 3, '2025-02-19', '00:20:00', 1, 15, '2025-01-21 16:34:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (239, 109, 1, 2, 25, 5, '2025-02-19', '13:45:00', 1, 45, '2025-01-27 14:40:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (240, 48, 4, 10, 7, 25, '2025-02-19', '14:00:00', 2, 27, '2025-02-05 14:03:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (241, 52, 8, 1, 13, 16, '2025-02-19', '14:00:00', 1, 35, '2025-02-19 16:31:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (242, 271, 11, 10, 58, 12, '2025-02-19', '16:15:00', 1, 46, '2025-02-06 09:16:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (243, 138, 1, 1, 4, 2, '2025-02-20', '07:00:00', 1, 39, '2025-02-19 17:21:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (244, 40, 1, 3, 11, 13, '2025-02-20', '11:25:00', 1, 19, '2025-01-31 08:13:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (245, 41, 2, 1, 15, 37, '2025-02-20', '14:10:00', 2, 4, '2025-01-28 14:43:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (246, 71, 2, 4, 47, 25, '2025-02-20', '14:45:00', 1, 13, '2025-02-21 06:27:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (247, 158, 1, 1, 20, 39, '2025-02-21', '06:45:00', 1, 34, '2025-02-19 15:00:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (248, 60, 5, 4, 62, 14, '2025-02-21', '07:21:00', 2, 22, '2025-02-20 15:13:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (249, 270, 3, 3, 21, 28, '2025-02-21', '08:00:00', 2, 6, '2025-02-04 15:09:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (250, 42, 1, 1, 15, 32, '2025-02-21', '08:15:00', 1, 47, '2025-02-06 11:47:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (251, 193, 1, 1, 15, 39, '2025-02-21', '08:40:00', 2, 39, '2025-02-13 14:17:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (252, 68, 5, 6, 52, 30, '2025-02-21', '10:00:00', 2, 33, '2025-01-28 08:32:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (253, 87, 2, 3, 51, 30, '2025-02-21', '13:00:00', 2, 33, '2025-01-27 13:38:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (254, 203, 1, 1, 15, 20, '2025-02-21', '13:10:00', 1, 15, '2025-01-30 15:00:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (255, 27, 2, 1, 17, 24, '2025-02-21', '14:45:00', 2, 2, '2025-01-29 10:12:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (256, 216, 1, 10, 58, 25, '2025-02-21', '15:45:00', 1, 12, '2025-02-11 14:01:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (257, 233, 2, 3, 38, 10, '2025-02-21', '16:25:00', 1, 19, '2025-02-11 13:58:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (258, 287, 2, 3, 38, 13, '2025-02-22', '07:00:00', 1, 19, '2025-02-20 09:04:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (259, 18, 4, 4, 47, 10, '2025-02-22', '07:00:00', 1, 22, '2025-02-19 16:47:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (260, 76, 3, 1, 15, 39, '2025-02-22', '09:20:00', 1, 13, '2025-01-24 08:10:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (261, 278, 10, 10, 11, 11, '2025-02-22', '09:40:00', 3, 19, '2025-02-10 15:27:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (262, 123, 11, 4, 26, 12, '2025-02-24', '09:00:00', 1, 6, '2025-01-31 14:44:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (263, 239, 2, 3, 29, 27, '2025-02-24', '09:45:00', 1, 4, '2025-02-10 09:48:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (264, 54, 2, 2, 45, 27, '2025-02-24', '13:30:00', 1, 13, '2025-01-28 14:45:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (265, 166, 8, 3, 61, 25, '2025-02-24', '13:45:00', 2, 26, '2025-02-20 17:43:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (266, 39, 4, 10, 47, 34, '2025-02-24', '15:50:00', 1, 29, '2025-02-05 10:07:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (267, 157, 1, 1, 37, 18, '2025-02-25', '07:30:00', 1, 37, '2025-02-20 10:41:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (268, 120, 4, 4, 56, 25, '2025-02-25', '08:45:00', 1, 20, '2025-01-29 08:22:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (269, 282, 2, 3, 51, 30, '2025-02-25', '13:00:00', 2, 4, '2025-01-24 10:18:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (270, 63, 1, 1, 17, 24, '2025-02-25', '13:30:00', 2, 38, '2025-02-19 09:46:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (271, 277, 1, 3, 44, 34, '2025-02-25', '16:30:00', 1, 26, '2025-02-24 18:59:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (272, 185, 3, 1, 14, 33, '2025-02-26', '07:00:00', 2, 48, '2025-01-24 13:59:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (273, 240, 1, 1, 15, 32, '2025-02-26', '07:30:00', 1, 38, '2025-02-17 12:43:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (274, 108, 2, 9, 28, 27, '2025-02-26', '08:00:00', 4, 49, '2025-02-22 09:09:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (275, 11, 2, 1, 20, 39, '2025-02-26', '09:35:00', 2, 34, '2025-02-24 16:15:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (276, 90, 2, 5, 41, 30, '2025-02-26', '10:20:00', 2, 50, '2025-02-25 09:55:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (277, 261, 16, 4, 26, 36, '2025-02-26', '10:40:00', 2, 28, '2025-02-07 09:30:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (278, 248, 5, 1, 8, 4, '2025-02-26', '13:30:00', 3, 33, '2025-02-18 10:36:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (279, 180, 13, 3, 11, 9, '2025-02-26', '13:30:00', 2, 4, '2025-01-27 10:17:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (280, 190, 1, 1, 17, 24, '2025-02-27', '06:15:00', 3, 15, '2025-02-24 08:45:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (281, 15, 5, 4, 26, 10, '2025-02-27', '07:05:00', 2, 34, '2025-02-18 09:18:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (282, 254, 1, 10, 7, 34, '2025-02-27', '07:50:00', 2, 26, '2025-02-20 10:50:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (283, 192, 2, 9, 28, 27, '2025-02-27', '09:45:00', 2, 6, '2025-01-31 10:11:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (284, 86, 6, 10, 58, 25, '2025-02-27', '13:30:00', 2, 4, '2025-02-19 16:39:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (285, 99, 11, 4, 26, 12, '2025-02-27', '14:55:00', 2, 13, '2025-02-05 09:31:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (286, 161, 1, 2, 5, 6, '2025-02-28', '07:00:00', 2, 44, '2025-02-22 11:23:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (287, 67, 3, 10, 58, 12, '2025-02-28', '10:45:00', 2, 29, '2025-02-01 09:12:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (288, 98, 1, 1, 17, 24, '2025-02-28', '15:45:00', 2, 12, '2025-02-20 17:43:00');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (291, 34, 7, 4, 34, 25, '2025-03-05', '15:10:00', 1, 2, '2025-03-06 01:39:08.078917');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (289, 85, 2, 4, 15, 30, '2025-03-05', '08:30:00', 1, 2, '2025-03-06 01:57:14.864711');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (290, 85, 9, 4, 16, 27, '2025-03-05', '08:40:00', 2, 2, '2025-03-06 01:57:14.864711');
INSERT INTO "William Uribe".citas (id, pacientes_id, convenios_id, consultorios_id, profesionales_id, tipos_citas_id, fecha_cita, hora_cita, est_cita_id, usuarios_id, fecha_reg) VALUES (292, 28, 9, 4, 9, 3, '2025-02-20', '10:00:00', 2, 4, '2025-03-07 23:08:47.613037');


--
-- TOC entry 3640 (class 0 OID 1654785)
-- Dependencies: 258
-- Data for Name: consultorios; Type: TABLE DATA; Schema: William Uribe; Owner: Comfe_owner
--

INSERT INTO "William Uribe".consultorios (id, nombre_consultorio) VALUES (1, 'COTA');
INSERT INTO "William Uribe".consultorios (id, nombre_consultorio) VALUES (2, 'MODULO 7');
INSERT INTO "William Uribe".consultorios (id, nombre_consultorio) VALUES (3, 'GLAUCOMA');
INSERT INTO "William Uribe".consultorios (id, nombre_consultorio) VALUES (4, 'SEDE INTERNACIONAL');
INSERT INTO "William Uribe".consultorios (id, nombre_consultorio) VALUES (5, 'BARRANCABERMEJA');
INSERT INTO "William Uribe".consultorios (id, nombre_consultorio) VALUES (6, 'SAN GIL');
INSERT INTO "William Uribe".consultorios (id, nombre_consultorio) VALUES (7, 'CACIQUE');
INSERT INTO "William Uribe".consultorios (id, nombre_consultorio) VALUES (8, 'PIEDECUESTA');
INSERT INTO "William Uribe".consultorios (id, nombre_consultorio) VALUES (9, 'MODULO 50');
INSERT INTO "William Uribe".consultorios (id, nombre_consultorio) VALUES (10, 'PISO 9');
INSERT INTO "William Uribe".consultorios (id, nombre_consultorio) VALUES (11, 'SAN ALONSO');


--
-- TOC entry 3634 (class 0 OID 1630342)
-- Dependencies: 226
-- Data for Name: convenios; Type: TABLE DATA; Schema: William Uribe; Owner: Comfe_owner
--

INSERT INTO "William Uribe".convenios (id, nom_convenio) VALUES (1, 'PGP OFTALMOFOS');
INSERT INTO "William Uribe".convenios (id, nom_convenio) VALUES (2, 'FOSCAL');
INSERT INTO "William Uribe".convenios (id, nom_convenio) VALUES (3, 'PARTICULAR');
INSERT INTO "William Uribe".convenios (id, nom_convenio) VALUES (4, 'PLAN SIGLO 21');
INSERT INTO "William Uribe".convenios (id, nom_convenio) VALUES (5, 'ECOPETROL');
INSERT INTO "William Uribe".convenios (id, nom_convenio) VALUES (6, 'AXA COLPATRIA MP');
INSERT INTO "William Uribe".convenios (id, nom_convenio) VALUES (7, 'VIOPTICA PP');
INSERT INTO "William Uribe".convenios (id, nom_convenio) VALUES (8, 'COLSANITAS');
INSERT INTO "William Uribe".convenios (id, nom_convenio) VALUES (9, 'SURAMERICANA');
INSERT INTO "William Uribe".convenios (id, nom_convenio) VALUES (10, 'ALLIANZ SEGUROS D...');
INSERT INTO "William Uribe".convenios (id, nom_convenio) VALUES (11, 'PROGRAMA SOCIAL V...');
INSERT INTO "William Uribe".convenios (id, nom_convenio) VALUES (12, 'MEDPLUS MP');
INSERT INTO "William Uribe".convenios (id, nom_convenio) VALUES (13, 'COLMEDICA MP');
INSERT INTO "William Uribe".convenios (id, nom_convenio) VALUES (14, 'COOMEVA MP');
INSERT INTO "William Uribe".convenios (id, nom_convenio) VALUES (15, 'FONDEKIKES');
INSERT INTO "William Uribe".convenios (id, nom_convenio) VALUES (16, 'COLPATRIA SEGUROS...');
INSERT INTO "William Uribe".convenios (id, nom_convenio) VALUES (17, 'SEGUROS BOLIVAR');
INSERT INTO "William Uribe".convenios (id, nom_convenio) VALUES (18, 'COMFENALCO');
INSERT INTO "William Uribe".convenios (id, nom_convenio) VALUES (19, 'UT RED INTEGRADA ...');
INSERT INTO "William Uribe".convenios (id, nom_convenio) VALUES (20, 'CAFABA');
INSERT INTO "William Uribe".convenios (id, nom_convenio) VALUES (21, 'HDI SEGUROS COLOM...');
INSERT INTO "William Uribe".convenios (id, nom_convenio) VALUES (22, 'MAPFRE');
INSERT INTO "William Uribe".convenios (id, nom_convenio) VALUES (23, 'CEDCO');
INSERT INTO "William Uribe".convenios (id, nom_convenio) VALUES (24, 'SINTRAELECOL BARB...');
INSERT INTO "William Uribe".convenios (id, nom_convenio) VALUES (25, 'EMPLEADOS');
INSERT INTO "William Uribe".convenios (id, nom_convenio) VALUES (26, 'HDI SEGUROS DE VI...');
INSERT INTO "William Uribe".convenios (id, nom_convenio) VALUES (27, 'UNIVERSIDAD INDUS...');
INSERT INTO "William Uribe".convenios (id, nom_convenio) VALUES (28, 'BMI SEGUROS DE VI...');
INSERT INTO "William Uribe".convenios (id, nom_convenio) VALUES (29, 'MAGISTERIO');


--
-- TOC entry 3630 (class 0 OID 1630274)
-- Dependencies: 222
-- Data for Name: departamentos; Type: TABLE DATA; Schema: William Uribe; Owner: Comfe_owner
--

INSERT INTO "William Uribe".departamentos (id, nom_dpto) VALUES (1, 'BOGOTA D.C.');
INSERT INTO "William Uribe".departamentos (id, nom_dpto) VALUES (2, 'ANTIOQUIA');
INSERT INTO "William Uribe".departamentos (id, nom_dpto) VALUES (3, 'ATLANTICO');
INSERT INTO "William Uribe".departamentos (id, nom_dpto) VALUES (4, 'BOLIVAR');
INSERT INTO "William Uribe".departamentos (id, nom_dpto) VALUES (5, 'BOYACA');
INSERT INTO "William Uribe".departamentos (id, nom_dpto) VALUES (6, 'CALDAS');
INSERT INTO "William Uribe".departamentos (id, nom_dpto) VALUES (7, 'CAQUETA');
INSERT INTO "William Uribe".departamentos (id, nom_dpto) VALUES (8, 'CASANARE');
INSERT INTO "William Uribe".departamentos (id, nom_dpto) VALUES (9, 'CAUCA');
INSERT INTO "William Uribe".departamentos (id, nom_dpto) VALUES (10, 'CESAR');
INSERT INTO "William Uribe".departamentos (id, nom_dpto) VALUES (11, 'CHOCO');
INSERT INTO "William Uribe".departamentos (id, nom_dpto) VALUES (12, 'CORDOBA');
INSERT INTO "William Uribe".departamentos (id, nom_dpto) VALUES (13, 'CUNDINAMARCA');
INSERT INTO "William Uribe".departamentos (id, nom_dpto) VALUES (14, 'GUAINIA');
INSERT INTO "William Uribe".departamentos (id, nom_dpto) VALUES (15, 'GUAVIARE');
INSERT INTO "William Uribe".departamentos (id, nom_dpto) VALUES (16, 'HUILA');
INSERT INTO "William Uribe".departamentos (id, nom_dpto) VALUES (17, 'LA GUAJIRA');
INSERT INTO "William Uribe".departamentos (id, nom_dpto) VALUES (18, 'MAGDALENA');
INSERT INTO "William Uribe".departamentos (id, nom_dpto) VALUES (19, 'META');
INSERT INTO "William Uribe".departamentos (id, nom_dpto) VALUES (20, 'NARIÑO');
INSERT INTO "William Uribe".departamentos (id, nom_dpto) VALUES (21, 'NORTE DE SANTANDER');
INSERT INTO "William Uribe".departamentos (id, nom_dpto) VALUES (22, 'PUTUMAYO');
INSERT INTO "William Uribe".departamentos (id, nom_dpto) VALUES (23, 'QUINDIO');
INSERT INTO "William Uribe".departamentos (id, nom_dpto) VALUES (24, 'RISARALDA');
INSERT INTO "William Uribe".departamentos (id, nom_dpto) VALUES (25, 'SAN ANDRES Y PROVIDENCIA');
INSERT INTO "William Uribe".departamentos (id, nom_dpto) VALUES (26, 'SANTANDER');
INSERT INTO "William Uribe".departamentos (id, nom_dpto) VALUES (27, 'SUCRE');
INSERT INTO "William Uribe".departamentos (id, nom_dpto) VALUES (28, 'TOLIMA');
INSERT INTO "William Uribe".departamentos (id, nom_dpto) VALUES (29, 'VALLE DEL CAUCA');
INSERT INTO "William Uribe".departamentos (id, nom_dpto) VALUES (30, 'VAUPES');
INSERT INTO "William Uribe".departamentos (id, nom_dpto) VALUES (31, 'VICHADA');
INSERT INTO "William Uribe".departamentos (id, nom_dpto) VALUES (32, 'ARAUCA');
INSERT INTO "William Uribe".departamentos (id, nom_dpto) VALUES (33, 'AMAZONAS');
INSERT INTO "William Uribe".departamentos (id, nom_dpto) VALUES (34, 'EXTRANJERO');


--
-- TOC entry 3644 (class 0 OID 1736705)
-- Dependencies: 288
-- Data for Name: est_cita; Type: TABLE DATA; Schema: William Uribe; Owner: Comfe_owner
--

INSERT INTO "William Uribe".est_cita (id, estado) VALUES (1, 'ATENDIDA');
INSERT INTO "William Uribe".est_cita (id, estado) VALUES (2, 'REPROGRAMADA');
INSERT INTO "William Uribe".est_cita (id, estado) VALUES (3, 'NO ASISTE');
INSERT INTO "William Uribe".est_cita (id, estado) VALUES (4, 'CANCELADA');
INSERT INTO "William Uribe".est_cita (id, estado) VALUES (5, 'EN ATENCION');


--
-- TOC entry 3632 (class 0 OID 1630335)
-- Dependencies: 224
-- Data for Name: municipios; Type: TABLE DATA; Schema: William Uribe; Owner: Comfe_owner
--

INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1120, 34, 'EXTRANJERO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1, 1, 'BOGOTA D.C.');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (2, 2, 'ABEJORRAL');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (3, 2, 'ABRIAQUI');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (4, 2, 'ALEJANDRIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (5, 2, 'AMAGA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (6, 2, 'AMALFI');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (7, 2, 'ANDES');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (8, 2, 'ANGELOPOLIS');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (9, 2, 'ANGOSTURA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (10, 2, 'ANORI');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (11, 2, 'ANZA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (12, 2, 'APARTADO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (13, 2, 'ARBOLETES');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (14, 2, 'ARGELIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (15, 2, 'ARMENIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (16, 2, 'BARBOSA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (17, 2, 'BELLO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (18, 2, 'BELMIRA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (19, 2, 'BETANIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (20, 2, 'BETULIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (21, 2, 'BRICENO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (22, 2, 'BURITICA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (23, 2, 'CACERES');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (24, 2, 'CAICEDO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (25, 2, 'CALDAS');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (26, 2, 'CAMPAMENTO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (27, 2, 'CANASGORDAS');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (28, 2, 'CARACOLI');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (29, 2, 'CARAMANTA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (30, 2, 'CAREPA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (31, 2, 'CARMEN DE VIBORAL');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (32, 2, 'CAROLINA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (33, 2, 'CAUCASIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (34, 2, 'CHIGORODO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (35, 2, 'CISNEROS');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (36, 2, 'CIUDAD BOLIVAR');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (37, 2, 'COCORNA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (38, 2, 'CONCEPCION');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (39, 2, 'CONCORDIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (40, 2, 'COPACABANA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (41, 2, 'DABEIBA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (42, 2, 'DON MATIAS');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (43, 2, 'EBEJICO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (44, 2, 'EL BAGRE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (45, 2, 'ENTRERRIOS');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (46, 2, 'ENVIGADO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (47, 2, 'FREDONIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (48, 2, 'FRONTINO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (49, 2, 'GIRALDO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (50, 2, 'GIRARDOTA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (51, 2, 'GOMEZ PLATA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (52, 2, 'GRANADA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (53, 2, 'GUADALUPE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (54, 2, 'GUARNE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (55, 2, 'GUATAPE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (56, 2, 'HELICONIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (57, 2, 'HISPANIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (58, 2, 'ITAGUI');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (59, 2, 'ITUANGO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (60, 2, 'JARDIN');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (61, 2, 'JERICO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (62, 2, 'LA CEJA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (63, 2, 'LA ESTRELLA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (64, 2, 'LA PINTADA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (65, 2, 'LA UNION');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (66, 2, 'LIBORINA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (67, 2, 'MACEO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (68, 2, 'MARINILLA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (69, 2, 'MEDELLIN');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (70, 2, 'MONTEBELLO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (71, 2, 'MURINDO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (72, 2, 'MUTATA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (73, 2, 'NARINO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (74, 2, 'NECHI');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (75, 2, 'NECOCLI');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (76, 2, 'OLAYA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (77, 2, 'PENOL');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (78, 2, 'PEQUE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (79, 2, 'PUEBLORRICO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (80, 2, 'PUERTO BERRIO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (81, 2, 'PUERTO NARE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (82, 2, 'PUERTO TRIUNFO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (83, 2, 'REMEDIOS');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (84, 2, 'RETIRO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (85, 2, 'RIONEGRO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (86, 2, 'SABANALARGA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (87, 2, 'SABANETA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (88, 2, 'SALGAR');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (89, 2, 'SAN ANDRES');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (90, 2, 'SAN CARLOS');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (91, 2, 'SAN FRANCISCO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (92, 2, 'SAN JERONIMO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (93, 2, 'SAN JOSE DE LA MONTANA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (94, 2, 'SAN JUAN DE URABA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (95, 2, 'SAN LUIS');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (96, 2, 'SAN PEDRO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (97, 2, 'SAN PEDRO DE URABA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (98, 2, 'SAN RAFAEL');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (99, 2, 'SAN ROQUE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (100, 2, 'SAN VICENTE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (101, 2, 'SANTA BARBARA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (102, 2, 'SANTA ROSA DE OSOS');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (103, 2, 'SANTAFE DE ANTIOQUIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (104, 2, 'SANTO DOMINGO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (105, 2, 'SANTUARIO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (106, 2, 'SEGOVIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (107, 2, 'SONSON');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (108, 2, 'SOPETRAN');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (109, 2, 'TAMESIS');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (110, 2, 'TARAZA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (111, 2, 'TARSO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (112, 2, 'TITIRIBI');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (113, 2, 'TOLEDO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (114, 2, 'TURBO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (115, 2, 'URAMITA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (116, 2, 'URRAO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (117, 2, 'VALDIVIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (118, 2, 'VALPARAISO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (119, 2, 'VEGACHI');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (120, 2, 'VENECIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (121, 2, 'VIGIA DEL FUERTE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (122, 2, 'YALI');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (123, 2, 'YARUMAL');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (124, 2, 'YOLOMBO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (125, 2, 'YONDO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (126, 2, 'ZARAGOZA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (127, 3, 'BARANOA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (128, 3, 'BARRANQUILLA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (129, 3, 'CAMPO DE LA CRUZ');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (130, 3, 'CANDELARIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (131, 3, 'GALAPA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (132, 3, 'JUAN DE ACOSTA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (133, 3, 'LURUACO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (134, 3, 'MALAMBO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (135, 3, 'MANATI');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (136, 3, 'PALMAR DE VARELA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (137, 3, 'PIOJO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (138, 3, 'POLONUEVO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (139, 3, 'PONEDERA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (140, 3, 'PUERTO COLOMBIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (141, 3, 'REPELON');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (142, 3, 'SABANAGRANDE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (143, 3, 'SABANALARGA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (144, 3, 'SANTA LUCIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (145, 3, 'SANTO TOMAS');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (146, 3, 'SOLEDAD');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (147, 3, 'SUAN');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (148, 3, 'TUBARA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (149, 3, 'USIACURI');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (150, 4, 'ACHI');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (151, 4, 'ALTOS DEL ROSARIO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (152, 4, 'ARENAL');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (153, 4, 'ARJONA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (154, 4, 'ARROYOHONDO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (155, 4, 'BARRANCO DE LOBA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (156, 4, 'CALAMAR');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (157, 4, 'CANTAGALLO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (158, 4, 'CARMEN DE BOLIVAR');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (159, 4, 'CARTAGENA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (160, 4, 'CICUCO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (161, 4, 'CLEMENCIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (162, 4, 'CORDOBA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (163, 4, 'EL GUAMO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (164, 4, 'EL PENON');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (165, 4, 'HATILLO DE LOBA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (166, 4, 'MAGANGUE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (167, 4, 'MAHATES');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (168, 4, 'MARGARITA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (169, 4, 'MARIA LA BAJA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (170, 4, 'MOMPOS');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (171, 4, 'MONTECRISTO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (172, 4, 'MORALES');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (173, 4, 'PINILLOS');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (174, 4, 'REGIDOR');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (175, 4, 'RIO VIEJO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (176, 4, 'SAN CRISTOBAL');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (177, 4, 'SAN ESTANISLAO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (178, 4, 'SAN FERNANDO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (179, 4, 'SAN JACINTO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (180, 4, 'SAN JACINTO DEL CAUCA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (181, 4, 'SAN JUAN NEPOMUCENO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (182, 4, 'SAN MARTIN DE LOBA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (183, 4, 'SAN PABLO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (184, 4, 'SANTA CATALINA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (185, 4, 'SANTA ROSA DE LIMA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (186, 4, 'SANTA ROSA DEL SUR');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (187, 4, 'SIMITI');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (188, 4, 'SOPLAVIENTO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (189, 4, 'TALAIGUA NUEVO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (190, 4, 'TIQUISIO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (191, 4, 'TURBACO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (192, 4, 'TURBANA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (193, 4, 'VILLANUEVA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (194, 4, 'ZAMBRANO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (195, 5, 'ALMEIDA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (196, 5, 'AQUITANIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (197, 5, 'ARCABUCO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (198, 5, 'BELEN');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (199, 5, 'BERBEO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (200, 5, 'BETEITIVA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (201, 5, 'BOAVITA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (202, 5, 'BOYACA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (203, 5, 'BRICENO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (204, 5, 'BUENAVISTA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (205, 5, 'BUSBANZA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (206, 5, 'CALDAS');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (207, 5, 'CAMPOHERMOSO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (208, 5, 'CERINZA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (209, 5, 'CHINAVITA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (210, 5, 'CHIQUINQUIRA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (211, 5, 'CHIQUIZA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (212, 5, 'CHISCAS');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (213, 5, 'CHITA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (214, 5, 'CHITARAQUE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (215, 5, 'CHIVATA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (216, 5, 'CHIVOR');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (217, 5, 'CIENEGA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (218, 5, 'COMBITA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (219, 5, 'COPER');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (220, 5, 'CORRALES');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (221, 5, 'COVARACHIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (222, 5, 'CUBARA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (223, 5, 'CUCAITA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (224, 5, 'CUITIVA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (225, 5, 'DUITAMA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (226, 5, 'EL COCUY');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (227, 5, 'EL ESPINO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (228, 5, 'FIRAVITOBA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (229, 5, 'FLORESTA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (230, 5, 'GACHANTIVA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (231, 5, 'GAMEZA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (232, 5, 'GARAGOA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (233, 5, 'GUACAMAYAS');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (234, 5, 'GUATEQUE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (235, 5, 'GUAYATA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (236, 5, 'GUICAN');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (237, 5, 'IZA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (238, 5, 'JENESANO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (239, 5, 'JERICO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (240, 5, 'LA CAPILLA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (241, 5, 'LA UVITA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (242, 5, 'LA VICTORIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (243, 5, 'LABRANZAGRANDE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (244, 5, 'MACANAL');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (245, 5, 'MARIPI');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (246, 5, 'MIRAFLORES');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (247, 5, 'MONGUA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (248, 5, 'MONGUI');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (249, 5, 'MONIQUIRA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (250, 5, 'MOTAVITA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (251, 5, 'MUZO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (252, 5, 'NOBSA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (253, 5, 'NUEVO COLON');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (254, 5, 'OICATA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (255, 5, 'OTANCHE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (256, 5, 'PACHAVITA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (257, 5, 'PAEZ');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (258, 5, 'PAIPA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (259, 5, 'PAJARITO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (260, 5, 'PANQUEBA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (261, 5, 'PAUNA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (262, 5, 'PAYA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (263, 5, 'PAZ DE RIO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (264, 5, 'PESCA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (265, 5, 'PISBA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (266, 5, 'PUERTO BOYACA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (267, 5, 'QUIPAMA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (268, 5, 'RAMIRIQUI');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (269, 5, 'RAQUIRA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (270, 5, 'RONDON');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (271, 5, 'SABOYA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (272, 5, 'SACHICA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (273, 5, 'SAMACA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (274, 5, 'SAN EDUARDO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (275, 5, 'SAN JOSE DE PARE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (276, 5, 'SAN LUIS DE GACENO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (277, 5, 'SAN MATEO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (278, 5, 'SAN MIGUEL DE SEMA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (279, 5, 'SAN PABLO BORBUR');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (280, 5, 'SAN ROSA VITERBO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (281, 5, 'SANTA MARIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (282, 5, 'SANTA SOFIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (283, 5, 'SANTANA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (284, 5, 'SATIVANORTE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (285, 5, 'SATIVASUR');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (286, 5, 'SIACHOQUE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (287, 5, 'SOATA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (288, 5, 'SOCHA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (289, 5, 'SOCOTA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (290, 5, 'SOGAMOSO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (291, 5, 'SOMONDOCO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (292, 5, 'SORA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (293, 5, 'SORACA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (294, 5, 'SOTAQUIRA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (295, 5, 'SUSACON');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (296, 5, 'SUTAMARCHAN');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (297, 5, 'SUTATENZA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (298, 5, 'TASCO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (299, 5, 'TENZA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (300, 5, 'TIBANA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (301, 5, 'TIBASOSA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (302, 5, 'TINJACA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (303, 5, 'TIPACOQUE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (304, 5, 'TOCA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (305, 5, 'TOGUI');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (306, 5, 'TOPAGA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (307, 5, 'TOTA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (308, 5, 'TUNJA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (309, 5, 'TUNUNGUA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (310, 5, 'TURMEQUE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (311, 5, 'TUTA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (312, 5, 'TUTAZA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (313, 5, 'UMBITA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (314, 5, 'VENTAQUEMADA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (315, 5, 'VILLA DE LEYVA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (316, 5, 'VIRACACHA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (317, 5, 'ZETAQUIRA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (318, 6, 'AGUADAS');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (319, 6, 'ANSERMA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (320, 6, 'ARANZAZU');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (321, 6, 'BELALCAZAR');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (322, 6, 'CHINCHINA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (323, 6, 'FILADELFIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (324, 6, 'LA DORADA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (325, 6, 'LA MERCED');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (326, 6, 'MANIZALES');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (327, 6, 'MANZANARES');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (328, 6, 'MARMATO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (329, 6, 'MARQUETALIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (330, 6, 'MARULANDA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (331, 6, 'NEIRA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (332, 6, 'NORCASIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (333, 6, 'PACORA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (334, 6, 'PALESTINA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (335, 6, 'PENSILVANIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (336, 6, 'RIOSUCIO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (337, 6, 'RISARALDA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (338, 6, 'SALAMINA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (339, 6, 'SAMANA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (340, 6, 'SAN JOSE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (341, 6, 'SUPIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (342, 6, 'VICTORIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (343, 6, 'VILLAMARIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (344, 6, 'VITERBO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (345, 7, 'ALBANIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (346, 7, 'BELEN DE LOS ANDAQUIES');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (347, 7, 'CARTAGENA DEL CHAIRA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (348, 7, 'CURRILLO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (349, 7, 'EL DONCELLO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (350, 7, 'EL PAUJIL');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (351, 7, 'FLORENCIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (352, 7, 'LA MONTANITA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (353, 7, 'MILAN');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (354, 7, 'MORELIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (355, 7, 'PUERTO RICO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (356, 7, 'SAN JOSE DEL FRAGUA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (357, 7, 'SAN VICENTE DEL CAGUAN');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (358, 7, 'SOLANO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (359, 7, 'SOLITA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (360, 7, 'VALPARAISO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (361, 8, 'AGUAZUL');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (362, 8, 'CHAMEZA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (363, 8, 'HATO COROZAL');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (364, 8, 'LA SALINA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (365, 8, 'MANI');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (366, 8, 'MONTERREY');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (367, 8, 'NUNCHIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (368, 8, 'OROCUE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (369, 8, 'PAZ DE ARIPORO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (370, 8, 'PORE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (371, 8, 'RECETOR');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (372, 8, 'SABANALARGA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (373, 8, 'SACAMA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (374, 8, 'SAN LUIS DE PALENQUE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (375, 8, 'TAMARA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (376, 8, 'TAURAMENA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (377, 8, 'TRINIDAD');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (378, 8, 'VILLANUEVA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (379, 8, 'YOPAL');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (380, 9, 'ALMAGUER');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (381, 9, 'ARGELIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (382, 9, 'BALBOA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (383, 9, 'BOLIVAR');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (384, 9, 'BUENOS AIRES');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (385, 9, 'CAJIBIO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (386, 9, 'CALDONO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (387, 9, 'CALOTO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (388, 9, 'CORINTO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (389, 9, 'EL TAMBO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (390, 9, 'FLORENCIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (391, 9, 'GUAPI');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (392, 9, 'INZA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (393, 9, 'JAMBALO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (394, 9, 'LA SIERRA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (395, 9, 'LA VEGA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (396, 9, 'LOPEZ');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (397, 9, 'MERCADERES');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (398, 9, 'MIRANDA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (399, 9, 'MORALES');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (400, 9, 'PADILLA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (401, 9, 'PAEZ');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (402, 9, 'PATIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (403, 9, 'PIAMONTE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (404, 9, 'PIENDAMO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (405, 9, 'POPAYAN');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (406, 9, 'PUERTO TEJADA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (407, 9, 'PURACE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (408, 9, 'ROSAS');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (409, 9, 'SAN SEBASTIAN');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (410, 9, 'SANTA ROSA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (411, 9, 'SANTANDER DE QUILICHAO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (412, 9, 'SILVIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (413, 9, 'SOTARA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (414, 9, 'SUAREZ');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (415, 9, 'SUCRE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (416, 9, 'TIMBIO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (417, 9, 'TIMBIQUI');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (418, 9, 'TORIBIO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (419, 9, 'TOTORO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (420, 9, 'VILLA RICA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (421, 10, 'AGUACHICA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (422, 10, 'AGUSTIN CODAZZI');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (423, 10, 'ASTREA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (424, 10, 'BECERRIL');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (425, 10, 'BOSCONIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (426, 10, 'CHIMICHAGUA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (427, 10, 'CHIRIGUANA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (428, 10, 'CURUMANI');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (429, 10, 'EL COPEY');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (430, 10, 'EL PASO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (431, 10, 'GAMARRA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (432, 10, 'GONZALEZ');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (433, 10, 'LA GLORIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (434, 10, 'LA JAGUA DE IBIRICO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (435, 10, 'LA PAZ');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (436, 10, 'MANAURE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (437, 10, 'PAILITAS');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (438, 10, 'PELAYA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (439, 10, 'PUEBLO BELLO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (440, 10, 'RIO DE ORO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (441, 10, 'SAN ALBERTO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (442, 10, 'SAN DIEGO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (443, 10, 'SAN MARTIN');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (444, 10, 'TAMALAMEQUE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (445, 10, 'VALLEDUPAR');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (446, 11, 'ACANDI');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (447, 11, 'ALTO BAUDO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (448, 11, 'ATRATO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (449, 11, 'BAGADO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (450, 11, 'BAHIA SOLANO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (451, 11, 'BAJO BAUDO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (452, 11, 'BELEN DE BAJIRA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (453, 11, 'BOJAYA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (454, 11, 'CANTON DE SAN PABLO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (455, 11, 'CARMEN DEL DARIEN');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (456, 11, 'CERTEGUI');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (457, 11, 'CONDOTO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (458, 11, 'EL CARMEN DE ATRATO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (459, 11, 'EL LITORAL DEL SAN JUAN');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (460, 11, 'ITSMINA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (461, 11, 'JURADO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (462, 11, 'LLORO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (463, 11, 'MEDIO ATRATO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (464, 11, 'MEDIO BAUDO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (465, 11, 'MEDIO SAN JUAN');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (466, 11, 'NOVITA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (467, 11, 'NUQUI');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (468, 11, 'QUIBDO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (469, 11, 'RIO FRIO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (470, 11, 'RIO QUITO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (471, 11, 'RIOSUCIO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (472, 11, 'SAN JOSE DEL PALMAR');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (473, 11, 'SIPI');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (474, 11, 'TADO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (475, 11, 'UNGUIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (476, 11, 'UNION PANAMERICANA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (477, 12, 'AYAPEL');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (478, 12, 'BUENAVISTA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (479, 12, 'CANALETE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (480, 12, 'CERETE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (481, 12, 'CHIMA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (482, 12, 'CHINU');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (483, 12, 'CIENAGA DE ORO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (484, 12, 'COTORRA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (485, 12, 'LA APARTADA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (486, 12, 'LORICA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (487, 12, 'LOS CORDOBAS');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (488, 12, 'MOMIL');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (489, 12, 'MONTELIBANO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (490, 12, 'MONTERIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (491, 12, 'MONITOS');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (492, 12, 'PLANETA RICA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (493, 12, 'PUEBLO NUEVO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (494, 12, 'PUERTO ESCONDIDO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (495, 12, 'PUERTO LIBERTADOR');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (496, 12, 'PURISIMA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (497, 12, 'SAHAGUN');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (498, 12, 'SAN ANDRES SOTAVENTO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (499, 12, 'SAN ANTERO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (500, 12, 'SAN BERNARDO DEL VIENTO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (501, 12, 'SAN CARLOS');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (502, 12, 'SAN PELAYO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (503, 12, 'TIERRALTA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (504, 12, 'VALENCIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (505, 13, 'AGUA DE DIOS');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (506, 13, 'ALBAN');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (507, 13, 'ANAPOIMA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (508, 13, 'ANOLAIMA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (509, 13, 'APULO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (510, 13, 'ARBELAEZ');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (511, 13, 'BELTRAN');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (512, 13, 'BITUIMA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (513, 13, 'BOJACA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (514, 13, 'CABRERA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (515, 13, 'CACHIPAY');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (516, 13, 'CAJICA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (517, 13, 'CAPARRAPI');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (518, 13, 'CAQUEZA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (519, 13, 'CARMEN DE CARUPA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (520, 13, 'CHAGUANI');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (521, 13, 'CHIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (522, 13, 'CHIPAQUE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (523, 13, 'CHOACHI');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (524, 13, 'CHOCONTA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (525, 13, 'COGUA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (526, 13, 'COTA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (527, 13, 'CUCUNUBA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (528, 13, 'EL COLEGIO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (529, 13, 'EL PENON');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (530, 13, 'EL ROSAL');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (531, 13, 'FACATATIVA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (532, 13, 'FOMEQUE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (533, 13, 'FOSCA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (534, 13, 'FUNZA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (535, 13, 'FUQUENE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (536, 13, 'FUSAGASUGA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (537, 13, 'GACHALA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (538, 13, 'GACHANCIPA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (539, 13, 'GACHETA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (540, 13, 'GAMA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (541, 13, 'GIRARDOT');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (542, 13, 'GRANADA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (543, 13, 'GUACHETA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (544, 13, 'GUADUAS');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (545, 13, 'GUASCA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (546, 13, 'GUATAQUI');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (547, 13, 'GUATAVITA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (548, 13, 'GUAYABAL DE SIQUIMA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (549, 13, 'GUAYABETAL');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (550, 13, 'GUTIERREZ');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (551, 13, 'JERUSALEN');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (552, 13, 'JUNIN');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (553, 13, 'LA CALERA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (554, 13, 'LA MESA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (555, 13, 'LA PALMA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (556, 13, 'LA PENA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (557, 13, 'LA VEGA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (558, 13, 'LENGUAZAQUE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (559, 13, 'MACHETA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (560, 13, 'MADRID');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (561, 13, 'MANTA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (562, 13, 'MEDINA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (563, 13, 'MOSQUERA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (564, 13, 'NARINO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (565, 13, 'NEMOCON');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (566, 13, 'NILO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (567, 13, 'NIMAIMA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (568, 13, 'NOCAIMA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (569, 13, 'PACHO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (570, 13, 'PAIME');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (571, 13, 'PANDI');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (572, 13, 'PARATEBUENO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (573, 13, 'PASCA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (574, 13, 'PUERTO SALGAR');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (575, 13, 'PULI');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (576, 13, 'QUEBRADANEGRA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (577, 13, 'QUETAME');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (578, 13, 'QUIPILE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (579, 13, 'RICAURTE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (580, 13, 'SAN ANTONIO DE TEQUENDAMA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (581, 13, 'SAN BERNARDO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (582, 13, 'SAN CAYETANO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (583, 13, 'SAN FRANCISCO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (584, 13, 'SAN JUAN DE RIO SECO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (585, 13, 'SASAIMA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (586, 13, 'SESQUILE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (587, 13, 'SIBATE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (588, 13, 'SILVANIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (589, 13, 'SIMIJACA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (590, 13, 'SOACHA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (591, 13, 'SOPO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (592, 13, 'SUBACHOQUE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (593, 13, 'SUESCA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (594, 13, 'SUPATA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (595, 13, 'SUSA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (596, 13, 'SUTATAUSA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (597, 13, 'TABIO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (598, 13, 'TAUSA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (599, 13, 'TENA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (600, 13, 'TENJO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (601, 13, 'TIBACUY');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (602, 13, 'TIBIRITA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (603, 13, 'TOCAIMA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (604, 13, 'TOCANCIPA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (605, 13, 'TOPAIPI');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (606, 13, 'UBALA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (607, 13, 'UBAQUE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (608, 13, 'UBATE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (609, 13, 'UNE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (610, 13, 'UTICA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (611, 13, 'VENECIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (612, 13, 'VERGARA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (613, 13, 'VIANI');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (614, 13, 'VILLAGOMEZ');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (615, 13, 'VILLAPINZON');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (616, 13, 'VILLETA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (617, 13, 'VIOTA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (618, 13, 'YACOPI');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (619, 13, 'ZIPACON');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (620, 13, 'ZIPAQUIRA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (621, 14, 'BARRANCO MINA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (622, 14, 'CACAHUAL');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (623, 14, 'INIRIDA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (624, 14, 'LA GUADALUPE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (625, 14, 'MAPIRIPAN');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (626, 14, 'MORICHAL');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (627, 14, 'PANA PANA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (628, 14, 'PUERTO COLOMBIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (629, 14, 'SAN FELIPE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (630, 15, 'CALAMAR');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (631, 15, 'EL RETORNO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (632, 15, 'MIRAFLORES');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (633, 15, 'SAN JOSE DEL GUAVIARE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (634, 16, 'ACEVEDO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (635, 16, 'AGRADO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (636, 16, 'AIPE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (637, 16, 'ALGECIRAS');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (638, 16, 'ALTAMIRA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (639, 16, 'BARAYA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (640, 16, 'CAMPOALEGRE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (641, 16, 'COLOMBIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (642, 16, 'ELIAS');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (643, 16, 'GARZON');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (644, 16, 'GIGANTE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (645, 16, 'GUADALUPE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (646, 16, 'HOBO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (647, 16, 'IQUIRA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (648, 16, 'ISNOS');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (649, 16, 'LA ARGENTINA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (650, 16, 'LA PLATA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (651, 16, 'NATAGA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (652, 16, 'NEIVA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (653, 16, 'OPORAPA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (654, 16, 'PAICOL');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (655, 16, 'PALERMO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (656, 16, 'PALESTINA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (657, 16, 'PITAL');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (658, 16, 'PITALITO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (659, 16, 'RIVERA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (660, 16, 'SALADOBLANCO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (661, 16, 'SAN AGUSTIN');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (662, 16, 'SANTA MARIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (663, 16, 'SUAZA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (664, 16, 'TARQUI');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (665, 16, 'TELLO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (666, 16, 'TERUEL');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (667, 16, 'TESALIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (668, 16, 'TIMANA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (669, 16, 'VILLAVIEJA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (670, 16, 'YAGUARA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (671, 17, 'ALBANIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (672, 17, 'BARRANCAS');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (673, 17, 'DIBULLA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (674, 17, 'DISTRACCION');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (675, 17, 'EL MOLINO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (676, 17, 'FONSECA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (677, 17, 'HATONUEVO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (678, 17, 'LA JAGUA DEL PILAR');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (679, 17, 'MAICAO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (680, 17, 'MANAURE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (681, 17, 'RIOHACHA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (682, 17, 'SAN JUAN DEL CESAR');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (683, 17, 'URIBIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (684, 17, 'URUMITA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (685, 17, 'VILLANUEVA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (686, 18, 'ALGARROBO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (687, 18, 'ARACATACA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (688, 18, 'ARIGUANI');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (689, 18, 'CERRO SAN ANTONIO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (690, 18, 'CHIBOLO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (691, 18, 'CIENAGA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (692, 18, 'CONCORDIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (693, 18, 'EL BANCO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (694, 18, 'EL PINON');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (695, 18, 'EL RETEN');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (696, 18, 'FUNDACION');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (697, 18, 'GUAMAL');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (698, 18, 'NUEVA GRANADA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (699, 18, 'PEDRAZA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (700, 18, 'PIJINO DEL CARMEN');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (701, 18, 'PIVIJAY');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (702, 18, 'PLATO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (703, 18, 'PUEBLO VIEJO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (704, 18, 'REMOLINO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (705, 18, 'SABANAS DE SAN ANGEL');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (706, 18, 'SALAMINA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (707, 18, 'SAN SEBASTIAN DE BUENAVISTA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (708, 18, 'SAN ZENON');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (709, 18, 'SANTA ANA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (710, 18, 'SANTA BARBARA DE PINTO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (711, 18, 'SANTA MARTA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (712, 18, 'SITIONUEVO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (713, 18, 'TENERIFE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (714, 18, 'ZAPAYAN');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (715, 18, 'ZONA BANANERA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (716, 19, 'ACACIAS');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (717, 19, 'BARRANCA DE UPIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (718, 19, 'CABUYARO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (719, 19, 'CASTILLA LA NUEVA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (720, 19, 'CUMARAL');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (721, 19, 'EL CALVARIO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (722, 19, 'EL CASTILLO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (723, 19, 'EL DORADO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (724, 19, 'FUENTE DE ORO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (725, 19, 'GRANADA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (726, 19, 'GUAMAL');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (727, 19, 'LA MACARENA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (728, 19, 'LA URIBE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (729, 19, 'LEJANIAS');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (730, 19, 'MAPIRIPAN');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (731, 19, 'MESETAS');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (732, 19, 'PUERTO CONCORDIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (733, 19, 'PUERTO GAITAN');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (734, 19, 'PUERTO LLERAS');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (735, 19, 'PUERTO LOPEZ');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (736, 19, 'PUERTO RICO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (737, 19, 'RESTREPO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (738, 19, 'SAN CARLOS GUAROA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (739, 19, 'SAN JUAN DE ARAMA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (740, 19, 'SAN JUANITO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (741, 19, 'SAN LUIS DE CUBARRAL');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (742, 19, 'SAN MARTIN');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (743, 19, 'VILLAVICENCIO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (744, 19, 'VISTA HERMOSA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (745, 20, 'ALBAN');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (746, 20, 'ALDANA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (747, 20, 'ANCUYA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (748, 20, 'ARBOLEDA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (749, 20, 'BARBACOAS');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (750, 20, 'BELEN');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (751, 20, 'BUESACO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (752, 20, 'CHACHAGUI');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (753, 20, 'COLON');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (754, 20, 'CONSACA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (755, 20, 'CONTADERO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (756, 20, 'CORDOBA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (757, 20, 'CUASPUD');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (758, 20, 'CUMBAL');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (759, 20, 'CUMBITARA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (760, 20, 'EL CHARCO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (761, 20, 'EL PENOL');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (762, 20, 'EL ROSARIO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (763, 20, 'EL TABLON DE GOMEZ');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (764, 20, 'EL TAMBO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (765, 20, 'FRANCISCO PIZARRO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (766, 20, 'FUNES');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (767, 20, 'GUACHUCAL');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (768, 20, 'GUAITARILLA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (769, 20, 'GUALMATAN');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (770, 20, 'ILES');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (771, 20, 'IMUES');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (772, 20, 'IPIALES');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (773, 20, 'LA CRUZ');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (774, 20, 'LA FLORIDA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (775, 20, 'LA LLANADA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (776, 20, 'LA TOLA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (777, 20, 'LA UNION');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (778, 20, 'LEIVA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (779, 20, 'LINARES');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (780, 20, 'LOS ANDES');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (781, 20, 'MAGUI');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (782, 20, 'MALLAMA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (783, 20, 'MOSQUERA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (784, 20, 'NARINO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (785, 20, 'OLAYA HERRERA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (786, 20, 'OSPINA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (787, 20, 'PASTO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (788, 20, 'POLICARPA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (789, 20, 'POTOSI');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (790, 20, 'PROVIDENCIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (791, 20, 'PUERRES');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (792, 20, 'PUPIALES');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (793, 20, 'RICAURTE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (794, 20, 'ROBERTO PAYAN');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (795, 20, 'SAMANIEGO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (796, 20, 'SAN BERNARDO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (797, 20, 'SAN LORENZO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (798, 20, 'SAN PABLO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (799, 20, 'SAN PEDRO DE CARTAGO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (800, 20, 'SANDONA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (801, 20, 'SANTA BARBARA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (802, 20, 'SANTA CRUZ');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (803, 20, 'SAPUYES');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (804, 20, 'TAMINANGO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (805, 20, 'TANGUA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (806, 20, 'TUMACO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (807, 20, 'TUQUERRES');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (808, 20, 'YACUANQUER');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (809, 21, 'ABREGO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (810, 21, 'ARBOLEDAS');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (811, 21, 'BOCHALEMA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (812, 21, 'BUCARASICA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (813, 21, 'CACHIRA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (814, 21, 'CACOTA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (815, 21, 'CHINACOTA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (816, 21, 'CHITAGA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (817, 21, 'CONVENCION');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (818, 21, 'CUCUTA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (819, 21, 'CUCUTILLA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (820, 21, 'DURANIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (821, 21, 'EL CARMEN');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (822, 21, 'EL TARRA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (823, 21, 'EL ZULIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (824, 21, 'GRAMALOTE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (825, 21, 'HACARI');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (826, 21, 'HERRAN');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (827, 21, 'LA ESPERANZA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (828, 21, 'LA PLAYA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (829, 21, 'LABATECA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (830, 21, 'LOS PATIOS');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (831, 21, 'LOURDES');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (832, 21, 'MUTISCUA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (833, 21, 'OCANA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (834, 21, 'PAMPLONA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (835, 21, 'PAMPLONITA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (836, 21, 'PUERTO SANTANDER');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (837, 21, 'RAGONVALIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (838, 21, 'SALAZAR');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (839, 21, 'SAN CALIXTO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (840, 21, 'SAN CAYETANO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (841, 21, 'SANTIAGO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (842, 21, 'SARDINATA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (843, 21, 'SILOS');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (844, 21, 'TEORAMA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (845, 21, 'TIBU');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (846, 21, 'TOLEDO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (847, 21, 'VILLA CARO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (848, 21, 'VILLA DEL ROSARIO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (849, 22, 'COLON');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (850, 22, 'MOCOA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (851, 22, 'ORITO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (852, 22, 'PUERTO ASIS');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (853, 22, 'PUERTO CAICEDO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (854, 22, 'PUERTO GUZMAN');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (855, 22, 'PUERTO LEGUIZAMO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (856, 22, 'SAN FRANCISCO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (857, 22, 'SAN MIGUEL');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (858, 22, 'SANTIAGO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (859, 22, 'SIBUNDOY');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (860, 22, 'VALLE DEL GUAMUEZ');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (861, 22, 'VILLA GARZON');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (862, 23, 'ARMENIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (863, 23, 'BUENAVISTA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (864, 23, 'CALARCA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (865, 23, 'CIRCASIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (866, 23, 'CORDOBA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (867, 23, 'FILANDIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (868, 23, 'GENOVA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (869, 23, 'LA TEBAIDA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (870, 23, 'MONTENGRO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (871, 23, 'PIJAO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (872, 23, 'QUIMBAYA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (873, 23, 'SALENTO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (874, 24, 'APIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (875, 24, 'BALBOA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (876, 24, 'BELEN DE UMBRIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (877, 24, 'DOSQUEBRADAS');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (878, 24, 'GUATICA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (879, 24, 'LA CELIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (880, 24, 'LA VIRGINIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (881, 24, 'MARSELLA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (882, 24, 'MISTRATO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (883, 24, 'PEREIRA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (884, 24, 'PUEBLO RICO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (885, 24, 'QUINCHIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (886, 24, 'SANTA ROSA DE CABAL');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (887, 24, 'SANTUARIO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (888, 25, 'PROVIDENCIA Y SANTA CATALINA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (889, 25, 'SAN ANDRES');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (890, 26, 'AGUADA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (891, 26, 'ALBANIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (892, 26, 'ARATOCA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (893, 26, 'BARBOSA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (894, 26, 'BARICHARA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (895, 26, 'BARRANCABERMEJA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (896, 26, 'BETULIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (897, 26, 'BOLIVAR');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (898, 26, 'BUCARAMANGA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (899, 26, 'CABRERA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (900, 26, 'CALIFORNIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (901, 26, 'CAPITANEJO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (902, 26, 'CARCASI');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (903, 26, 'CEPITA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (904, 26, 'CERRITO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (905, 26, 'CHARALA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (906, 26, 'CHARTA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (907, 26, 'CHIMA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (908, 26, 'CHIPATA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (909, 26, 'CIMITARRA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (910, 26, 'CONCEPCION');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (911, 26, 'CONFINES');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (912, 26, 'CONTRATACION');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (913, 26, 'COROMORO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (914, 26, 'CURITI');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (915, 26, 'EL CARMEN DE CHUCURI');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (916, 26, 'EL GUACAMAYO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (917, 26, 'EL PENON');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (918, 26, 'EL PLAYON');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (919, 26, 'ENCINO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (920, 26, 'ENCISO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (921, 26, 'FLORIAN');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (922, 26, 'FLORIDABLANCA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (923, 26, 'GALAN');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (924, 26, 'GAMBITA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (925, 26, 'GIRON');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (926, 26, 'GUACA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (927, 26, 'GUADALUPE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (928, 26, 'GUAPOTA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (929, 26, 'GUAVATA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (930, 26, 'GUEPSA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (931, 26, 'HATO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (932, 26, 'JESUS MARIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (933, 26, 'JORDAN');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (934, 26, 'LA BELLEZA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (935, 26, 'LA PAZ');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (936, 26, 'LANDAZURI');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (937, 26, 'LEBRIJA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (938, 26, 'LOS SANTOS');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (939, 26, 'MACARAVITA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (940, 26, 'MALAGA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (941, 26, 'MATANZA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (942, 26, 'MOGOTES');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (943, 26, 'MOLAGAVITA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (944, 26, 'OCAMONTE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (945, 26, 'OIBA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (946, 26, 'ONZAGA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (947, 26, 'PALMAR');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (948, 26, 'PALMAS DEL SOCORRO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (949, 26, 'PARAMO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (950, 26, 'PIEDECUESTA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (951, 26, 'PINCHOTE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (952, 26, 'PUENTE NACIONAL');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (953, 26, 'PUERTO PARRA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (954, 26, 'PUERTO WILCHES');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (955, 26, 'RIONEGRO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (956, 26, 'SABANA DE TORRES');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (957, 26, 'SAN ANDRES');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (958, 26, 'SAN BENITO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (959, 26, 'SAN GIL');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (960, 26, 'SAN JOAQUIN');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (961, 26, 'SAN JOSE DE MIRANDA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (962, 26, 'SAN MIGUEL');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (963, 26, 'SAN VICENTE DE CHUCURI');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (964, 26, 'SANTA BARBARA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (965, 26, 'SANTA HELENA DEL OPON');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (966, 26, 'SIMACOTA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (967, 26, 'SOCORRO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (968, 26, 'SUAITA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (969, 26, 'SUCRE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (970, 26, 'SURATA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (971, 26, 'TONA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (972, 26, 'VALLE DE SAN JOSE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (973, 26, 'VELEZ');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (974, 26, 'VETAS');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (975, 26, 'VILLANUEVA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (976, 26, 'ZAPATOCA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (977, 27, 'BUENAVISTA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (978, 27, 'CAIMITO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (979, 27, 'CHALAN');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (980, 27, 'COLOSO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (981, 27, 'COROZAL');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (982, 27, 'COVENAS');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (983, 27, 'EL ROBLE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (984, 27, 'GALERAS');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (985, 27, 'GUARANDA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (986, 27, 'LA UNION');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (987, 27, 'LOS PALMITOS');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (988, 27, 'MAJAGUAL');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (989, 27, 'MORROA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (990, 27, 'OVEJAS');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (991, 27, 'PALMITO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (992, 27, 'SAMPUES');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (993, 27, 'SAN BENITO ABAD');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (994, 27, 'SAN JUAN BETULIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (995, 27, 'SAN MARCOS');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (996, 27, 'SAN ONOFRE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (997, 27, 'SAN PEDRO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (998, 27, 'SANTIAGO DE TOLU');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (999, 27, 'SINCE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1000, 27, 'SINCELEJO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1001, 27, 'SUCRE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1002, 27, 'TOLU VIEJO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1003, 28, 'ALPUJARRA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1004, 28, 'ALVARADO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1005, 28, 'AMBALEMA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1006, 28, 'ANZOATEGUI');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1007, 28, 'ARMERO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1008, 28, 'ATACO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1009, 28, 'CAJAMARCA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1010, 28, 'CARMEN DE APICALA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1011, 28, 'CASABIANCA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1012, 28, 'CHAPARRAL');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1013, 28, 'COELLO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1014, 28, 'COYAIMA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1015, 28, 'CUNDAY');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1016, 28, 'DOLORES');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1017, 28, 'ESPINAL');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1018, 28, 'FALAN');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1019, 28, 'FLANDES');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1020, 28, 'FRESNO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1021, 28, 'GUAMO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1022, 28, 'HERVEO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1023, 28, 'HONDA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1024, 28, 'IBAGUE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1025, 28, 'ICONONZO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1026, 28, 'LERIDA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1027, 28, 'LIBANO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1028, 28, 'MARIQUITA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1029, 28, 'MELGAR');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1030, 28, 'MURILLO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1031, 28, 'NATAGAIMA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1032, 28, 'ORTEGA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1033, 28, 'PALOCABILDO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1034, 28, 'PIEDRAS');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1035, 28, 'PLANADAS');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1036, 28, 'PRADO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1037, 28, 'PURIFICACION');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1038, 28, 'RIOBLANCO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1039, 28, 'RONCESVALLES');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1040, 28, 'ROVIRA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1041, 28, 'SALDANA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1042, 28, 'SAN ANTONIO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1043, 28, 'SAN LUIS');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1044, 28, 'SANTA ISABEL');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1045, 28, 'SUAREZ');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1046, 28, 'VALLE DE SAN JUAN');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1047, 28, 'VENADILLO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1048, 28, 'VILLAHERMOSA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1049, 28, 'VILLARRICA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1050, 29, 'ALCALA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1051, 29, 'ANDALUCIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1052, 29, 'ANSERMANUEVO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1053, 29, 'ARGELIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1054, 29, 'BOLIVAR');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1055, 29, 'BUENAVENTURA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1056, 29, 'BUGA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1057, 29, 'BUGALAGRANDE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1058, 29, 'CAICEDONIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1059, 29, 'CALI');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1060, 29, 'CALIMA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1061, 29, 'CANDELARIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1062, 29, 'CARTAGO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1063, 29, 'DAGUA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1064, 29, 'EL AGUILA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1065, 29, 'EL CAIRO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1066, 29, 'EL CERRITO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1067, 29, 'EL DOVIO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1068, 29, 'FLORIDA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1069, 29, 'GINEBRA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1070, 29, 'GUACARI');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1071, 29, 'JAMUNDI');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1072, 29, 'LA CUMBRE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1073, 29, 'LA UNION');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1074, 29, 'LA VICTORIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1075, 29, 'OBANDO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1076, 29, 'PALMIRA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1077, 29, 'PRADERA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1078, 29, 'RESTREPO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1079, 29, 'RIOFRIO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1080, 29, 'ROLDANILLO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1081, 29, 'SAN PEDRO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1082, 29, 'SEVILLA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1083, 29, 'TORO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1084, 29, 'TRUJILLO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1085, 29, 'TULUA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1086, 29, 'ULLOA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1087, 29, 'VERSALLES');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1088, 29, 'VIJES');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1089, 29, 'YOTOCO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1090, 29, 'YUMBO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1091, 29, 'ZARZAL');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1092, 30, 'CARURU');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1093, 30, 'MITU');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1094, 30, 'PACOA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1095, 30, 'PAPUNAHUA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1096, 30, 'TARAIRA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1097, 30, 'YAVARATE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1098, 31, 'CUMARIBO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1099, 31, 'LA PRIMAVERA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1100, 31, 'PUERTO CARRENO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1101, 31, 'SANTA ROSALIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1102, 32, 'ARAUCA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1103, 32, 'ARAUQUITA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1104, 32, 'CRAVO NORTE');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1105, 32, 'FORTUL');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1106, 32, 'PUERTO RONDON');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1107, 32, 'SARAVENA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1108, 32, 'TAME');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1109, 33, 'EL ENCANTO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1110, 33, 'LA CHORRERA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1111, 33, 'LA PEDRERA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1112, 33, 'LA VICTORIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1113, 33, 'LETICIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1114, 33, 'MIRITI - PARANA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1115, 33, 'PUERTO ALEGRIA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1116, 33, 'PUERTO ARICA');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1117, 33, 'PUERTO NARINO');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1118, 33, 'PUERTO SANTANDER');
INSERT INTO "William Uribe".municipios (id, departamentos_id, nom_municip) VALUES (1119, 33, 'TARAPACA');


--
-- TOC entry 3651 (class 0 OID 1769534)
-- Dependencies: 304
-- Data for Name: pacientes; Type: TABLE DATA; Schema: William Uribe; Owner: Comfe_owner
--

INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (1, 1, '37802942', 'ADELINA MANOSALVA', '6076363601', 26, 922, 'Calle 1 #1-01');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (2, 1, '28133956', 'ADELINA SARMIENTO', '3144633079', 1, 1, 'Carrera 2 #2-02');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (91, 1, '91072542', 'EUCLIDES TIRIA', '3203485874', 26, 922, 'Calle 91 #91-91');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (20, 1, '28298535', 'ANA ELVIA NAVAS', '3142381620', 26, 895, 'Carrera 20 #20-20');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (21, 1, '27950262', 'ANA FRANCISCA GUARIN', '6076940043', 26, 895, 'Calle 21 #21-21');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (22, 1, '28011366', 'ANA ISABEL NORIEGA', '3168211931', 21, 833, 'Carrera 22 #22-22');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (23, 1, '27934627', 'ANA MARIA GUTIERREZ', '3107786583', 26, 895, 'Calle 23 #23-23');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (24, 1, '30204805', 'ANA ROSA LUQUE', '3107840970', 26, 895, 'Carrera 24 #24-24');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (25, 1, '1005330611', 'ANDRES FELIPE MANCILLA', '3178544102', 26, 895, 'Calle 25 #25-25');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (26, 1, '91519720', 'ANDRES GIOANNY OLARTE', '3158465820', 26, 895, 'Carrera 26 #26-26');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (27, 1, '13845146', 'ANGEL MARIA PINZON', '3174932002', 26, 895, 'Calle 27 #27-27');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (28, 2, '79550', 'ANGEL MIGUEL NEIRA', '3176768860', 26, 895, 'Carrera 28 #28-28');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (29, 1, '1005241567', 'ANGELLY BARBA', '3045879350', 26, 895, 'Calle 29 #29-29');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (30, 1, '1005150337', 'ANGIE PAOLA SANCHEZ', '3228187421', 26, 895, 'Carrera 30 #30-30');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (31, 1, '91510992', 'ANTONIO VEGA', '3014373680', 26, 898, 'Calle 31 #31-31');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (32, 1, '5555230', 'AURELIO FRANCO', '3024789940', 26, 898, 'Carrera 32 #32-32');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (33, 1, '42489104', 'BERTHA RODRIGUEZ', '3215392940', 26, 898, 'Calle 33 #33-33');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (34, 1, '37823789', 'BERTILDA ANTOLINEZ', '3012138756', 26, 898, 'Carrera 34 #34-34');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (35, 1, '45478956', 'BEVERLY MARGARETH DUARTE', '3204767571', 1, 1, 'Calle 35 #35-35');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (36, 3, '1098716087', 'BIBIANA ARIZA', '3002455866', 26, 898, 'Carrera 36 #36-36');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (37, 1, '28168166', 'BLANCA ADELA FRANCO', '3173630546', 26, 898, 'Calle 37 #37-37');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (38, 1, '63318271', 'BLANCA PATRICIA SUAREZ', '3158476173', 21, 833, 'Carrera 38 #38-38');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (39, 1, '1007193724', 'BRANDON ENRIQUE PEREZ', '3115014968', 26, 898, 'Calle 39 #39-39');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (40, 2, '2099251', 'CARLOS ALBERTO PINILLA', '3015815385', 26, 898, 'Carrera 40 #40-40');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (41, 1, '13884676', 'CARLOS JULIO CASTILLO', '3212857411', 26, 898, 'Calle 41 #41-41');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (42, 1, '91201898', 'CARLOS MIGUEL PEREZ', '3162290594', 26, 898, 'Carrera 42 #42-42');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (43, 1, '28015625', 'CARLOTA AGUILAR', '3106741327', 26, 898, 'Calle 43 #43-43');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (44, 1, '37240265', 'CARMEN ALICIA PATERNINA', '3003759848', 26, 898, 'Carrera 44 #44-44');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (45, 1, '29688307', 'CARMEN ISABEL RIOS', '3163931453', 26, 898, 'Calle 45 #45-45');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (46, 1, '27954981', 'CARMEN NELLY MENESES', '3185309364', 26, 898, 'Carrera 46 #46-46');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (47, 1, '27785152', 'CARMEN SOFIA ESPINEL', '3108672520', 26, 898, 'Calle 47 #47-47');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (48, 1, '1091677550', 'CAROLINA OSORIO', '3135719146', 26, 898, 'Carrera 48 #48-48');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (49, 3, '1098661385', 'CECILIA JIMENEZ', '3175387739', 26, 898, 'Calle 49 #49-49');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (50, 1, '22396762', 'CIELO ESTHER SIERRA', '3102029902', 26, 898, 'Carrera 50 #50-50');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (51, 1, '63503539', 'CLARA MARGARITA RESTREPO', '3108788564', 26, 898, 'Calle 51 #51-51');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (52, 1, '63281483', 'CLAUDIA LUCIA DUARTE', '3102629880', 26, 898, 'Carrera 52 #52-52');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (53, 1, '37659071', 'CLAUDIA PATRICIA GOMEZ', '3202430972', 21, 834, 'Calle 53 #53-53');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (54, 1, '37812664', 'CLAUDINA CACERES', '3132583497', 21, 834, 'Carrera 54 #54-54');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (55, 1, '49550176', 'CLOTILDE RODRIGUEZ', '3143578244', 21, 834, 'Calle 55 #55-55');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (56, 1, '52710560', 'CRISTINA ANDREA REYES', '3208546073', 1, 1, 'Carrera 56 #56-56');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (57, 1, '28296548', 'DAIRIS MARIA GUERRA', '3174761998', 21, 834, 'Calle 57 #57-57');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (58, 1, '26900003', 'DAISY DEL CARMEN GUTIERREZ', '3135286624', 21, 834, 'Carrera 58 #58-58');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (59, 1, '5637616', 'DANIEL PATINO', '3153258421', 26, 898, 'Calle 59 #59-59');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (60, 3, '1193138588', 'DANIEL ANDRES RODRIGUEZ', '3214695902', 26, 898, 'Carrera 60 #60-60');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (61, 1, '13351992', 'DARIO ALBERTO CADAVID', '3105599904', 26, 898, 'Calle 61 #61-61');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (62, 1, '39015217', 'DAYRIS PACHECO', '3145182658', 26, 898, 'Carrera 62 #62-62');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (63, 1, '63287956', 'DECCI MARIA QUINTERO', '3168620190', 26, 898, 'Calle 63 #63-63');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (64, 1, '37510909', 'DELIA ZUSELTH MORENO', '3187931513', 21, 833, 'Carrera 64 #64-64');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (65, 3, '1098663624', 'DIEGO ANDRES JIMENEZ', '3178268076', 26, 898, 'Calle 65 #65-65');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (66, 3, '1098721195', 'DIEGO ARMANDO VILLAMIZAR', '3163350827', 26, 898, 'Carrera 66 #66-66');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (67, 1, '1095843177', 'DIEGO FERNANDO ORDONEZ', '3183697762', 26, 895, 'Calle 67 #67-67');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (68, 1, '28378414', 'DIOCELINA CUADROS', '3152208815', 26, 895, 'Carrera 68 #68-68');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (69, 1, '37238800', 'DORALICES CECILIA ORTIZ', '3137864481', 26, 895, 'Calle 69 #69-69');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (70, 1, '37832200', 'DORIS BERNAL', '3184228677', 26, 895, 'Carrera 70 #70-70');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (71, 1, '63453069', 'DORIS PATRICIA AYALA', '3166739890', 26, 895, 'Calle 71 #71-71');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (72, 1, '63275841', 'DURLEY ZULUAGA', '3214139148', 26, 895, 'Carrera 72 #72-72');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (73, 1, '13817836', 'EDELBERTO GARCIA', '3204700813', 26, 895, 'Calle 73 #73-73');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (74, 1, '49653192', 'EDITH CAAMANO', '3136677248', 26, 895, 'Carrera 74 #74-74');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (75, 1, '28195775', 'ELISABETH CARRILLO', '3108650904', 26, 895, 'Calle 75 #75-75');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (76, 1, '1005258515', 'ELISEO NAVAS', '3142595238', 26, 895, 'Carrera 76 #76-76');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (77, 1, '41779833', 'ELIZABETH MORENO', '3156380100', 26, 895, 'Calle 77 #77-77');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (78, 1, '37749810', 'ELIZABETH SARMIENTO', '3187519827', 26, 895, 'Carrera 78 #78-78');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (79, 1, '40010963', 'ELSA EMILIA CASTELLANOS', '3114553183', 1, 1, 'Calle 79 #79-79');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (80, 1, '63335152', 'ELVIRA MERCHAN', '3202583546', 26, 895, 'Carrera 80 #80-80');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (81, 1, '1097495064', 'EMELING SOFIA SARABI', '3184908380', 21, 833, 'Calle 81 #81-81');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (82, 1, '31799266', 'EMILIA CARDOZO', '3053402872', 26, 895, 'Carrera 82 #82-82');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (83, 1, '1097134586', 'EMILIE LUCIANA LEGUIZAMON', '3177987584', 26, 895, 'Calle 83 #83-83');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (84, 1, '19299362', 'EMIRO SUAREZ', '3135709718', 26, 895, 'Carrera 84 #84-84');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (85, 1, '1093300953', 'EMMANUEL CABALLERO', '3112282204', 26, 895, 'Calle 85 #85-85');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (86, 1, '63511215', 'ENITHSABETH CARO', '3142662109', 26, 898, 'Carrera 86 #86-86');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (87, 1, '28237149', 'ERNESTINA MEJIA', '3175247484', 26, 898, 'Calle 87 #87-87');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (88, 1, '63306382', 'ESPERANZA JAIMES', '3107885637', 26, 922, 'Carrera 88 #88-88');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (89, 1, '1018453003', 'ESTEBAN ALMEIDA', '3178536220', 26, 922, 'Calle 89 #89-89');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (90, 1, '28011054', 'ESTHER JULIA SEPULVEDA', '3156560361', 26, 922, 'Carrera 90 #90-90');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (92, 1, '37821331', 'EVELIA GOMEZ', '3143410730', 26, 922, 'Carrera 92 #92-92');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (93, 1, '13801689', 'FABIO HUMBERTO DIAZ', '3016430414', 26, 922, 'Calle 93 #93-93');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (94, 1, '22994688', 'FATIMA TURIZO', '3118111809', 26, 922, 'Carrera 94 #94-94');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (96, 1, '28238096', 'FLOR ELBA SANCHEZ', '3164984882', 26, 922, 'Carrera 96 #96-96');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (97, 1, '37832380', 'FLOR MARIA ARAQUE', '3133861892', 26, 922, 'Calle 97 #97-97');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (98, 1, '1096197410', 'FRANCIA MILENA NAVARRO', '3246705778', 26, 922, 'Carrera 98 #98-98');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (99, 1, '1004353567', 'FREDY ANDRES MARTINEZ', '3246803693', 26, 922, 'Calle 99 #99-99');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (100, 1, '91134379', 'GABRIEL ANDRES DIAZ', '3177939332', 1, 1, 'Carrera 100 #100-100');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (101, 1, '1096700386', 'GABRIEL DARIO ESPINOSA', '3133963725', 26, 922, 'Calle 101 #101-101');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (102, 1, '17054388', 'GILBERTO ACEVEDO', '3106300453', 26, 922, 'Carrera 102 #102-102');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (103, 1, '13219896', 'GILBERTO SANCHEZ', '3123596150', 21, 833, 'Calle 103 #103-103');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (104, 1, '37928593', 'GILMA RIOS', '3105517616', 26, 922, 'Carrera 104 #104-104');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (105, 1, '37655551', 'GLADYS GOMEZ', '3112311216', 1, 1, 'Calle 105 #105-105');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (106, 1, '37805328', 'GLADYS ORTIZ', '3114496933', 26, 922, 'Carrera 106 #106-106');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (107, 1, '37942522', 'GLADYS ELENA URREA', '3214758411', 26, 922, 'Calle 107 #107-107');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (108, 1, '63286597', 'GLADYS EMILSE JAIMES', '3167424024', 26, 922, 'Carrera 108 #108-108');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (109, 1, '27944761', 'GLORIA CADAVID', '3156329224', 26, 922, 'Calle 109 #109-109');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (110, 1, '37815984', 'GLORIA INES DIAZ', '3154257032', 26, 898, 'Carrera 110 #110-110');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (111, 1, '63321228', 'HELENA HERNANDEZ', '3113581198', 26, 898, 'Calle 111 #111-111');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (112, 1, '91110926', 'HENRY ROBERTO SAAVEDRA', '3222898962', 26, 898, 'Carrera 112 #112-112');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (113, 1, '37888123', 'HERCILIA DIAZ', '3174835464', 26, 898, 'Calle 113 #113-113');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (114, 1, '91513359', 'HERNAN PRADA', '3153984488', 26, 898, 'Carrera 114 #114-114');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (115, 1, '28213022', 'HILDA RAMIREZ', '3163968219', 26, 898, 'Calle 115 #115-115');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (116, 1, '27616411', 'HILDA ROSA OVALLOS', '3112642310', 26, 898, 'Carrera 116 #116-116');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (117, 1, '45503582', 'HIRINA NIEBES', '3212160991', 26, 898, 'Calle 117 #117-117');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (118, 1, '91232255', 'HUMBERTO JIMENEZ', '3153746144', 26, 898, 'Carrera 118 #118-118');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (119, 1, '37791023', 'INES TELLEZ', '3173747445', 26, 898, 'Calle 119 #119-119');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (120, 1, '1098620839', 'INGRIT KATERINE OLARTE', '3183519010', 21, 833, 'Carrera 120 #120-120');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (121, 3, '1102635447', 'ISNELDY JOHANA NINO', '3185675171', 26, 898, 'Calle 121 #121-121');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (122, 3, '1098752054', 'JAVIER ALBERTO REYES', '3175767934', 26, 898, 'Carrera 122 #122-122');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (123, 3, '1098775538', 'JEIMY TATIANA DIAZ', '3106089745', 26, 898, 'Calle 123 #123-123');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (124, 1, '1096243194', 'JEISSON MAURICIO ARDILA', '3232830352', 21, 818, 'Carrera 124 #124-124');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (125, 1, '1098649343', 'JESSICA NEWTON CASTELLANOS', '3156638544', 21, 818, 'Calle 125 #125-125');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (126, 1, '1096063028', 'JESSICA YULIETH MORENO', '3144032812', 21, 818, 'Carrera 126 #126-126');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (127, 1, '1095822478', 'JESUS ALBERTO MUNOZ', '3003752337', 26, 898, 'Calle 127 #127-127');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (128, 2, '5084683', 'JHONNY PEINADO', '3229038954', 26, 895, 'Carrera 128 #128-128');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (129, 1, '37843939', 'JOHANA SMITH SEPULVEDA', '3152035511', 26, 895, 'Calle 129 #129-129');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (130, 3, '1098662950', 'JORGE ALBERTO ZIPAMONCHA', '3124865532', 26, 950, 'Carrera 130 #130-130');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (131, 1, '13721690', 'JORGE ALVERTO PARRA', '3174231936', 26, 950, 'Calle 131 #131-131');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (132, 3, '1101758186', 'JORGE ANDREY BARBOSA', '3177262597', 26, 950, 'Carrera 132 #132-132');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (133, 1, '13809099', 'JORGE ELIECER GUERRERO', '3158008221', 26, 950, 'Calle 133 #133-133');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (134, 1, '5742288', 'JOSE DE JESUS WANDURRAGA', '3505034404', 26, 950, 'Carrera 134 #134-134');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (135, 1, '17043530', 'JOSE DEL CARMEN AMAYA', '3242823241', 21, 833, 'Calle 135 #135-135');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (136, 2, '5552820', 'JOSE DIXON NUNEZ', '3178436628', 26, 950, 'Carrera 136 #136-136');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (137, 1, '13259750', 'JOSE ISAI HERNADEZ', '3132965853', 26, 950, 'Calle 137 #137-137');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (138, 1, '91250356', 'JOSE LUIS CARRERO', '3168512998', 26, 950, 'Carrera 138 #138-138');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (139, 1, '1095818502', 'JOSY ESTEBAN LEON', '3168167128', 26, 950, 'Calle 139 #139-139');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (140, 1, '10065528', 'JUAN BUENAVENTURA ORTIZ', '3135993555', 26, 950, 'Carrera 140 #140-140');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (141, 1, '1096252203', 'JUAN KAMILO ESTRADA', '3114826816', 21, 818, 'Calle 141 #141-141');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (142, 1, '1096514847', 'JUAN SEBAASTIAN HERNANDEZ', '3223232341', 21, 834, 'Carrera 142 #142-142');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (143, 1, '37826311', 'JULIA RAMIREZ', '3178240213', 26, 950, 'Calle 143 #143-143');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (144, 3, '1098755401', 'JULIETH KATHERINE POLO', '3023466152', 26, 950, 'Carrera 144 #144-144');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (145, 1, '1083007891', 'JULIETH PAOLA GOMEZ', '3013874548', 21, 834, 'Calle 145 #145-145');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (146, 2, '3983761', 'JULIO ROSA MIER', '3209244560', 26, 950, 'Carrera 146 #146-146');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (147, 1, '1006409574', 'KAREN DANIELA CORONEL', '3146694188', 26, 950, 'Calle 147 #147-147');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (148, 3, '1098735219', 'KAREN JULIETH MARTINEZ', '3007710197', 21, 833, 'Carrera 148 #148-148');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (149, 3, '1099748933', 'KEREN THALIANA OVALLOS', '3118651010', 26, 950, 'Calle 149 #149-149');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (150, 3, '1098752588', 'KERRY STEFANNIE GUERRERO', '3183905101', 26, 950, 'Carrera 150 #150-150');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (151, 1, '63550755', 'LAURA ELOINA TARAZONA', '3185786851', 26, 950, 'Calle 151 #151-151');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (152, 1, '63304517', 'LAURA ISABEL ALVIAR', '3102788247', 26, 950, 'Carrera 152 #152-152');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (153, 1, '1097781411', 'LAURA JULIANA LOBO', '3184020955', 26, 895, 'Calle 153 #153-153');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (154, 1, '1055333440', 'LAURA YANETH FORERO', '3212009551', 26, 895, 'Carrera 154 #154-154');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (155, 1, '1010105869', 'LEIDY ALEXANDRA VILLABONA', '3125549409', 26, 895, 'Calle 155 #155-155');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (156, 1, '37809765', 'LETICIA GOMEZ', '3173811673', 26, 895, 'Carrera 156 #156-156');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (157, 1, '28148754', 'LETICIA MANTILLA', '3164646414', 26, 895, 'Calle 157 #157-157');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (158, 1, '37803259', 'LIBIA DELGADO', '6076166866', 21, 818, 'Carrera 158 #158-158');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (95, 1, '6752009', 'FLAVIO GAMBOA', '3024119682', 26, 922, 'Calle 95 #95-95');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (159, 1, '39558024', 'LIDIA ALEJANDRINA QUIEROGA', '3125731054', 21, 818, 'Calle 159 #159-159');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (160, 1, '28239955', 'LIGIA STHER RODRIGUEZ', '3102008699', 21, 818, 'Carrera 160 #160-160');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (161, 3, '1098801554', 'LINA LIZETH HERRERA', '3157986537', 21, 818, 'Calle 161 #161-161');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (162, 1, '1055272755', 'LINA PAOLA CHINOME', '3124751805', 26, 895, 'Carrera 162 #162-162');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (163, 1, '8831087', 'LIOVIGILDO JOSE GARCIA', '3118816489', 26, 895, 'Calle 163 #163-163');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (164, 1, '1097104505', 'LORNA SOFIA RODRIGUEZ', '3166511184', 21, 833, 'Carrera 164 #164-164');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (165, 1, '63357364', 'LUCERO MEJIA', '3166958208', 26, 895, 'Calle 165 #165-165');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (166, 1, '1095915316', 'LUCIA CRISTINA AMAYA', '3142543649', 26, 895, 'Carrera 166 #166-166');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (167, 1, '63300892', 'LUDY ZAPATA', '3043902377', 26, 895, 'Calle 167 #167-167');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (168, 1, '13894743', 'LUIS ALEJANDRO MARQUEZ', '3175412037', 26, 895, 'Carrera 168 #168-168');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (169, 3, '1100968614', 'LUIS ALEJANDRO PINA', '3153351978', 26, 898, 'Calle 169 #169-169');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (170, 1, '91229646', 'LUIS ALFREDO PINZON', '3155653981', 26, 898, 'Carrera 170 #170-170');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (171, 2, '4299458', 'LUIS ALONSO GOMEZ', '3183751714', 26, 898, 'Calle 171 #171-171');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (172, 2, '2884224', 'LUIS EMIGDIO QUIROGA', '3014458783', 26, 898, 'Carrera 172 #172-172');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (173, 2, '5555049', 'LUIS ENRIQUE ANGARITA', '3168464053', 26, 898, 'Calle 173 #173-173');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (174, 1, '17589577', 'LUIS ENRIQUE DAVILA', '3157639501', 21, 833, 'Carrera 174 #174-174');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (175, 1, '5638306', 'LUIS FRANCISCO CANAS', '3213150889', 26, 898, 'Calle 175 #175-175');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (176, 1, '5560213', 'LUIS FRANCISCO CHAPARRO', '3105673032', 21, 834, 'Carrera 176 #176-176');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (177, 1, '13887708', 'LUIS HUMBERTO MORENO', '3175166701', 21, 834, 'Calle 177 #177-177');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (178, 2, '2169882', 'LUIS JOAQUIN SIERRA', '3175359641', 26, 898, 'Carrera 178 #178-178');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (179, 1, '21473165', 'LUZ DARY DE LA TRINIDAD CASTELLANOS', '3175486995', 26, 898, 'Calle 179 #179-179');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (180, 1, '63281304', 'LUZ MARINA OSORIO', '3158303343', 26, 898, 'Carrera 180 #180-180');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (181, 1, '63293076', 'LUZ MARINA RINCON', '3123535708', 26, 898, 'Calle 181 #181-181');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (182, 1, '26733570', 'LUZ MARINA TORRES', '3217766311', 26, 898, 'Carrera 182 #182-182');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (183, 1, '21949621', 'MAGALY DE JESUS SALCEDO', '3204114764', 26, 922, 'Calle 183 #183-183');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (184, 2, '3550027', 'MANUEL JOSE LOPEZ', '3107471017', 26, 922, 'Carrera 184 #184-184');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (185, 1, '122905854', 'MARC ANTHONY OSORIO', '7502183180', 26, 925, 'Calle 185 #185-185');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (186, 1, '37259531', 'MARGARITA CARDENAS', '3183480710', 21, 833, 'Carrera 186 #186-186');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (187, 1, '28295672', 'MARIA DE LA CRUZ BAUTISTA', '3008601721', 26, 925, 'Calle 187 #187-187');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (188, 1, '21843058', 'MARIA ELISA BLANCO', '3208589527', 26, 925, 'Carrera 188 #188-188');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (189, 1, '37655316', 'MARIA EMERITA GONZALEZ', '3223542407', 26, 925, 'Calle 189 #189-189');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (190, 1, '26735086', 'MARIA EMMA RINCON', '3162211595', 26, 925, 'Carrera 190 #190-190');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (191, 3, '1100951100', 'MARIA ESPERANZA MEJIA', '3152079554', 26, 925, 'Calle 191 #191-191');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (192, 1, '28479026', 'MARIA EVA SERRANO', '3144003651', 26, 925, 'Carrera 192 #192-192');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (193, 1, '27982086', 'MARIA FANNY WANDURRAGA', '3165637292', 26, 925, 'Calle 193 #193-193');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (194, 1, '63320507', 'MARIA JACKELINE ACUNA', '3118409144', 26, 925, 'Carrera 194 #194-194');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (195, 3, '1098824523', 'MARIA LUCIA TARAZONA', '3163738637', 26, 925, 'Calle 195 #195-195');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (196, 1, '28331294', 'MARIA LUCY PENALOZA', '3108818062', 26, 925, 'Carrera 196 #196-196');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (197, 1, '40510361', 'MARIA LUISA CASTRILLON', '3105773493', 26, 925, 'Calle 197 #197-197');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (198, 1, '28161061', 'MARIA OCTAVIA TARAZONA', '3143770622', 26, 925, 'Carrera 198 #198-198');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (199, 1, '27946711', 'MARIA OLGA PRADA', '3222184229', 21, 833, 'Calle 199 #199-199');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (200, 1, '41484418', 'MARIA OLINDA CAMACHO', '3006885357', 26, 925, 'Carrera 200 #200-200');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (201, 1, '37889444', 'MARIA TERESA ALONSO', '3115857391', 26, 925, 'Calle 201 #201-201');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (202, 1, '28355822', 'MARIA TERESA BUENO', '3187717269', 21, 818, 'Carrera 202 #202-202');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (203, 1, '63299088', 'MARIELA RIVERA', '3004613077', 21, 818, 'Calle 203 #203-203');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (204, 1, '5730511', 'MARIO GARZON', '3153705579', 21, 818, 'Carrera 204 #204-204');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (205, 1, '37835310', 'MARLENE HERNANDEZ', '3163355812', 21, 818, 'Calle 205 #205-205');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (206, 1, '37916351', 'MARLENE PEREZ', '3104686069', 26, 895, 'Carrera 206 #206-206');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (207, 1, '63347713', 'MARTHA CECILIA GUERRERO', '3184609838', 26, 895, 'Calle 207 #207-207');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (208, 1, '63294449', 'MARTHA CECILIA MENDOZA', '3133779094', 26, 895, 'Carrera 208 #208-208');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (209, 1, '37829731', 'MARTHA CECILIA RAMIREZ', '3002329863', 26, 895, 'Calle 209 #209-209');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (210, 1, '63349823', 'MARTHA LUCIA GAMARRA', '3173803975', 26, 895, 'Carrera 210 #210-210');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (211, 1, '23780212', 'MARTHA LUCIA GUERRERO', '3166824704', 26, 895, 'Calle 211 #211-211');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (212, 1, '91323877', 'MAURICIO RAMIREZ', '3123109804', 21, 833, 'Carrera 212 #212-212');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (213, 1, '1095917789', 'MAURICIO SANTOS', '3153395621', 26, 895, 'Calle 213 #213-213');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (214, 1, '23148133', 'MAVIS SOFIA CHAVEZ', '3115934481', 26, 895, 'Carrera 214 #214-214');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (215, 1, '37542604', 'MAYELIDT ROJAS', '3223452627', 26, 895, 'Calle 215 #215-215');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (216, 1, '1070946366', 'MAYRA ALEJANDRA BARON', '3103448636', 26, 895, 'Carrera 216 #216-216');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (217, 1, '37315353', 'MILDRED CARRASCAL', '3163763227', 26, 895, 'Calle 217 #217-217');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (218, 1, '37808651', 'MILENA GARCIA', '3102793412', 26, 895, 'Carrera 218 #218-218');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (219, 3, '1098767490', 'MONICA LIZETH MEDINA', '3193156143', 26, 925, 'Calle 219 #219-219');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (220, 1, '1095921942', 'MONICA MILENA LOZANO', '3044084655', 26, 925, 'Carrera 220 #220-220');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (221, 1, '28015711', 'NANCY DANIELA RUIZ', '3118109608', 26, 925, 'Calle 221 #221-221');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (222, 1, '63349194', 'NANCY JAIDIVE URIBE', '3103092409', 21, 833, 'Carrera 222 #222-222');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (223, 1, '1096222422', 'NATALIA ISABEL RAMOS', '3022644384', 26, 950, 'Calle 223 #223-223');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (224, 1, '1005209754', 'NATALIA MARIA ESCOBAR', '3165794512', 26, 950, 'Carrera 224 #224-224');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (225, 1, '28411525', 'NATIVIDAD COLMENARES', '3187596181', 26, 950, 'Calle 225 #225-225');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (226, 1, '28156843', 'NELCY SEQUEDA', '3046441672', 21, 834, 'Carrera 226 #226-226');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (3, 1, '13371125', 'ADOLFO AMAYA', '3012317516', 26, 898, 'Calle 3 #3-03');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (4, 1, '43653995', 'ADRIANA CECILIA GOMEZ', '3205760135', 26, 895, 'Carrera 4 #4-04');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (5, 1, '28034056', 'ADRIANA ISABEL MUNOZ', '3208035741', 21, 834, 'Calle 5 #5-05');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (6, 1, '27937160', 'ALBERTINA BLANCO', '3182961056', 26, 895, 'Carrera 6 #6-06');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (7, 1, '63431102', 'ALCIRA PINZON', '3186943737', 26, 895, 'Calle 7 #7-07');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (8, 1, '28239206', 'ALCIRA SANCHEZ', '3176813724', 26, 895, 'Carrera 8 #8-08');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (9, 1, '28291859', 'ALCIRA SANCHEZ', '3183974480', 21, 834, 'Calle 9 #9-09');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (10, 1, '28295395', 'ALDANA PIMIENTO', '3143303438', 21, 834, 'Carrera 10 #10-10');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (11, 1, '13516603', 'ALEXIS DURAN', '3103185933', 21, 834, 'Calle 11 #11-11');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (12, 1, '28328653', 'ALICIA SANCHEZ', '3504608924', 26, 895, 'Carrera 12 #12-12');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (13, 1, '1065205509', 'ALINSON DE LA HOZ', '3127727258', 26, 895, 'Calle 13 #13-13');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (14, 1, '63361534', 'ALIX CORZO', '3174043516', 21, 833, 'Carrera 14 #14-14');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (15, 1, '13214970', 'ALVARO LANDAZABAL', '3163019406', 26, 895, 'Calle 15 #15-15');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (16, 1, '63477797', 'AMPARO COLMENARES', '3143034077', 26, 895, 'Carrera 16 #16-16');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (17, 1, '63280462', 'ANA BELEN SERRANO', '3012628104', 26, 895, 'Calle 17 #17-17');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (18, 1, '37833225', 'ANA DE DIOS CARRILLO', '3144412027', 1, 1, 'Carrera 18 #18-18');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (19, 1, '28373219', 'ANA DOLORES BAYONA', '3124662058', 26, 895, 'Calle 19 #19-19');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (227, 1, '37794355', 'NELLY CECILIA PENAGOS', '3153564714', 21, 834, 'Calle 227 #227-227');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (228, 1, '91448439', 'NESTOR CARAZO', '3145545607', 21, 834, 'Carrera 228 #228-228');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (229, 1, '40792554', 'NEYLA DEL PILAR ONATE', '3003028016', 21, 834, 'Calle 229 #229-229');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (230, 3, '1098703391', 'NIKOL DANIELA DIAZ', '3156747619', 21, 834, 'Carrera 230 #230-230');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (231, 1, '13375103', 'NOEL SANCHEZ', '3222853966', 26, 950, 'Calle 231 #231-231');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (232, 1, '63441616', 'NOHEMY CABALLERO', '3123167399', 26, 898, 'Carrera 232 #232-232');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (233, 1, '28342542', 'NORHA CASTRO', '3134397732', 26, 898, 'Calle 233 #233-233');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (234, 1, '27789931', 'NUBIA ESPERANZA LATORRE', '3193393731', 26, 898, 'Carrera 234 #234-234');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (235, 1, '51697497', 'ODILIA RUEDA', '3118123397', 26, 898, 'Calle 235 #235-235');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (236, 1, '41585853', 'ODILIA SERRANO', '3153916903', 26, 898, 'Carrera 236 #236-236');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (237, 2, '516976', 'OLEG GOLOMBEK', '3013669245', 26, 898, 'Calle 237 #237-237');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (238, 1, '27763436', 'OLGA FLOREZ', '3174191936', 26, 898, 'Carrera 238 #238-238');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (239, 1, '41647603', 'OLGA NANCY NINO', '3125410246', 26, 898, 'Calle 239 #239-239');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (240, 1, '37822664', 'OLIVA RUEDA', '3165750434', 26, 898, 'Carrera 240 #240-240');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (241, 1, '28495111', 'OMAIRA RUEDA', '3002119368', 21, 818, 'Calle 241 #241-241');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (242, 1, '26676904', 'ORFANELLY CANAS', '3172313623', 26, 898, 'Carrera 242 #242-242');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (271, 4, '1098783472', 'SARAH CAMACHO', '3142773009', 21, 818, 'Calle 271 #271-271');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (272, 1, '1005189926', 'SEBASTIAN GAVIRIA', '3164076647', 21, 818, 'Carrera 272 #272-272');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (273, 1, '1050546472', 'SMITH PEDROZO', '3123030771', 21, 818, 'Calle 273 #273-273');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (274, 1, '1097282027', 'SONIA QUINTERO', '3202205509', 21, 818, 'Carrera 274 #274-274');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (275, 4, '1098822921', 'STEPHANY PAOLA FIGUEROA', '3208203721', 21, 818, 'Calle 275 #275-275');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (276, 1, '49663573', 'STHELLA JAIMES', '3158268516', 21, 818, 'Carrera 276 #276-276');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (277, 4, '1127663736', 'THALIA GUADALUPE GARCIA', '3204133599', 26, 895, 'Calle 277 #277-277');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (278, 1, '12522218', 'VICTOR EUSEBIO DELPORTILLO', '3183740285', 26, 895, 'Carrera 278 #278-278');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (279, 1, '1095794166', 'VICTOR MANUEL LIZARAZO', '3156903049', 26, 895, 'Calle 279 #279-279');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (280, 1, '11788365', 'WILFRIDO RIOS', '3175161425', 26, 895, 'Carrera 280 #280-280');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (281, 4, '1098750980', 'YADY CAROLINA SANCHEZ', '3168966298', 26, 895, 'Calle 281 #281-281');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (282, 1, '28193714', 'YOLANDA ARIZA', '3133921755', 26, 895, 'Carrera 282 #282-282');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (283, 1, '37836760', 'YOLANDA CARRENO', '3153441687', 26, 895, 'Calle 283 #283-283');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (284, 1, '27649936', 'YOLANDA FLOREZ', '3115459046', 26, 895, 'Carrera 284 #284-284');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (285, 1, '37178776', 'YOLANDA MONSALVE', '3112261587', 26, 950, 'Calle 285 #285-285');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (286, 1, '63310904', 'YOLANDA NINO', '3112022346', 26, 950, 'Carrera 286 #286-286');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (287, 1, '28268014', 'ZENAIDA CARDENAS', '3132154008', 26, 950, 'Calle 287 #287-287');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (243, 1, '49650250', 'ORFILIA TRIVINO', '3102954777', 26, 898, 'Calle 243 #243-243');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (244, 1, '91289149', 'OSCAR LEONARDO DIAZ', '3132100410', 26, 898, 'Carrera 244 #244-244');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (245, 1, '13829503', 'PABLO BENAVIDES', '3177726893', 26, 898, 'Calle 245 #245-245');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (246, 2, '4164348', 'PABLO ENRIQUE BERNAL', '3114406235', 26, 898, 'Carrera 246 #246-246');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (247, 1, '63277591', 'PATRICIA ISABEL GOMEZ', '3124820376', 26, 898, 'Calle 247 #247-247');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (248, 1, '91150393', 'PEDRO VICENTE CASTRO', '3156244758', 26, 898, 'Carrera 248 #248-248');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (249, 1, '91226952', 'RAFAEL JARABA', '3126988037', 26, 898, 'Calle 249 #249-249');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (250, 1, '13818567', 'RAFAEL MANTILLA', '3013712770', 26, 898, 'Carrera 250 #250-250');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (251, 1, '5744340', 'RAFAEL ANTONIO ACOSTA', '3138133730', 26, 898, 'Calle 251 #251-251');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (252, 1, '13806426', 'RAMIRO CHAPARRO', '3005202071', 26, 898, 'Carrera 252 #252-252');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (253, 1, '91473533', 'RAMIRO PINZON', '3172260699', 26, 898, 'Calle 253 #253-253');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (254, 1, '91100688', 'RAMON LEON', '3165790234', 26, 898, 'Carrera 254 #254-254');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (255, 1, '63451185', 'RAQUEL LILIANA BULLA', '3154018986', 26, 898, 'Calle 255 #255-255');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (256, 1, '28418780', 'REBECA RUEDA', '3176768860', 26, 898, 'Carrera 256 #256-256');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (257, 1, '19332903', 'RICARDO CARDOZO', '3023507533', 26, 898, 'Calle 257 #257-257');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (258, 1, '91223125', 'RICARDO RODRIGUEZ', '3163793146', 26, 898, 'Carrera 258 #258-258');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (259, 1, '5687004', 'RITO ANTONIO TORRES', '3142582122', 26, 898, 'Calle 259 #259-259');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (260, 1, '91459195', 'ROBINSON ALEXANDER ALVARADO', '3186234107', 26, 898, 'Carrera 260 #260-260');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (261, 3, '1098793344', 'RODRIGO MANRIQUE', '3219536839', 26, 898, 'Calle 261 #261-261');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (262, 1, '37705986', 'ROSA BAUTISTA', '3202086875', 26, 898, 'Carrera 262 #262-262');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (263, 1, '37239382', 'ROSA ELVIA CARVAJAL', '3156730549', 26, 898, 'Calle 263 #263-263');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (264, 1, '28294042', 'ROSALBA MENDEZ', '3142628362', 26, 898, 'Carrera 264 #264-264');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (265, 1, '41440980', 'ROSAURA ORDONEZ', '3108757404', 26, 898, 'Calle 265 #265-265');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (266, 1, '63455618', 'ROSILVIA BORJA', '3045732674', 26, 898, 'Carrera 266 #266-266');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (267, 1, '52259051', 'RUTH FABIOLA SUAREZ', '3164741390', 26, 898, 'Calle 267 #267-267');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (268, 1, '34561606', 'SANDRA ESMERALDA NOGUERA', '3122081524', 26, 950, 'Carrera 268 #268-268');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (269, 4, '1098758853', 'SANDRA MILENA GUEVARA', '3208280258', 26, 895, 'Calle 269 #269-269');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (270, 1, '1067615882', 'SARA ELIZA BENAVIDES', '3006744191', 26, 895, 'Carrera 270 #270-270');
INSERT INTO "William Uribe".pacientes (id, tipo_doc_id, nro_doc, nombre_completo, tel_contacto, departamentos_id, municipios_id, direccion_residencia) VALUES (288, 1, '6350643', 'LUZ MARY SERRANO PORTILLA', '3156473517', 34, 34, 'Main Street 123');


--
-- TOC entry 3636 (class 0 OID 1630356)
-- Dependencies: 230
-- Data for Name: profesionales; Type: TABLE DATA; Schema: William Uribe; Owner: Comfe_owner
--

INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (67, 'SANDRA ISABEL CODERO', true, 11);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (1, 'ALEJANDROTELLO HERNANDEZ', true, 11);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (2, 'ANA MILENAVALDES RINCON', true, 11);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (3, 'ANGELA JULIANAHIGUERA MARTINEZ', true, 11);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (4, 'ANGIOGRAFIASOPT', true, 5);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (5, 'BAJA VISIONY ORTOPTICA', true, 11);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (6, 'BEATRIZTIBADUIZA VARGAS', true, 11);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (7, 'CAMILO ANDRESNINO MORENO', true, 11);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (8, 'CAMPOSVISUALES', true, 11);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (9, 'CARLOS FAHIRROJAS BARAJAS', true, 11);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (10, 'CARLOS JULIANRODRIGUEZ VIVIESCAS', true, 11);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (11, 'CARLOS MARIORANGEL GUALDRON', true, 11);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (12, 'CLAUDIA LILIANACORONEL RAMIREZ', true, 11);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (13, 'DEMODEXCOTA', true, 6);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (14, 'ELECTROFISIOLOGIAOPT', true, 8);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (15, 'EXAMENES COTAGENERAL', true, 12);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (16, 'EXAMENES Y OPTOMETRIASEDE INTERNACIONAL', true, 12);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (17, 'EXAMENESCOTA - 0CT', true, 12);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (18, 'EXAMENESCOTA COMPLEM.', true, 12);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (19, 'EXAMENESSAN GIL', true, 12);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (20, 'EXAMREMIT. INTERN.', true, 12);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (21, 'FEDERICOVELEZ', true, 11);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (24, 'FELLOW1', true, 9);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (22, 'FELIXLEIVA FAJARDO', true, 11);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (23, 'FELLOW IRIDOTOMIASCOTA', true, 10);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (25, 'FELLOW2 IRID Y CAPS', true, 10);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (26, 'FELLOWSEDE INTERNACIONAL', true, 9);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (27, 'FELLOWGLAUCOMA', true, 4);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (28, 'FELLOWMOD 50', true, 11);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (29, 'GERMAN HUMBERTOSOTO REY', true, 3);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (33, 'KAROL DAYANNAQUINTERO ALCANTAR', true, 7);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (34, 'LAURA XIMENAROA REYES', true, 7);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (35, 'LEIDY PAOLAGONZALEZ RODRIGUEZ', true, 9);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (36, 'MARCELACIANCI PENARANDA', true, 9);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (37, 'MARIA ALEJANDRAGOMEZ ROCHA', true, 9);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (38, 'MARIA FERNANDAACUNA VESGA', true, 9);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (39, 'MARIA ISMENIATAPIAS RUIZ', true, 7);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (40, 'MARIA MARGARITAPARRA CASTILLO', true, 7);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (41, 'MAYERLICALDERON RUEDA', true, 7);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (42, 'MELISSA JULIETHOJEDA SALAZAR', true, 7);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (49, 'OCTCOTA', true, 2);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (53, 'PARTICULARESBARRANCA', true, 2);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (54, 'PARTICULARESCACIQUE', true, 2);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (55, 'PARTICULARESDE LA CUESTA', true, 2);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (56, 'PEDRO LUISCARDENAS ANGELONE', true, 9);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (57, 'RAFAEL ENRIQUEDURAN PRADA', true, 11);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (58, 'RUBEN DANIELBERROSPI SALCEDO', true, 11);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (59, 'SANDRA MILENABELTRAN CEDIEL', true, 11);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (60, 'SMITH LARITZALEAL MEDINA', true, 11);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (61, 'VICTOR HUGOSERNA VILLEGAS', true, 11);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (62, 'JOSE FERNANDO GALVIS RAMIREZ', true, 11);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (63, 'VIVIANA ANDREALOPEZ COVALEDA', true, 9);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (64, 'VIVIANA ROCIOFIGUEROA MORALES', true, 9);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (65, 'YUDY MILENARANGEL DUARTE', true, 9);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (66, 'YURLEISYPICON MARINO', true, 9);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (30, 'GERMAN RENEAMADOR ARANDA', true, 1);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (31, 'JOHANNAFUQUEN ROJAS', true, 1);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (32, 'JUAN SEBASTIANABRIL TOSCANO', true, 1);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (43, 'MIGUEL ANDRESSILVA MUNOZ', true, 1);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (44, 'NATALIACORREA VENEGAS', true, 1);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (45, 'NATHALIA JULIANAMORENO CASTRO', true, 1);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (46, 'NELSON AUGUSTOVELASQUEZ GOMEZ', true, 1);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (47, 'NESTOR IVANCARRENO JAIMES', true, 1);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (48, 'NICOLASRIVERO CARDENAS', true, 1);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (50, 'OPTOMETRACITAS Y EXAMENES', true, 9);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (51, 'OPTOMETRIACOTA GLAUCOMA', true, 4);
INSERT INTO "William Uribe".profesionales (id, nombre_prof, activo, profesiones_id) VALUES (52, 'OPTOMETRIASAN GIL', true, 9);


--
-- TOC entry 3648 (class 0 OID 1769481)
-- Dependencies: 300
-- Data for Name: profesiones; Type: TABLE DATA; Schema: William Uribe; Owner: Comfe_owner
--

INSERT INTO "William Uribe".profesiones (id, profesion) VALUES (1, 'RETINOLOGIA');
INSERT INTO "William Uribe".profesiones (id, profesion) VALUES (2, 'VARIOS');
INSERT INTO "William Uribe".profesiones (id, profesion) VALUES (3, 'ORTOPTICA');
INSERT INTO "William Uribe".profesiones (id, profesion) VALUES (4, 'GLAUCOMA');
INSERT INTO "William Uribe".profesiones (id, profesion) VALUES (5, 'ANGIOGRAFIAS');
INSERT INTO "William Uribe".profesiones (id, profesion) VALUES (6, 'DEMODEX');
INSERT INTO "William Uribe".profesiones (id, profesion) VALUES (7, 'OCUPLASTIA');
INSERT INTO "William Uribe".profesiones (id, profesion) VALUES (8, 'ELECTROFISIOLOGIA');
INSERT INTO "William Uribe".profesiones (id, profesion) VALUES (9, 'OPTOMETRIA');
INSERT INTO "William Uribe".profesiones (id, profesion) VALUES (10, 'IRIDOTOMIA');
INSERT INTO "William Uribe".profesiones (id, profesion) VALUES (11, 'OFTALMOLOGIA');
INSERT INTO "William Uribe".profesiones (id, profesion) VALUES (12, 'EXAMENES');
INSERT INTO "William Uribe".profesiones (id, profesion) VALUES (13, 'OFTAL. PEDIATRICA');


--
-- TOC entry 3650 (class 0 OID 1769500)
-- Dependencies: 303
-- Data for Name: tipo_doc; Type: TABLE DATA; Schema: William Uribe; Owner: Comfe_owner
--

INSERT INTO "William Uribe".tipo_doc (id, tipo_doc) VALUES (1, 'CC');
INSERT INTO "William Uribe".tipo_doc (id, tipo_doc) VALUES (2, 'CE');
INSERT INTO "William Uribe".tipo_doc (id, tipo_doc) VALUES (3, 'TI');
INSERT INTO "William Uribe".tipo_doc (id, tipo_doc) VALUES (4, 'RC');
INSERT INTO "William Uribe".tipo_doc (id, tipo_doc) VALUES (5, 'PAS');
INSERT INTO "William Uribe".tipo_doc (id, tipo_doc) VALUES (6, 'PEP');
INSERT INTO "William Uribe".tipo_doc (id, tipo_doc) VALUES (8, 'NV');


--
-- TOC entry 3638 (class 0 OID 1630419)
-- Dependencies: 240
-- Data for Name: tipos_citas; Type: TABLE DATA; Schema: William Uribe; Owner: Comfe_owner
--

INSERT INTO "William Uribe".tipos_citas (id, tipo_cita) VALUES (1, 'ABERROMETRIA');
INSERT INTO "William Uribe".tipos_citas (id, tipo_cita) VALUES (2, 'ANGIOGRAFIA');
INSERT INTO "William Uribe".tipos_citas (id, tipo_cita) VALUES (3, 'BIOMETRIA');
INSERT INTO "William Uribe".tipos_citas (id, tipo_cita) VALUES (4, 'CAMPO VISUAL');
INSERT INTO "William Uribe".tipos_citas (id, tipo_cita) VALUES (5, 'CAPSULOTOMIA');
INSERT INTO "William Uribe".tipos_citas (id, tipo_cita) VALUES (6, 'CONSULTA DE BAJA VISION');
INSERT INTO "William Uribe".tipos_citas (id, tipo_cita) VALUES (7, 'CONSULTA DE OCULOPLASTIA');
INSERT INTO "William Uribe".tipos_citas (id, tipo_cita) VALUES (8, 'CONSULTA DE ORTOPTICA');
INSERT INTO "William Uribe".tipos_citas (id, tipo_cita) VALUES (9, 'CONSULTA DE RETINA');
INSERT INTO "William Uribe".tipos_citas (id, tipo_cita) VALUES (10, 'CONTROL');
INSERT INTO "William Uribe".tipos_citas (id, tipo_cita) VALUES (11, 'CONTROL CON OPTOMETRIA');
INSERT INTO "William Uribe".tipos_citas (id, tipo_cita) VALUES (12, 'CONTROL LASER');
INSERT INTO "William Uribe".tipos_citas (id, tipo_cita) VALUES (13, 'CONTROL POP');
INSERT INTO "William Uribe".tipos_citas (id, tipo_cita) VALUES (14, 'CONTROL POP CON OPTOMETRIA');
INSERT INTO "William Uribe".tipos_citas (id, tipo_cita) VALUES (15, 'CONTROL POP LASIK');
INSERT INTO "William Uribe".tipos_citas (id, tipo_cita) VALUES (16, 'DEMODEX');
INSERT INTO "William Uribe".tipos_citas (id, tipo_cita) VALUES (17, 'EXAMENES');
INSERT INTO "William Uribe".tipos_citas (id, tipo_cita) VALUES (18, 'FOTOCOAGULACION');
INSERT INTO "William Uribe".tipos_citas (id, tipo_cita) VALUES (19, 'FOTOS DE SEGMENTO ANTERIOR');
INSERT INTO "William Uribe".tipos_citas (id, tipo_cita) VALUES (20, 'FOTOS DE SEGMENTO POSTERIOR');
INSERT INTO "William Uribe".tipos_citas (id, tipo_cita) VALUES (21, 'IRIDOTOMIA');
INSERT INTO "William Uribe".tipos_citas (id, tipo_cita) VALUES (22, 'OCT - ANGIOGRAFIA');
INSERT INTO "William Uribe".tipos_citas (id, tipo_cita) VALUES (23, 'OCT MACULAR');
INSERT INTO "William Uribe".tipos_citas (id, tipo_cita) VALUES (24, 'OCT CAPA DE FIBRAS NERVIOSAS');
INSERT INTO "William Uribe".tipos_citas (id, tipo_cita) VALUES (25, 'OFTALMOLOGIA');
INSERT INTO "William Uribe".tipos_citas (id, tipo_cita) VALUES (26, 'OFTALMOLOGIA CON EXAMENES');
INSERT INTO "William Uribe".tipos_citas (id, tipo_cita) VALUES (27, 'OFTALMOLOGIA EVENTO');
INSERT INTO "William Uribe".tipos_citas (id, tipo_cita) VALUES (28, 'OFTALMOLOGIA PEDIATRICA');
INSERT INTO "William Uribe".tipos_citas (id, tipo_cita) VALUES (29, 'OFTALMOLOGIA SAN GIL');
INSERT INTO "William Uribe".tipos_citas (id, tipo_cita) VALUES (30, 'OPTOMETRIA');
INSERT INTO "William Uribe".tipos_citas (id, tipo_cita) VALUES (31, 'OPTOMETRIA EVENTO');
INSERT INTO "William Uribe".tipos_citas (id, tipo_cita) VALUES (32, 'PAQUIMETRIA');
INSERT INTO "William Uribe".tipos_citas (id, tipo_cita) VALUES (33, 'POTENCIALES EVOCADOS');
INSERT INTO "William Uribe".tipos_citas (id, tipo_cita) VALUES (34, 'PREQUIRURGICA');
INSERT INTO "William Uribe".tipos_citas (id, tipo_cita) VALUES (35, 'PREQUIRURGICA CATARATA');
INSERT INTO "William Uribe".tipos_citas (id, tipo_cita) VALUES (36, 'PREQUIRURGICA LASER');
INSERT INTO "William Uribe".tipos_citas (id, tipo_cita) VALUES (37, 'RECUENTO ENDOTELIAL');
INSERT INTO "William Uribe".tipos_citas (id, tipo_cita) VALUES (38, 'TONOGRAFIA CON PRUEBAS PROVOCATIVAS');
INSERT INTO "William Uribe".tipos_citas (id, tipo_cita) VALUES (39, 'TOPOGRAFIA');
INSERT INTO "William Uribe".tipos_citas (id, tipo_cita) VALUES (40, 'TERAPIA VISUAL PROFUNDA');


--
-- TOC entry 3646 (class 0 OID 1753093)
-- Dependencies: 290
-- Data for Name: usuarios; Type: TABLE DATA; Schema: William Uribe; Owner: Comfe_owner
--

INSERT INTO "William Uribe".usuarios (id, nom_usr, "user") VALUES (1, 'JUAN FRANCISCO MEJIA MEJIA', 'J.MEJIA');
INSERT INTO "William Uribe".usuarios (id, nom_usr, "user") VALUES (2, 'NEYLA ROCIO GOMEZ FERREIRA', 'N.GOMEZ');
INSERT INTO "William Uribe".usuarios (id, nom_usr, "user") VALUES (3, 'ANA MARIA CARVAJAL CASANOVA', 'A.CARVAJAL');
INSERT INTO "William Uribe".usuarios (id, nom_usr, "user") VALUES (4, 'JENNIFER TATIANA RIANO SARMIENTO', 'J.RIANO');
INSERT INTO "William Uribe".usuarios (id, nom_usr, "user") VALUES (5, 'MARIA ESPERANZA MEJIA OTERO', 'M.MEJIA');
INSERT INTO "William Uribe".usuarios (id, nom_usr, "user") VALUES (6, 'SNEIDER VELOZA CALDERON', 'S.CALDERON');
INSERT INTO "William Uribe".usuarios (id, nom_usr, "user") VALUES (7, 'BLEIDY YULIANA GALLO MUNOZ', 'B.GALLO');
INSERT INTO "William Uribe".usuarios (id, nom_usr, "user") VALUES (8, 'JUAN SEBASTIAN ARDILA LASCARRO', 'J.ARDILA');
INSERT INTO "William Uribe".usuarios (id, nom_usr, "user") VALUES (9, 'BLANCA MELENDEZ ARIAS', 'B.ARIAS');
INSERT INTO "William Uribe".usuarios (id, nom_usr, "user") VALUES (10, 'DAYIDIS RODRIGUEZ SANCHEZ', 'D.SANCHEZ');
INSERT INTO "William Uribe".usuarios (id, nom_usr, "user") VALUES (11, 'GLADYS YANETH MANRIQUE BALLESTEROS', 'G.MANRIQUE');
INSERT INTO "William Uribe".usuarios (id, nom_usr, "user") VALUES (12, 'SANDRA CUADROS', 'S.CUADROS');
INSERT INTO "William Uribe".usuarios (id, nom_usr, "user") VALUES (13, 'OLGA LUCIA PINZON AYALA', 'O.PINZON');
INSERT INTO "William Uribe".usuarios (id, nom_usr, "user") VALUES (14, 'MILENA RAFAELA ESTRADA MORA', 'M.ESTRADA');
INSERT INTO "William Uribe".usuarios (id, nom_usr, "user") VALUES (15, 'CAMILA ANDREA PLATA URIBE', 'C.PLATA');
INSERT INTO "William Uribe".usuarios (id, nom_usr, "user") VALUES (16, 'HECTOR ALONSO GUTIERREZ RODRIGUEZ', 'H.GUTIERREZ');
INSERT INTO "William Uribe".usuarios (id, nom_usr, "user") VALUES (17, 'LINA GIZETH MURILLO MANTILLA', 'L.MURILLO');
INSERT INTO "William Uribe".usuarios (id, nom_usr, "user") VALUES (18, 'YURLEY TATIANA CARDENAS LEON', 'Y.CARDENAS');
INSERT INTO "William Uribe".usuarios (id, nom_usr, "user") VALUES (19, 'LEIDY ALEJANDRA MUNOZ AVILA', 'L.MUNOZ');
INSERT INTO "William Uribe".usuarios (id, nom_usr, "user") VALUES (20, 'OLGA MILENA GUALDRON BASTILLA', 'O.GUALDRON');
INSERT INTO "William Uribe".usuarios (id, nom_usr, "user") VALUES (21, 'DANIELA ZULEIMY PINZON TOLOZA', 'D.PINZON');
INSERT INTO "William Uribe".usuarios (id, nom_usr, "user") VALUES (22, 'NICOLAS GOMEZ RUEDA', 'N.RUEDA');
INSERT INTO "William Uribe".usuarios (id, nom_usr, "user") VALUES (23, 'TAREAS AUTOMATICAS', 'T.AUTOMATICAS');
INSERT INTO "William Uribe".usuarios (id, nom_usr, "user") VALUES (24, 'JOHAN SEBASTIAN CASANOVA SOTELO', 'J.CASANOVA');
INSERT INTO "William Uribe".usuarios (id, nom_usr, "user") VALUES (25, 'MAYERLYN VANESSA VERA VARGAS', 'M.VERA');
INSERT INTO "William Uribe".usuarios (id, nom_usr, "user") VALUES (26, 'JENNIFER VANESSA DIAZ AVILA', 'J.DIAZ');
INSERT INTO "William Uribe".usuarios (id, nom_usr, "user") VALUES (27, 'LUCERO SANABRIA ROMERO', 'L.ROMERO');
INSERT INTO "William Uribe".usuarios (id, nom_usr, "user") VALUES (28, 'ELCIDA LOPEZ CARRENO', 'E.CARRENO');
INSERT INTO "William Uribe".usuarios (id, nom_usr, "user") VALUES (29, 'LILIANA VEGA MENDOZA', 'L.MENDOZA');
INSERT INTO "William Uribe".usuarios (id, nom_usr, "user") VALUES (30, 'HAROL JHIOSETH CHINOMES CACERES', 'H.CHINOMES');
INSERT INTO "William Uribe".usuarios (id, nom_usr, "user") VALUES (31, 'OLGA ROCIO RIOS MERCHAN', 'O.RIOS');
INSERT INTO "William Uribe".usuarios (id, nom_usr, "user") VALUES (32, 'LUZ KARINE HERNANDEZ MONTANEZ', 'L.HERNANDEZ');
INSERT INTO "William Uribe".usuarios (id, nom_usr, "user") VALUES (33, 'STEPHANIE CARDENAS PINZON', 'S.PINZON');
INSERT INTO "William Uribe".usuarios (id, nom_usr, "user") VALUES (34, 'LEYDI MARCELA RANGEL BARRERA', 'L.RANGEL');
INSERT INTO "William Uribe".usuarios (id, nom_usr, "user") VALUES (35, 'YORLEY BIBIANA CONDE PENA', 'Y.CONDE');
INSERT INTO "William Uribe".usuarios (id, nom_usr, "user") VALUES (36, 'XIMENA MARTINEZ ALVAREZ', 'X.ALVAREZ');
INSERT INTO "William Uribe".usuarios (id, nom_usr, "user") VALUES (37, 'DIANA MARCELA ARCHILA TELLEZ', 'D.ARCHILA');
INSERT INTO "William Uribe".usuarios (id, nom_usr, "user") VALUES (38, 'LISSET TATIANA QUINONEZ CRISTANCHO', 'L.QUINONEZ');
INSERT INTO "William Uribe".usuarios (id, nom_usr, "user") VALUES (39, 'CINDY JOHANNA SANCHEZ OJEDA', 'C.SANCHEZ');
INSERT INTO "William Uribe".usuarios (id, nom_usr, "user") VALUES (40, 'NORMA ROCIO PICO AYALA', 'N.PICO');
INSERT INTO "William Uribe".usuarios (id, nom_usr, "user") VALUES (41, 'NICOLAS RIVERO CARDENAS', 'N.CARDENAS');
INSERT INTO "William Uribe".usuarios (id, nom_usr, "user") VALUES (42, 'YEIMY LILIANA SERRANO VELASCO', 'Y.SERRANO');
INSERT INTO "William Uribe".usuarios (id, nom_usr, "user") VALUES (43, 'BREILY ZARETH CAMACHO CASTILLO', 'B.CAMACHO');
INSERT INTO "William Uribe".usuarios (id, nom_usr, "user") VALUES (44, 'MILAGROS NAMIBIA MARTINEZ SUAREZ', 'M.MARTINEZ');
INSERT INTO "William Uribe".usuarios (id, nom_usr, "user") VALUES (45, 'MAYERLY MONCADA NORENA', 'M.NORENA');
INSERT INTO "William Uribe".usuarios (id, nom_usr, "user") VALUES (46, 'JHOINER ANTONIO ESQUIVEL NAVARRO', 'J.ESQUIVEL');
INSERT INTO "William Uribe".usuarios (id, nom_usr, "user") VALUES (47, 'LAURA MARCELA RODRIGUEZ APARICIO', 'L.RODRIGUEZ');
INSERT INTO "William Uribe".usuarios (id, nom_usr, "user") VALUES (48, 'SANDRA MILENA CARMONA ARIAS', 'S.CARMONA');
INSERT INTO "William Uribe".usuarios (id, nom_usr, "user") VALUES (49, 'LENI JOHANA SINUCO MARTINEZ', 'L.SINUCO');
INSERT INTO "William Uribe".usuarios (id, nom_usr, "user") VALUES (50, 'INGRID PIEDAD PADILLA CONTRERAS', 'I.PADILLA');
INSERT INTO "William Uribe".usuarios (id, nom_usr, "user") VALUES (51, 'WILLIAM JOSE URIBE', 'W.URIBE');
INSERT INTO "William Uribe".usuarios (id, nom_usr, "user") VALUES (52, 'LUCILA RUEDA PLATA', 'L.RUEDA');


--
-- TOC entry 3673 (class 0 OID 0)
-- Dependencies: 260
-- Name: citas_id_seq; Type: SEQUENCE SET; Schema: William Uribe; Owner: Comfe_owner
--

SELECT pg_catalog.setval('"William Uribe".citas_id_seq', 292, true);


--
-- TOC entry 3674 (class 0 OID 0)
-- Dependencies: 257
-- Name: consultorios_id_seq; Type: SEQUENCE SET; Schema: William Uribe; Owner: Comfe_owner
--

SELECT pg_catalog.setval('"William Uribe".consultorios_id_seq', 11, true);


--
-- TOC entry 3675 (class 0 OID 0)
-- Dependencies: 225
-- Name: convenios_id_seq; Type: SEQUENCE SET; Schema: William Uribe; Owner: Comfe_owner
--

SELECT pg_catalog.setval('"William Uribe".convenios_id_seq', 29, true);


--
-- TOC entry 3676 (class 0 OID 0)
-- Dependencies: 221
-- Name: departamento_id_seq; Type: SEQUENCE SET; Schema: William Uribe; Owner: Comfe_owner
--

SELECT pg_catalog.setval('"William Uribe".departamento_id_seq', 34, true);


--
-- TOC entry 3677 (class 0 OID 0)
-- Dependencies: 239
-- Name: especialidades_id_seq; Type: SEQUENCE SET; Schema: William Uribe; Owner: Comfe_owner
--

SELECT pg_catalog.setval('"William Uribe".especialidades_id_seq', 40, true);


--
-- TOC entry 3678 (class 0 OID 0)
-- Dependencies: 287
-- Name: est_cita_id_seq; Type: SEQUENCE SET; Schema: William Uribe; Owner: Comfe_owner
--

SELECT pg_catalog.setval('"William Uribe".est_cita_id_seq', 5, true);


--
-- TOC entry 3679 (class 0 OID 0)
-- Dependencies: 223
-- Name: municipios_id_seq; Type: SEQUENCE SET; Schema: William Uribe; Owner: Comfe_owner
--

SELECT pg_catalog.setval('"William Uribe".municipios_id_seq', 1120, true);


--
-- TOC entry 3680 (class 0 OID 0)
-- Dependencies: 305
-- Name: pacientes_id_seq; Type: SEQUENCE SET; Schema: William Uribe; Owner: Comfe_owner
--

SELECT pg_catalog.setval('"William Uribe".pacientes_id_seq', 288, true);


--
-- TOC entry 3681 (class 0 OID 0)
-- Dependencies: 229
-- Name: profesionales_id_seq; Type: SEQUENCE SET; Schema: William Uribe; Owner: Comfe_owner
--

SELECT pg_catalog.setval('"William Uribe".profesionales_id_seq', 67, true);


--
-- TOC entry 3682 (class 0 OID 0)
-- Dependencies: 299
-- Name: profesiones_id_seq; Type: SEQUENCE SET; Schema: William Uribe; Owner: Comfe_owner
--

SELECT pg_catalog.setval('"William Uribe".profesiones_id_seq', 13, true);


--
-- TOC entry 3683 (class 0 OID 0)
-- Dependencies: 302
-- Name: tipo_doc_id_seq; Type: SEQUENCE SET; Schema: William Uribe; Owner: Comfe_owner
--

SELECT pg_catalog.setval('"William Uribe".tipo_doc_id_seq', 8, true);


--
-- TOC entry 3684 (class 0 OID 0)
-- Dependencies: 289
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: William Uribe; Owner: Comfe_owner
--

SELECT pg_catalog.setval('"William Uribe".usuarios_id_seq', 52, true);


--
-- TOC entry 3451 (class 2606 OID 1654804)
-- Name: citas citas_pkey; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".citas
    ADD CONSTRAINT citas_pkey PRIMARY KEY (id);


--
-- TOC entry 3447 (class 2606 OID 1654790)
-- Name: consultorios consultorios_pkey; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".consultorios
    ADD CONSTRAINT consultorios_pkey PRIMARY KEY (id);


--
-- TOC entry 3435 (class 2606 OID 1630347)
-- Name: convenios convenios_pkey; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".convenios
    ADD CONSTRAINT convenios_pkey PRIMARY KEY (id);


--
-- TOC entry 3429 (class 2606 OID 1630279)
-- Name: departamentos departamento_pkey; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".departamentos
    ADD CONSTRAINT departamento_pkey PRIMARY KEY (id);


--
-- TOC entry 3443 (class 2606 OID 1630424)
-- Name: tipos_citas especialidades_pkey; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".tipos_citas
    ADD CONSTRAINT especialidades_pkey PRIMARY KEY (id);


--
-- TOC entry 3453 (class 2606 OID 1736710)
-- Name: est_cita est_cita_pkey; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".est_cita
    ADD CONSTRAINT est_cita_pkey PRIMARY KEY (id);


--
-- TOC entry 3433 (class 2606 OID 1630340)
-- Name: municipios municipios_pkey; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".municipios
    ADD CONSTRAINT municipios_pkey PRIMARY KEY (id);


--
-- TOC entry 3469 (class 2606 OID 1769540)
-- Name: pacientes pacientes_pkey; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".pacientes
    ADD CONSTRAINT pacientes_pkey PRIMARY KEY (id);


--
-- TOC entry 3439 (class 2606 OID 1630361)
-- Name: profesionales profesionales_pkey; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".profesionales
    ADD CONSTRAINT profesionales_pkey PRIMARY KEY (id);


--
-- TOC entry 3461 (class 2606 OID 1769486)
-- Name: profesiones profesiones_pkey; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".profesiones
    ADD CONSTRAINT profesiones_pkey PRIMARY KEY (id);


--
-- TOC entry 3423 (class 2606 OID 1712197)
-- Name: consultorios solo_mayusc_consult; Type: CHECK CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE "William Uribe".consultorios
    ADD CONSTRAINT solo_mayusc_consult CHECK ((upper((nombre_consultorio)::text) = (nombre_consultorio)::text)) NOT VALID;


--
-- TOC entry 3421 (class 2606 OID 1712206)
-- Name: convenios solo_mayusc_convenio; Type: CHECK CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE "William Uribe".convenios
    ADD CONSTRAINT solo_mayusc_convenio CHECK ((upper((nom_convenio)::text) = (nom_convenio)::text)) NOT VALID;


--
-- TOC entry 3419 (class 2606 OID 1712207)
-- Name: departamentos solo_mayusc_depto; Type: CHECK CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE "William Uribe".departamentos
    ADD CONSTRAINT solo_mayusc_depto CHECK ((upper((nom_dpto)::text) = (nom_dpto)::text)) NOT VALID;


--
-- TOC entry 3424 (class 2606 OID 1744896)
-- Name: est_cita solo_mayusc_estado; Type: CHECK CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE "William Uribe".est_cita
    ADD CONSTRAINT solo_mayusc_estado CHECK ((upper((estado)::text) = (estado)::text)) NOT VALID;


--
-- TOC entry 3420 (class 2606 OID 1712216)
-- Name: municipios solo_mayusc_municp; Type: CHECK CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE "William Uribe".municipios
    ADD CONSTRAINT solo_mayusc_municp CHECK ((upper((nom_municip)::text) = (nom_municip)::text)) NOT VALID;


--
-- TOC entry 3422 (class 2606 OID 1712219)
-- Name: profesionales solo_mayusc_nombre_prof; Type: CHECK CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE "William Uribe".profesionales
    ADD CONSTRAINT solo_mayusc_nombre_prof CHECK ((upper((nombre_prof)::text) = (nombre_prof)::text)) NOT VALID;


--
-- TOC entry 3427 (class 2606 OID 1769541)
-- Name: pacientes solo_mayusc_paciente_nomb; Type: CHECK CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE "William Uribe".pacientes
    ADD CONSTRAINT solo_mayusc_paciente_nomb CHECK ((upper((nombre_completo)::text) = (nombre_completo)::text)) NOT VALID;


--
-- TOC entry 3465 (class 2606 OID 1769505)
-- Name: tipo_doc tipo_doc_pkey; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".tipo_doc
    ADD CONSTRAINT tipo_doc_pkey PRIMARY KEY (id);


--
-- TOC entry 3426 (class 2606 OID 1769508)
-- Name: tipo_doc tipodoc_mayus; Type: CHECK CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE "William Uribe".tipo_doc
    ADD CONSTRAINT tipodoc_mayus CHECK ((upper((tipo_doc)::text) = (tipo_doc)::text)) NOT VALID;


--
-- TOC entry 3449 (class 2606 OID 1769494)
-- Name: consultorios unico_consultorio; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".consultorios
    ADD CONSTRAINT unico_consultorio UNIQUE (nombre_consultorio);


--
-- TOC entry 3437 (class 2606 OID 1769492)
-- Name: convenios unico_convenio; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".convenios
    ADD CONSTRAINT unico_convenio UNIQUE (nom_convenio);


--
-- TOC entry 3431 (class 2606 OID 1769490)
-- Name: departamentos unico_depto; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".departamentos
    ADD CONSTRAINT unico_depto UNIQUE (nom_dpto);


--
-- TOC entry 3455 (class 2606 OID 1769473)
-- Name: usuarios unico_nombre; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".usuarios
    ADD CONSTRAINT unico_nombre UNIQUE (nom_usr);


--
-- TOC entry 3441 (class 2606 OID 1769479)
-- Name: profesionales unico_nombreprof; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".profesionales
    ADD CONSTRAINT unico_nombreprof UNIQUE (nombre_prof);


--
-- TOC entry 3463 (class 2606 OID 1769488)
-- Name: profesiones unico_profesiones; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".profesiones
    ADD CONSTRAINT unico_profesiones UNIQUE (profesion);


--
-- TOC entry 3445 (class 2606 OID 1769477)
-- Name: tipos_citas unico_tipocita; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".tipos_citas
    ADD CONSTRAINT unico_tipocita UNIQUE (tipo_cita);


--
-- TOC entry 3467 (class 2606 OID 1769507)
-- Name: tipo_doc unico_tipodoc; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".tipo_doc
    ADD CONSTRAINT unico_tipodoc UNIQUE (tipo_doc);


--
-- TOC entry 3457 (class 2606 OID 1769475)
-- Name: usuarios unico_usr; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".usuarios
    ADD CONSTRAINT unico_usr UNIQUE ("user");


--
-- TOC entry 3459 (class 2606 OID 1753099)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 3472 (class 2606 OID 1785881)
-- Name: citas fk_consultorio; Type: FK CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".citas
    ADD CONSTRAINT fk_consultorio FOREIGN KEY (consultorios_id) REFERENCES "William Uribe".consultorios(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3473 (class 2606 OID 1785876)
-- Name: citas fk_convenios; Type: FK CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".citas
    ADD CONSTRAINT fk_convenios FOREIGN KEY (convenios_id) REFERENCES "William Uribe".convenios(id) NOT VALID;


--
-- TOC entry 3479 (class 2606 OID 1785906)
-- Name: pacientes fk_dpto; Type: FK CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".pacientes
    ADD CONSTRAINT fk_dpto FOREIGN KEY (departamentos_id) REFERENCES "William Uribe".departamentos(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3474 (class 2606 OID 1785896)
-- Name: citas fk_estcita; Type: FK CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".citas
    ADD CONSTRAINT fk_estcita FOREIGN KEY (est_cita_id) REFERENCES "William Uribe".est_cita(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3480 (class 2606 OID 1785911)
-- Name: pacientes fk_mnpio; Type: FK CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".pacientes
    ADD CONSTRAINT fk_mnpio FOREIGN KEY (municipios_id) REFERENCES "William Uribe".municipios(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3470 (class 2606 OID 1785866)
-- Name: municipios fk_munip; Type: FK CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".municipios
    ADD CONSTRAINT fk_munip FOREIGN KEY (departamentos_id) REFERENCES "William Uribe".departamentos(id) NOT VALID;


--
-- TOC entry 3475 (class 2606 OID 1785871)
-- Name: citas fk_pacientes; Type: FK CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".citas
    ADD CONSTRAINT fk_pacientes FOREIGN KEY (pacientes_id) REFERENCES "William Uribe".pacientes(id) NOT VALID;


--
-- TOC entry 3476 (class 2606 OID 1785886)
-- Name: citas fk_profesional; Type: FK CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".citas
    ADD CONSTRAINT fk_profesional FOREIGN KEY (profesionales_id) REFERENCES "William Uribe".profesionales(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3471 (class 2606 OID 1785856)
-- Name: profesionales fk_profesiones; Type: FK CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".profesionales
    ADD CONSTRAINT fk_profesiones FOREIGN KEY (profesiones_id) REFERENCES "William Uribe".profesiones(id) NOT VALID;


--
-- TOC entry 3477 (class 2606 OID 1785891)
-- Name: citas fk_tipo_cita; Type: FK CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".citas
    ADD CONSTRAINT fk_tipo_cita FOREIGN KEY (tipos_citas_id) REFERENCES "William Uribe".tipos_citas(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3481 (class 2606 OID 1785861)
-- Name: pacientes fk_tipodoc; Type: FK CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".pacientes
    ADD CONSTRAINT fk_tipodoc FOREIGN KEY (tipo_doc_id) REFERENCES "William Uribe".tipo_doc(id) NOT VALID;


--
-- TOC entry 3478 (class 2606 OID 1785901)
-- Name: citas fk_users; Type: FK CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".citas
    ADD CONSTRAINT fk_users FOREIGN KEY (usuarios_id) REFERENCES "William Uribe".usuarios(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


-- Completed on 2025-03-07 21:24:28

--
-- PostgreSQL database dump complete
--


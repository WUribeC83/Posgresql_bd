--
-- PostgreSQL database dump
--

-- Dumped from database version 16.8
-- Dumped by pg_dump version 17.2

-- Started on 2025-03-12 20:41:02

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
-- TOC entry 3668 (class 0 OID 0)
-- Dependencies: 8
-- Name: SCHEMA "William Uribe"; Type: COMMENT; Schema: -; Owner: Comfe_owner
--

COMMENT ON SCHEMA "William Uribe" IS 'BD  Asignacion Citas,  para IPS especializada en temas de salud visual, ubicada en la ciudad de Bucaramanga, para tener el record de las citas asignadas en la misma.';


--
-- TOC entry 333 (class 1255 OID 1769549)
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

--
-- TOC entry 335 (class 1255 OID 1851457)
-- Name: crear_consultorio(character varying); Type: PROCEDURE; Schema: William Uribe; Owner: Comfe_owner
--

CREATE PROCEDURE "William Uribe".crear_consultorio(IN namec character varying)
    LANGUAGE plpgsql
    AS $$BEGIN
   INSERT INTO "William Uribe".consultorios (nombre_consultorio) VALUES (UPPER(namec));
   RAISE NOTICE 'Inserción exitosa en consultorios';
END;$$;


ALTER PROCEDURE "William Uribe".crear_consultorio(IN namec character varying) OWNER TO "Comfe_owner";

--
-- TOC entry 3669 (class 0 OID 0)
-- Dependencies: 335
-- Name: PROCEDURE crear_consultorio(IN namec character varying); Type: COMMENT; Schema: William Uribe; Owner: Comfe_owner
--

COMMENT ON PROCEDURE "William Uribe".crear_consultorio(IN namec character varying) IS 'Proceso para Crear Consultorios';


--
-- TOC entry 336 (class 1255 OID 1851458)
-- Name: crear_convenio(character varying); Type: PROCEDURE; Schema: William Uribe; Owner: Comfe_owner
--

CREATE PROCEDURE "William Uribe".crear_convenio(IN nom_conv character varying)
    LANGUAGE plpgsql
    AS $$BEGIN
   INSERT INTO "William Uribe".convenios (nom_convenio) VALUES (UPPER(nom_conv));
END;$$;


ALTER PROCEDURE "William Uribe".crear_convenio(IN nom_conv character varying) OWNER TO "Comfe_owner";

--
-- TOC entry 3670 (class 0 OID 0)
-- Dependencies: 336
-- Name: PROCEDURE crear_convenio(IN nom_conv character varying); Type: COMMENT; Schema: William Uribe; Owner: Comfe_owner
--

COMMENT ON PROCEDURE "William Uribe".crear_convenio(IN nom_conv character varying) IS 'creacion de convenios';


--
-- TOC entry 338 (class 1255 OID 1884161)
-- Name: crear_profesionales(character varying, integer, boolean); Type: PROCEDURE; Schema: William Uribe; Owner: Comfe_owner
--

CREATE PROCEDURE "William Uribe".crear_profesionales(IN nam character varying, IN profesion integer, IN activ boolean DEFAULT true)
    LANGUAGE plpgsql
    AS $$BEGIN
   INSERT INTO "William Uribe".profesionales (nombre_prof, activo,profesiones_id) 
   VALUES (nam,active,profesion);
END;$$;


ALTER PROCEDURE "William Uribe".crear_profesionales(IN nam character varying, IN profesion integer, IN activ boolean) OWNER TO "Comfe_owner";

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
-- TOC entry 3671 (class 0 OID 0)
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
-- TOC entry 3672 (class 0 OID 0)
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
-- TOC entry 3673 (class 0 OID 0)
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
-- TOC entry 3674 (class 0 OID 0)
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
-- TOC entry 3675 (class 0 OID 0)
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
-- TOC entry 3676 (class 0 OID 0)
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
-- TOC entry 3677 (class 0 OID 0)
-- Dependencies: 223
-- Name: municipios_id_seq; Type: SEQUENCE OWNED BY; Schema: William Uribe; Owner: Comfe_owner
--

ALTER SEQUENCE "William Uribe".municipios_id_seq OWNED BY "William Uribe".municipios.id;


--
-- TOC entry 296 (class 1259 OID 1769534)
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
-- TOC entry 297 (class 1259 OID 1769537)
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
-- TOC entry 3678 (class 0 OID 0)
-- Dependencies: 297
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
-- TOC entry 3679 (class 0 OID 0)
-- Dependencies: 229
-- Name: profesionales_id_seq; Type: SEQUENCE OWNED BY; Schema: William Uribe; Owner: Comfe_owner
--

ALTER SEQUENCE "William Uribe".profesionales_id_seq OWNED BY "William Uribe".profesionales.id;


--
-- TOC entry 292 (class 1259 OID 1769481)
-- Name: profesiones; Type: TABLE; Schema: William Uribe; Owner: Comfe_owner
--

CREATE TABLE "William Uribe".profesiones (
    id integer NOT NULL,
    profesion character varying(40)
);


ALTER TABLE "William Uribe".profesiones OWNER TO "Comfe_owner";

--
-- TOC entry 291 (class 1259 OID 1769480)
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
-- TOC entry 3680 (class 0 OID 0)
-- Dependencies: 291
-- Name: profesiones_id_seq; Type: SEQUENCE OWNED BY; Schema: William Uribe; Owner: Comfe_owner
--

ALTER SEQUENCE "William Uribe".profesiones_id_seq OWNED BY "William Uribe".profesiones.id;


--
-- TOC entry 295 (class 1259 OID 1769500)
-- Name: tipo_doc; Type: TABLE; Schema: William Uribe; Owner: Comfe_owner
--

CREATE TABLE "William Uribe".tipo_doc (
    id integer NOT NULL,
    tipo_doc character varying(3)
);


ALTER TABLE "William Uribe".tipo_doc OWNER TO "Comfe_owner";

--
-- TOC entry 294 (class 1259 OID 1769499)
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
-- TOC entry 3681 (class 0 OID 0)
-- Dependencies: 294
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
-- TOC entry 3682 (class 0 OID 0)
-- Dependencies: 289
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: William Uribe; Owner: Comfe_owner
--

ALTER SEQUENCE "William Uribe".usuarios_id_seq OWNED BY "William Uribe".usuarios.id;


--
-- TOC entry 310 (class 1259 OID 1794167)
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
-- TOC entry 3683 (class 0 OID 0)
-- Dependencies: 310
-- Name: VIEW v_informe_detallado; Type: COMMENT; Schema: William Uribe; Owner: Comfe_owner
--

COMMENT ON VIEW "William Uribe".v_informe_detallado IS 'Informe Detalllado de Citas';


--
-- TOC entry 312 (class 1259 OID 1802240)
-- Name: v_ranking_prof_tot; Type: VIEW; Schema: William Uribe; Owner: Comfe_owner
--

CREATE VIEW "William Uribe".v_ranking_prof_tot AS
 SELECT profesional,
    count(*) AS cant
   FROM "William Uribe".v_informe_detallado vis
  GROUP BY profesional
  ORDER BY (count(*)) DESC;


ALTER VIEW "William Uribe".v_ranking_prof_tot OWNER TO "Comfe_owner";

--
-- TOC entry 3684 (class 0 OID 0)
-- Dependencies: 312
-- Name: VIEW v_ranking_prof_tot; Type: COMMENT; Schema: William Uribe; Owner: Comfe_owner
--

COMMENT ON VIEW "William Uribe".v_ranking_prof_tot IS 'Ranking General de profesionales';


--
-- TOC entry 323 (class 1259 OID 1851439)
-- Name: v_ranking_profesional_mes; Type: VIEW; Schema: William Uribe; Owner: Comfe_owner
--

CREATE VIEW "William Uribe".v_ranking_profesional_mes AS
 SELECT EXTRACT(year FROM fecha_cita) AS year,
    EXTRACT(month FROM fecha_cita) AS mes,
    profesional,
    count(*) AS cant
   FROM "William Uribe".v_informe_detallado vis
  GROUP BY (EXTRACT(year FROM fecha_cita)), (EXTRACT(month FROM fecha_cita)), profesional
  ORDER BY (EXTRACT(year FROM fecha_cita)), (EXTRACT(month FROM fecha_cita)), (count(*)) DESC;


ALTER VIEW "William Uribe".v_ranking_profesional_mes OWNER TO "Comfe_owner";

--
-- TOC entry 3685 (class 0 OID 0)
-- Dependencies: 323
-- Name: VIEW v_ranking_profesional_mes; Type: COMMENT; Schema: William Uribe; Owner: Comfe_owner
--

COMMENT ON VIEW "William Uribe".v_ranking_profesional_mes IS 'Ranking Por profesional y mes';


--
-- TOC entry 3439 (class 2604 OID 1654799)
-- Name: citas id; Type: DEFAULT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".citas ALTER COLUMN id SET DEFAULT nextval('"William Uribe".citas_id_seq'::regclass);


--
-- TOC entry 3438 (class 2604 OID 1654788)
-- Name: consultorios id; Type: DEFAULT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".consultorios ALTER COLUMN id SET DEFAULT nextval('"William Uribe".consultorios_id_seq'::regclass);


--
-- TOC entry 3434 (class 2604 OID 1630345)
-- Name: convenios id; Type: DEFAULT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".convenios ALTER COLUMN id SET DEFAULT nextval('"William Uribe".convenios_id_seq'::regclass);


--
-- TOC entry 3432 (class 2604 OID 1630277)
-- Name: departamentos id; Type: DEFAULT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".departamentos ALTER COLUMN id SET DEFAULT nextval('"William Uribe".departamento_id_seq'::regclass);


--
-- TOC entry 3441 (class 2604 OID 1736708)
-- Name: est_cita id; Type: DEFAULT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".est_cita ALTER COLUMN id SET DEFAULT nextval('"William Uribe".est_cita_id_seq'::regclass);


--
-- TOC entry 3433 (class 2604 OID 1630338)
-- Name: municipios id; Type: DEFAULT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".municipios ALTER COLUMN id SET DEFAULT nextval('"William Uribe".municipios_id_seq'::regclass);


--
-- TOC entry 3445 (class 2604 OID 1769538)
-- Name: pacientes id; Type: DEFAULT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".pacientes ALTER COLUMN id SET DEFAULT nextval('"William Uribe".pacientes_id_seq'::regclass);


--
-- TOC entry 3435 (class 2604 OID 1630359)
-- Name: profesionales id; Type: DEFAULT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".profesionales ALTER COLUMN id SET DEFAULT nextval('"William Uribe".profesionales_id_seq'::regclass);


--
-- TOC entry 3443 (class 2604 OID 1769484)
-- Name: profesiones id; Type: DEFAULT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".profesiones ALTER COLUMN id SET DEFAULT nextval('"William Uribe".profesiones_id_seq'::regclass);


--
-- TOC entry 3444 (class 2604 OID 1769503)
-- Name: tipo_doc id; Type: DEFAULT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".tipo_doc ALTER COLUMN id SET DEFAULT nextval('"William Uribe".tipo_doc_id_seq'::regclass);


--
-- TOC entry 3437 (class 2604 OID 1630422)
-- Name: tipos_citas id; Type: DEFAULT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".tipos_citas ALTER COLUMN id SET DEFAULT nextval('"William Uribe".especialidades_id_seq'::regclass);


--
-- TOC entry 3442 (class 2604 OID 1753096)
-- Name: usuarios id; Type: DEFAULT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".usuarios ALTER COLUMN id SET DEFAULT nextval('"William Uribe".usuarios_id_seq'::regclass);


--
-- TOC entry 3478 (class 2606 OID 1654804)
-- Name: citas citas_pkey; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".citas
    ADD CONSTRAINT citas_pkey PRIMARY KEY (id);


--
-- TOC entry 3474 (class 2606 OID 1654790)
-- Name: consultorios consultorios_pkey; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".consultorios
    ADD CONSTRAINT consultorios_pkey PRIMARY KEY (id);


--
-- TOC entry 3462 (class 2606 OID 1630347)
-- Name: convenios convenios_pkey; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".convenios
    ADD CONSTRAINT convenios_pkey PRIMARY KEY (id);


--
-- TOC entry 3456 (class 2606 OID 1630279)
-- Name: departamentos departamento_pkey; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".departamentos
    ADD CONSTRAINT departamento_pkey PRIMARY KEY (id);


--
-- TOC entry 3470 (class 2606 OID 1630424)
-- Name: tipos_citas especialidades_pkey; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".tipos_citas
    ADD CONSTRAINT especialidades_pkey PRIMARY KEY (id);


--
-- TOC entry 3480 (class 2606 OID 1736710)
-- Name: est_cita est_cita_pkey; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".est_cita
    ADD CONSTRAINT est_cita_pkey PRIMARY KEY (id);


--
-- TOC entry 3460 (class 2606 OID 1630340)
-- Name: municipios municipios_pkey; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".municipios
    ADD CONSTRAINT municipios_pkey PRIMARY KEY (id);


--
-- TOC entry 3496 (class 2606 OID 1769540)
-- Name: pacientes pacientes_pkey; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".pacientes
    ADD CONSTRAINT pacientes_pkey PRIMARY KEY (id);


--
-- TOC entry 3466 (class 2606 OID 1630361)
-- Name: profesionales profesionales_pkey; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".profesionales
    ADD CONSTRAINT profesionales_pkey PRIMARY KEY (id);


--
-- TOC entry 3488 (class 2606 OID 1769486)
-- Name: profesiones profesiones_pkey; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".profesiones
    ADD CONSTRAINT profesiones_pkey PRIMARY KEY (id);


--
-- TOC entry 3450 (class 2606 OID 1712197)
-- Name: consultorios solo_mayusc_consult; Type: CHECK CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE "William Uribe".consultorios
    ADD CONSTRAINT solo_mayusc_consult CHECK ((upper((nombre_consultorio)::text) = (nombre_consultorio)::text)) NOT VALID;


--
-- TOC entry 3448 (class 2606 OID 1712206)
-- Name: convenios solo_mayusc_convenio; Type: CHECK CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE "William Uribe".convenios
    ADD CONSTRAINT solo_mayusc_convenio CHECK ((upper((nom_convenio)::text) = (nom_convenio)::text)) NOT VALID;


--
-- TOC entry 3446 (class 2606 OID 1712207)
-- Name: departamentos solo_mayusc_depto; Type: CHECK CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE "William Uribe".departamentos
    ADD CONSTRAINT solo_mayusc_depto CHECK ((upper((nom_dpto)::text) = (nom_dpto)::text)) NOT VALID;


--
-- TOC entry 3451 (class 2606 OID 1744896)
-- Name: est_cita solo_mayusc_estado; Type: CHECK CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE "William Uribe".est_cita
    ADD CONSTRAINT solo_mayusc_estado CHECK ((upper((estado)::text) = (estado)::text)) NOT VALID;


--
-- TOC entry 3447 (class 2606 OID 1712216)
-- Name: municipios solo_mayusc_municp; Type: CHECK CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE "William Uribe".municipios
    ADD CONSTRAINT solo_mayusc_municp CHECK ((upper((nom_municip)::text) = (nom_municip)::text)) NOT VALID;


--
-- TOC entry 3449 (class 2606 OID 1712219)
-- Name: profesionales solo_mayusc_nombre_prof; Type: CHECK CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE "William Uribe".profesionales
    ADD CONSTRAINT solo_mayusc_nombre_prof CHECK ((upper((nombre_prof)::text) = (nombre_prof)::text)) NOT VALID;


--
-- TOC entry 3454 (class 2606 OID 1769541)
-- Name: pacientes solo_mayusc_paciente_nomb; Type: CHECK CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE "William Uribe".pacientes
    ADD CONSTRAINT solo_mayusc_paciente_nomb CHECK ((upper((nombre_completo)::text) = (nombre_completo)::text)) NOT VALID;


--
-- TOC entry 3492 (class 2606 OID 1769505)
-- Name: tipo_doc tipo_doc_pkey; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".tipo_doc
    ADD CONSTRAINT tipo_doc_pkey PRIMARY KEY (id);


--
-- TOC entry 3453 (class 2606 OID 1769508)
-- Name: tipo_doc tipodoc_mayus; Type: CHECK CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE "William Uribe".tipo_doc
    ADD CONSTRAINT tipodoc_mayus CHECK ((upper((tipo_doc)::text) = (tipo_doc)::text)) NOT VALID;


--
-- TOC entry 3476 (class 2606 OID 1769494)
-- Name: consultorios unico_consultorio; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".consultorios
    ADD CONSTRAINT unico_consultorio UNIQUE (nombre_consultorio);


--
-- TOC entry 3464 (class 2606 OID 1769492)
-- Name: convenios unico_convenio; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".convenios
    ADD CONSTRAINT unico_convenio UNIQUE (nom_convenio);


--
-- TOC entry 3458 (class 2606 OID 1769490)
-- Name: departamentos unico_depto; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".departamentos
    ADD CONSTRAINT unico_depto UNIQUE (nom_dpto);


--
-- TOC entry 3482 (class 2606 OID 1769473)
-- Name: usuarios unico_nombre; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".usuarios
    ADD CONSTRAINT unico_nombre UNIQUE (nom_usr);


--
-- TOC entry 3468 (class 2606 OID 1769479)
-- Name: profesionales unico_nombreprof; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".profesionales
    ADD CONSTRAINT unico_nombreprof UNIQUE (nombre_prof);


--
-- TOC entry 3490 (class 2606 OID 1769488)
-- Name: profesiones unico_profesiones; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".profesiones
    ADD CONSTRAINT unico_profesiones UNIQUE (profesion);


--
-- TOC entry 3472 (class 2606 OID 1769477)
-- Name: tipos_citas unico_tipocita; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".tipos_citas
    ADD CONSTRAINT unico_tipocita UNIQUE (tipo_cita);


--
-- TOC entry 3494 (class 2606 OID 1769507)
-- Name: tipo_doc unico_tipodoc; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".tipo_doc
    ADD CONSTRAINT unico_tipodoc UNIQUE (tipo_doc);


--
-- TOC entry 3484 (class 2606 OID 1769475)
-- Name: usuarios unico_usr; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".usuarios
    ADD CONSTRAINT unico_usr UNIQUE ("user");


--
-- TOC entry 3486 (class 2606 OID 1753099)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 3499 (class 2606 OID 1785881)
-- Name: citas fk_consultorio; Type: FK CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".citas
    ADD CONSTRAINT fk_consultorio FOREIGN KEY (consultorios_id) REFERENCES "William Uribe".consultorios(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3500 (class 2606 OID 1785876)
-- Name: citas fk_convenios; Type: FK CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".citas
    ADD CONSTRAINT fk_convenios FOREIGN KEY (convenios_id) REFERENCES "William Uribe".convenios(id) NOT VALID;


--
-- TOC entry 3506 (class 2606 OID 1785906)
-- Name: pacientes fk_dpto; Type: FK CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".pacientes
    ADD CONSTRAINT fk_dpto FOREIGN KEY (departamentos_id) REFERENCES "William Uribe".departamentos(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3501 (class 2606 OID 1785896)
-- Name: citas fk_estcita; Type: FK CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".citas
    ADD CONSTRAINT fk_estcita FOREIGN KEY (est_cita_id) REFERENCES "William Uribe".est_cita(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3507 (class 2606 OID 1785911)
-- Name: pacientes fk_mnpio; Type: FK CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".pacientes
    ADD CONSTRAINT fk_mnpio FOREIGN KEY (municipios_id) REFERENCES "William Uribe".municipios(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3497 (class 2606 OID 1785866)
-- Name: municipios fk_munip; Type: FK CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".municipios
    ADD CONSTRAINT fk_munip FOREIGN KEY (departamentos_id) REFERENCES "William Uribe".departamentos(id) NOT VALID;


--
-- TOC entry 3502 (class 2606 OID 1785871)
-- Name: citas fk_pacientes; Type: FK CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".citas
    ADD CONSTRAINT fk_pacientes FOREIGN KEY (pacientes_id) REFERENCES "William Uribe".pacientes(id) NOT VALID;


--
-- TOC entry 3503 (class 2606 OID 1785886)
-- Name: citas fk_profesional; Type: FK CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".citas
    ADD CONSTRAINT fk_profesional FOREIGN KEY (profesionales_id) REFERENCES "William Uribe".profesionales(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3498 (class 2606 OID 1785856)
-- Name: profesionales fk_profesiones; Type: FK CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".profesionales
    ADD CONSTRAINT fk_profesiones FOREIGN KEY (profesiones_id) REFERENCES "William Uribe".profesiones(id) NOT VALID;


--
-- TOC entry 3504 (class 2606 OID 1785891)
-- Name: citas fk_tipo_cita; Type: FK CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".citas
    ADD CONSTRAINT fk_tipo_cita FOREIGN KEY (tipos_citas_id) REFERENCES "William Uribe".tipos_citas(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3508 (class 2606 OID 1785861)
-- Name: pacientes fk_tipodoc; Type: FK CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".pacientes
    ADD CONSTRAINT fk_tipodoc FOREIGN KEY (tipo_doc_id) REFERENCES "William Uribe".tipo_doc(id) NOT VALID;


--
-- TOC entry 3505 (class 2606 OID 1785901)
-- Name: citas fk_users; Type: FK CONSTRAINT; Schema: William Uribe; Owner: Comfe_owner
--

ALTER TABLE ONLY "William Uribe".citas
    ADD CONSTRAINT fk_users FOREIGN KEY (usuarios_id) REFERENCES "William Uribe".usuarios(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


-- Completed on 2025-03-12 20:41:12

--
-- PostgreSQL database dump complete
--

